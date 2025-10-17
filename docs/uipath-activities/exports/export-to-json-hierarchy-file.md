---
description: Export multiple documents' extraction results to a combined hierarchical JSON structure that preserves parameter groups, nested objects, and arrays (e.g., line items).
---

# Export To JSON File (Hierarchy)

Export the full document parameter hierarchy to JSON for one or more documents and save to the specified file path. This activity preserves structure (groups, nested objects, arrays/line items) alongside values, enabling downstream systems to consume context-rich results rather than flattened tables.

## Properties

- Input
    - Document Ids
        - Type: `List<int>`
        - Description: A list of unique identifiers for the documents to be exported to JSON. This is a required argument.
    - Document Category Ids
        - Type: `List<int?>`
        - Description: A list of unique identifiers for the document categories used to limit export results. This is an optional argument.
    - Combine By External ID
        - Type: `bool`
        - Description: Specifies whether to combine the output by the document's External ID property. When enabled, entries with the same External ID are grouped/merged in the output.
        - Default Value: `false`

## Usage

1. Setup Activity
    - Add the “Export To JSON (Hierarchy)” activity to your UiPath workflow.
    - Configure required inputs:
        - Document Ids: Provide the list of document IDs to export.
    - Optional inputs:
        - Document Category Ids: Restrict export to specific categories.
        - Combine By External ID: Set to `true` to merge/group documents sharing the same External ID.

2. Execution
    - The activity executes asynchronously, retrieves the hierarchical parameter structure for each specified document, and compiles the results into a single combined JSON value.
    - If Combine By External ID is enabled, entries sharing the same External ID are merged/grouped under that identifier in the output.

3. Output
    - Returns a `string` containing the combined hierarchical JSON for the selected documents.

## Output Structure

The JSON preserves:

- Nested parameter groups (e.g., header, parties, totals).
- Arrays/collections (e.g., line items).
- Typed values as extracted by AIForged (strings, numbers, dates).
- Optional metadata may be included by the pipeline (e.g., confidence, page indices, coordinates, verification status) if available.

### Example (single document result)

```json
{
  "DocId": "12345",
  "ServiceId": "123",
  "Status": "Processed",
  "ExtractionResults": {
    "Fields": {
      "InvoiceNumber": { "value": "INV-1001", "confidence": 0.98 },
      "IssueDate": { "value": "2025-08-15", "confidence": 0.97 },
      "Supplier": {
        "Name": { "value": "Acme Corp", "confidence": 0.96 },
        "TaxId": { "value": "123456789", "confidence": 0.95 }
      }
    },
    "Tables": {
      "lineItems": [
        {
          "Description": { "value": "Widget", "confidence": 0.90 },
          "Quantity": { "value": 5, "confidence": 0.92 },
          "UnitPrice": { "value": 19.99, "confidence": 0.89 },
          "Total": { "value": 99.95, "confidence": 0.91 }
        }
      ]
    },
    "Clusters": {
      "totals": {
        "SubTotal": { "value": 99.95, "confidence": 0.91 },
        "Tax": { "value": 15.99, "confidence": 0.87 },
        "GrandTotal": { "value": 115.94, "confidence": 0.93 },
        "Currency": { "value": "USD", "confidence": 0.99 }
      }
    }
  }
}
```

### Example (combined output, multiple documents)

When Combine By External ID = false:

- The output is typically an array of document objects.

```json
[
  {
    "documentId": 12345,
    "externalId": "INV-1001",
    "serviceId": "invoice_extractor",
    "status": "Processed",
    "results": { /* ...hierarchical content... */ }
  },
  {
    "documentId": 12346,
    "externalId": "INV-1002",
    "serviceId": "invoice_extractor",
    "status": "Processed",
    "results": { /* ...hierarchical content... */ }
  }
]
```

When Combine By External ID = true:

- The output groups/merges by external ID. A common pattern is an object keyed by external ID (or an array of groups), each containing one or more documents and a combined view.

```json
{
  "INV-1001": {
    "documents": [
      { "documentId": 12345, "status": "Processed", "results": { /* ... */ } },
      { "documentId": 12347, "status": "Processed", "results": { /* ... */ } }
    ],
    "combinedResults": {
      "Invoice": {
        "header": {
          "InvoiceNumber": { "value": "INV-1001" },
          "Supplier": { "Name": { "value": "Acme Corp" } }
        },
        "lineItems": [
          /* merged items from both documents if applicable */
        ],
        "totals": {
          /* merged totals where applicable */
        }
      }
    }
  },
  "INV-1002": {
    "documents": [
      { "documentId": 12346, "status": "Processed", "results": { /* ... */ } }
    ],
    "combinedResults": { /* ... */ }
  }
}
```

Note: The exact shape for grouping/merging may vary depending on your extraction pipeline and the activity’s configuration. Downstream consumers should be prepared to handle nested objects and arrays.

## Considerations

- Data Selection
    - Ensure Document Ids are valid and accessible to avoid export errors.
- Category Filtering
    - Use Document Category Ids to target specific subsets of documents.
- Structure Preservation
    - The hierarchical output retains the relationships between fields (e.g., header vs line items).
- Downstream Handling
    - Consumers must handle nested objects and arrays; the structure is ideal for ETL, APIs, data lakes, and analytics that benefit from schema fidelity.
- Combining Entries
    - When Combine By External ID is enabled, entries sharing the same external ID are grouped/merged. Ensure the External ID is consistently populated across documents to achieve the expected output.
    - If conflicting fields exist across merged documents, review your post-processing logic (e.g., pick highest-confidence value, last-write-wins, or aggregate arrays) to maintain data quality.

## Typical Workflow Integration

1. Initialize context once at the start of your sequence or library entry point.
2. Process or verify documents as needed.
3. Invoke Export To JSON (Hierarchy) with the relevant Document Ids.
4. Persist the JSON string to a file, database, or send to an API.
5. Optionally, transform the hierarchical JSON to your target schema.
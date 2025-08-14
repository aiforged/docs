---
description: Export multiple documents' extraction results to a combined JSON structure.
---

# Export To JSON

**Properties**

* **Input**
  * **Document Ids**
    * **Type:**`List<int>`
    * **Description:** A list of unique identifiers for the documents to be exported to JSON. This is a required argument.
  * **Document Category Ids**
    * **Type:**`List<int?>`
    * **Description:** A list of unique identifiers for the document categories used to limit export results. This is an optional argument.
  * **Combine By External ID**
    * **Type:**`bool`
    * **Description:** Specifies whether to combine the output by the document's external ID property. This is an optional argument.
    * **Default Value:**`false`

**Usage**

1. **Setup Activity:**
   * Add the "Export To JSON" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Ids:** Provide a list of document IDs whose extraction results you wish to export.
   * Optionally, specify:
     * **Document Category Ids:** Limit the export results to specific document categories by providing their IDs.
     * **Combine By External ID:** Set to`true`if you want to combine JSON entries based on the document's external ID.
2. **Execution:**
   * The activity executes asynchronously, retrieving the specified documents' extraction results and compiling them into a combined JSON structure.
   * If`Combine By External ID`is enabled, JSON entries with the same external ID will be merged in the output structure.
3. **Output:**
   * The activity returns a`string`representing the JSON structure containing the extraction results for the specified documents.

**Considerations**

* **Data Selection:** Ensure that the document IDs are accurate and accessible to avoid errors during the export process.
* **Category Filtering:** Use document category IDs to refine the export results, focusing on specific subsets of documents if needed.
* **Data Handling:** The resulting JSON provides a flexible format for the extracted data, suitable for integration, analysis, or reporting within your workflow.
* **Combining Entries:** When combining by external ID, ensure that the external ID field is consistently populated across documents to achieve the desired output.


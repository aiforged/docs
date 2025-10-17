---
description: Export a document's extraction results to a CSV list.
---

# Export Results To CSV

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the project whose documents are to be exported to CSV. This is a required argument.
  * **Service Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the service associated with the documents to be exported. This is a required argument.
  * **Document Ids**
    * **Type:**`List<int>`
    * **Description:** A list of unique identifiers for the documents to be exported to CSV. This is a required argument.
  * **CSV Separator**
    * **Type:**`string`
    * **Description:** The separator to use for CSV fields. This is a required argument.
    * **Default Value:**`";"`
  * **Document Category Ids**
    * **Type:**`List<int?>`
    * **Description:** A list of unique identifiers for the document categories used to limit export results. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Export To CSV" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Project Id:** Specify the ID of the project containing the documents.
     * **Service Id:** Specify the ID of the service associated with the documents.
     * **Document Ids:** Provide a list of document IDs to export.
     * **CSV Separator:** Define the separator character to use in the CSV file.
   * Optionally, specify:
     * **Document Category Ids:** Limit the export results to specific document categories by providing their IDs.
2. **Execution:**
   * The activity executes asynchronously, exporting the specified documents' extraction results to a CSV list.
   * It uses the configured API context to retrieve and process the extraction results, creating CSV-formatted strings.
3. **Output:**
   * The activity returns a`List<string>`, where each string represents a line in the CSV file, starting with column headers followed by the data rows.

**Considerations**

* **Data Selection:** Ensure that the document IDs, project ID, and service ID are accurate and accessible to avoid errors during the export process.
* **CSV Formatting:** The chosen CSV separator should not conflict with the data content to ensure proper CSV formatting.
* **Category Filtering:** Use document category IDs to refine the export results, focusing on specific subsets of documents if needed.


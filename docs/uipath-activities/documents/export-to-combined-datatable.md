---
description: Export a document's extraction results to a combined DataTable.
---

# Export To Combined DataTable

**Properties**

* **Input**
  * **Document Ids**
    * **Type:**`List<int>`
    * **Description:** A list of unique identifiers for the documents to be exported to a combined DataTable. This is a required argument.
  * **Document Category Ids**
    * **Type:**`List<int?>`
    * **Description:** A list of unique identifiers for the document categories used to limit export results. This is an optional argument.
  * **Combine By External ID**
    * **Type:**`bool`
    * **Description:** Specifies whether to combine the output by the document's external ID property. This is an optional argument.
    * **Default Value:**`false`

**Usage**

1. **Setup Activity:**
   * Add the "Export To Combined DataTable" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Ids:** Provide a list of document IDs whose extraction results you wish to export.
   * Optionally, specify:
     * **Document Category Ids:** Limit the export results to specific document categories by providing their IDs.
     * **Combine By External ID:** Set to`true`if you want to combine rows in the DataTable based on the document's external ID.
2. **Execution:**
   * The activity executes asynchronously, retrieving the specified documents' extraction results and compiling them into a combined DataTable.
   * If`Combine By External ID`is enabled, rows with the same external ID will be merged in the output DataTable.
3. **Output:**
   * The activity returns a`List<DataTable>`, where each DataTable contains the combined extraction results for the specified documents.

**Considerations**

* **Data Selection:** Ensure that the document IDs are accurate and accessible to avoid errors during the export process.
* **Category Filtering:** Use document category IDs to refine the export results, focusing on specific subsets of documents if needed.
* **Data Handling:** The resulting DataTables provide a structured format for the extracted data, suitable for further processing, analysis, or reporting within your workflow.
* **Combining Rows:** When combining by external ID, ensure that the external ID field is consistently populated across documents to achieve the desired output.
 IgnoreCase Multiline IgnoreCase Multiline

---
description: Export a document's extraction results to a list of DataTable.
---

# Export To DataTable

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the project whose documents are to be exported to DataTable. This is a required argument.
  * **Service Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the service associated with the documents to be exported. This is a required argument.
  * **Document Ids**
    * **Type:**`List<int>`
    * **Description:** A list of unique identifiers for the documents to be exported to DataTable. This is a required argument.
  * **Document Category Ids**
    * **Type:**`List<int?>`
    * **Description:** A list of unique identifiers for the document categories used to limit export results. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Export To DataTable" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Project Id:** Specify the ID of the project containing the documents.
     * **Service Id:** Specify the ID of the service associated with the documents.
     * **Document Ids:** Provide a list of document IDs to export.
   * Optionally, specify:
     * **Document Category Ids:** Limit the export results to specific document categories by providing their IDs.
2. **Execution:**
   * The activity executes asynchronously, retrieving the specified documents' extraction results and compiling them into a list of DataTables.
   * It uses the configured API context to gather and process the extraction data.
3. **Output:**
   * The activity returns a`List<DataTable>`, where each DataTable contains the extraction results for a set of documents.

**Considerations**

* **Data Selection:** Ensure that the document IDs, project ID, and service ID are accurate and accessible to avoid errors during the export process.
* **Category Filtering:** Use document category IDs to refine the export results, focusing on specific subsets of documents if needed.
* **Data Handling:** The resulting DataTables can be used for further processing, analysis, or reporting within your workflow, providing a structured format for the extracted data.


---
description: Export a document's extraction results to a CSV file.
---

# Export To CSV File

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the project whose documents are to be exported to a CSV file. This is a required argument.
  * **Service Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the service associated with the documents to be exported. This is a required argument.
  * **Document Ids**
    * **Type:**`List<int>`
    * **Description:** A list of unique identifiers for the documents to be exported to a CSV file. This is a required argument.
  * **CSV Separator**
    * **Type:**`string`
    * **Description:** The separator to use for CSV fields. This is a required argument.
    * **Default Value:**`";"`
  * **File Path**
    * **Type:**`string`
    * **Description:** The path where the CSV file should be saved. This is a required argument.
    * **Default Value:**`"export.csv"`
  * **Document Category Ids**
    * **Type:**`List<int?>`
    * **Description:** A list of unique identifiers for the document categories used to limit export results. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Export To CSV File" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Project Id:** Specify the ID of the project containing the documents.
     * **Service Id:** Specify the ID of the service associated with the documents.
     * **Document Ids:** Provide a list of document IDs to export.
     * **CSV Separator:** Define the separator character to use in the CSV file.
     * **File Path:** Specify the file path where the CSV file should be saved.
   * Optionally, specify:
     * **Document Category Ids:** Limit the export results to specific document categories by providing their IDs.
2. **Execution:**
   * The activity executes asynchronously, exporting the specified documents' extraction results to a CSV file at the given file path.
   * It uses the configured API context to retrieve and process the extraction results, writing them to the CSV file.
3. **Output:**
   * The activity returns a`string`representing the file path of the saved CSV file, confirming where the export has been saved.

**Considerations**

* **Data Selection:** Ensure that the document IDs, project ID, and service ID are accurate and accessible to avoid errors during the export process.
* **CSV Formatting:** The chosen CSV separator should not conflict with the data content to ensure proper CSV formatting.
* **File Path:** Ensure that the specified file path is valid and accessible. The application must have write permissions to save the file at the specified location.
* **Category Filtering:** Use document category IDs to refine the export results, focusing on specific subsets of documents if needed.
 IgnoreCase Multiline IgnoreCase Multiline

---
description: Export multiple documents' extraction results to a combined CSV file.
---

# Export Results To CSV Combined File

**Properties**

* **Input**
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
  * **Combine By External ID**
    * **Type:**`bool`
    * **Description:** Specifies whether to combine output by the document's external ID property. This is an optional argument.
    * **Default Value:**`false`

**Usage**

1. **Setup Activity:**
   * Add the "Export To CSV Combined File" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Ids:** Provide a list of document IDs whose extraction results you wish to export.
     * **CSV Separator:** Define the separator character to use in the CSV file.
     * **File Path:** Specify the file path where the CSV file should be saved.
   * Optionally, specify:
     * **Document Category Ids:** Limit the export results to specific document categories by providing their IDs.
     * **Combine By External ID:** Set to`true`if you want to combine rows in the CSV based on the document's external ID.
2. **Execution:**
   * The activity executes asynchronously, exporting the specified documents' extraction results to a CSV file at the given file path.
   * If`Combine By External ID`is enabled, rows with the same external ID will be merged in the CSV output.
3. **Output:**
   * The activity returns a`string`representing the file path of the saved CSV file, confirming where the export has been saved.

**Considerations**

* **Data Selection:** Ensure that the document IDs are accurate and accessible to avoid errors during the export process.
* **CSV Formatting:** The chosen CSV separator should not conflict with the data content to ensure proper CSV formatting.
* **File Path:** Ensure that the specified file path is valid and accessible. The application must have write permissions to save the file at the specified location.
* **Category Filtering:** Use document category IDs to refine the export results, focusing on specific subsets of documents if needed.
* **Combining Rows:** When combining by external ID, ensure that the external ID field is consistently populated across documents to achieve the desired output.


---
description: Export multiple documents' extraction results to a combined JSON file.
---

# Export Results To JSON Combined File

**Properties**

* **Input**
  * **Document Ids**
    * **Type:**`List<int>`
    * **Description:** A list of unique identifiers for the documents to be exported to a JSON file. This is a required argument.
  * **File Path**
    * **Type:**`string`
    * **Description:** The path where the JSON file should be saved. This is a required argument.
    * **Default Value:**`"export.json"`
  * **Document Category Ids**
    * **Type:**`List<int?>`
    * **Description:** A list of unique identifiers for the document categories used to limit export results. This is an optional argument.
  * **Combine By External ID**
    * **Type:**`bool`
    * **Description:** Specifies whether to combine the output by the document's external ID property. This is an optional argument.
    * **Default Value:**`false`

**Usage**

1. **Setup Activity:**
   * Add the "Export To JSON Combined File" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Ids:** Provide a list of document IDs whose extraction results you wish to export.
     * **File Path:** Specify the file path where the JSON file should be saved.
   * Optionally, specify:
     * **Document Category Ids:** Limit the export results to specific document categories by providing their IDs.
     * **Combine By External ID:** Set to`true`if you want to combine JSON entries based on the document's external ID.
2. **Execution:**
   * The activity executes asynchronously, retrieving the specified documents' extraction results and compiling them into a combined JSON structure.
   * The JSON structure is then saved to the specified file path.
   * If`Combine By External ID`is enabled, JSON entries with the same external ID will be merged in the output structure.
3. **Output:**
   * The activity returns a`string`representing the JSON structure that has been saved to the specified file path.

**Considerations**

* **Data Selection:** Ensure that the document IDs are accurate and accessible to avoid errors during the export process.
* **File Path:** Ensure that the specified file path is valid and accessible. The application must have write permissions to save the file at the specified location.
* **Category Filtering:** Use document category IDs to refine the export results, focusing on specific subsets of documents if needed.
* **Combining Entries:** When combining by external ID, ensure that the external ID field is consistently populated across documents to achieve the desired output.


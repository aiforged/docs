---
description: Upload documents from a given folder path.
---

# Upload Folder

**Properties**

* **Input**
  * **Target Project Id**
    * **Type:**`int`
    * **Description:** The unique project identifier where you want to upload the documents. This is a required argument.
  * **Target Service Id**
    * **Type:**`int`
    * **Description:** The unique service identifier where you want to upload the documents. This is a required argument.
  * **Usage Type**
    * **Type:**`AIForged.API.UsageType`
    * **Description:** The usage type for the uploaded documents (e.g.,`UsageType.Inbox`). This is an optional argument with a default value of`UsageType.Inbox`.
  * **Document Status**
    * **Type:**`DocumentStatus`
    * **Description:** The status for the uploaded documents (e.g.,`DocumentStatus.Received`). This is an optional argument with a default value of`DocumentStatus.Received`.
  * **Folderpath**
    * **Type:**`string`
    * **Description:** The folder path from which documents should be uploaded. This is a required argument.
  * **Recursive**
    * **Type:**`bool`
    * **Description:** Specifies whether to load documents recursively from subfolders. This is a required argument.
  * **Document Category Id**
    * **Type:**`int?`
    * **Description:** The unique category identifier for the uploaded documents. This is an optional argument.
  * **Master Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the master/parent document. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Upload Folder" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Target Project Id:** Specify the project ID where the documents will be uploaded.
     * **Target Service Id:** Specify the service ID where the documents will be uploaded.
     * **Folderpath:** Provide the folder path from which documents will be uploaded.
     * **Recursive:** Indicate whether to include documents from subfolders.
   * Optionally, specify:
     * **Usage Type:** Define the usage type for the documents.
     * **Document Status:** Define the status for the documents.
     * **Document Category Id:** Specify a category ID for the documents.
     * **Master Id:** Specify a master document ID if applicable.
2. **Execution:**
   * The activity executes asynchronously, reading all files from the specified folder path and uploading them to the specified project and service with the defined properties.
   * It uses the configured API context to perform the upload operation via the document client.
3. **Output:**
   * The activity returns a`List<DocumentViewModel>`, representing the uploaded documents with their metadata and system-assigned IDs.

**Considerations**

* **File Accessibility:** Ensure all files in the specified folder path are accessible and not locked by other processes to avoid errors during upload.
* **Data Integrity:** Verify that the files contain the correct data and metadata before uploading to avoid errors or misclassification.
* **Permissions:** Ensure the necessary permissions are in place for the user or application performing the upload operation to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as file access errors or network connectivity problems.
* **Recursive Option:** Be mindful of the recursive option, as it may result in uploading a large number of files, affecting performance and execution time.

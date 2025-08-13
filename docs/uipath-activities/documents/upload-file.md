---
description: Upload a new document from a given filepath.
---

# Upload File

**Properties**

* **Input**
  * **Target Project Id**
    * **Type:**`int`
    * **Description:** The unique project identifier where you want to upload the document. This is a required argument.
  * **Target Service Id**
    * **Type:**`int`
    * **Description:** The unique service identifier where you want to upload the document. This is a required argument.
  * **Usage Type**
    * **Type:**`AIForged.API.UsageType`
    * **Description:** The usage type for the uploaded document (e.g.,`UsageType.Inbox`). This is an optional argument with a default value of`UsageType.Inbox`.
  * **Document Status**
    * **Type:**`DocumentStatus`
    * **Description:** The status for the uploaded document (e.g.,`DocumentStatus.Received`). This is an optional argument with a default value of`DocumentStatus.Received`.
  * **Filepath**
    * **Type:**`string`
    * **Description:** The filepath of the document to upload. This is a required argument.
  * **Document Category Id**
    * **Type:**`int?`
    * **Description:** The unique category identifier for the uploaded document. This is an optional argument.
  * **Master Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the master/parent document. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Upload File" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Target Project Id:** Specify the project ID where the document will be uploaded.
     * **Target Service Id:** Specify the service ID where the document will be uploaded.
     * **Filepath:** Provide the filepath of the document to be uploaded.
   * Optionally, specify:
     * **Usage Type:** Define the usage type for the document.
     * **Document Status:** Define the status for the document.
     * **Document Category Id:** Specify a category ID for the document.
     * **Master Id:** Specify a master document ID if applicable.
2. **Execution:**
   * The activity executes asynchronously, reading the file from the specified filepath and uploading it to the specified project and service with the defined properties.
   * It uses the configured API context to perform the upload operation via the document client.
3. **Output:**
   * The activity returns a`List<DocumentViewModel>`, representing the uploaded document(s) with their metadata and system-assigned IDs.

**Considerations**

* **File Accessibility:** Ensure the file at the specified filepath is accessible and not locked by other processes to avoid errors during upload.
* **Data Integrity:** Verify that the file contains the correct data and metadata before uploading to avoid errors or misclassification.
* **Permissions:** Ensure the necessary permissions are in place for the user or application performing the upload operation to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as file access errors or network connectivity problems.
 IgnoreCase Multiline IgnoreCase Multiline

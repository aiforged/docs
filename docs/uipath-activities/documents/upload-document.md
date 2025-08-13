---
description: Upload a new document to a service.
---

# Upload Document

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
  * **Filename**
    * **Type:**`string`
    * **Description:** The filename of the uploaded document. This is a required argument.
  * **Document Data**
    * **Type:**`byte[]`
    * **Description:** The document in byte format. This is a required argument.
  * **Document Category Id**
    * **Type:**`int?`
    * **Description:** The unique category identifier for the uploaded document. This is an optional argument.
  * **Master Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the master/parent document. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Upload Document" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Target Project Id:** Specify the project ID where the document will be uploaded.
     * **Target Service Id:** Specify the service ID where the document will be uploaded.
     * **Filename:** Provide the filename for the document.
     * **Document Data:** Provide the document data in byte format.
   * Optionally, specify:
     * **Usage Type:** Define the usage type for the document.
     * **Document Status:** Define the status for the document.
     * **Document Category Id:** Specify a category ID for the document.
     * **Master Id:** Specify a master document ID if applicable.
2. **Execution:**
   * The activity executes asynchronously, uploading the document to the specified project and service with the defined properties.
   * It uses the configured API context to perform the upload operation via the document client.
3. **Output:**
   * The activity returns a`List<DocumentViewModel>`, representing the uploaded document(s) with their metadata and system-assigned IDs.

**Considerations**

* **Data Integrity:** Ensure that the document data and metadata are correct and complete before uploading to avoid errors or misclassification.
* **Permissions:** Verify that the necessary permissions are in place for the user or application performing the upload operation to prevent unauthorized actions.
* **Filename and Data:** Ensure the filename is valid and that the document data is correctly encoded to ensure successful upload and retrieval.

---
description: Update a document's status.
---

# Update Document Status

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document whose status you wish to update. This is a required argument.
  * **Document Status**
    * **Type:**`DocumentStatus`
    * **Description:** The new status to be assigned to the document. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Update Document Status" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Id:** Provide the ID of the document whose status needs to be updated.
     * **Document Status:** Specify the new status for the document.
2. **Execution:**
   * The activity executes asynchronously, retrieving the specified document, updating its status, and then saving the changes.
   * It uses the configured API context to access and update the document data via the document client.
3. **Output:**
   * The activity returns an updated`DocumentViewModel`, representing the document with the newly applied status.

**Considerations**

* **Data Integrity:** Ensure that the document ID is valid and accessible to avoid errors during the update process.
* **Concurrency:** Be cautious when updating document status in environments where multiple processes might access or modify the same document simultaneously to prevent data inconsistency.
* **Logging:** The activity includes error logging, which can be enabled through the API configuration for troubleshooting purposes.
* **Permissions:** Verify that the necessary permissions are in place for the user or application performing the update operation to prevent unauthorized actions.


---
description: Delete a document by its unique identifier.
---

# Delete Document

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document to be deleted. This is a required argument.
  * **Delete Recursively**
    * **Type:**`bool?`
    * **Description:** Specifies whether to delete all linked documents recursively. This is a required argument.
  * **Delete Training Documents**
    * **Type:**`bool?`
    * **Description:** Specifies whether to also delete training documents when deleting documents recursively. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Delete Document" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Id:** Provide the ID of the document you wish to delete.
     * **Delete Recursively:** Set this to`true`if you want to delete all linked documents recursively.
     * **Delete Training Documents:** Set this to`true`if you also wish to delete any associated training documents when deleting recursively.
2. **Execution:**
   * The activity executes asynchronously, deleting the specified document.
   * If`Delete Recursively`is set to`true`, all documents linked to the specified document will also be deleted.
   * If`Delete Training Documents`is set to`true`and`Delete Recursively`is enabled, associated training documents will be included in the deletion process.
3. **Output:**
   * The activity returns a`DocumentViewModel`representing the deleted document. This can be used to confirm the deletion or log the document details.

**Considerations**

* **Data Integrity:** Ensure that the document ID is valid and accessible to avoid errors during deletion.
* **Cascading Deletions:** Be cautious when setting the`Delete Recursively`and`Delete Training Documents`flags, as these will result in multiple documents being deleted, which may impact related workflows or data integrity.
* **Irreversible Action:** Deleting documents is usually irreversible, so ensure that backups or confirmations are in place if needed.
 IgnoreCase Multiline IgnoreCase Multiline

---
description: Update a document's information.
---

# Update Document Information

**Properties**

* **Input**
  * **Document Object**
    * **Type:**`DocumentViewModel`
    * **Description:** The updated document data view model. Use the "Get Document" activity to retrieve this object and modify its properties before updating. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Update Document Information" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Document Object:** Provide the`DocumentViewModel`object with updated information. Retrieve this object using the "Get Document" activity, make necessary changes, and then pass it to this activity.
2. **Execution:**
   * The activity executes asynchronously, updating the document information in the system with the data provided in the`DocumentViewModel`.
   * It uses the configured API context to perform the update operation via the document client.
3. **Output:**
   * The activity returns an updated`DocumentViewModel`, representing the document with the applied changes.

**Considerations**

* **Data Integrity:** Ensure that the`DocumentViewModel`contains all necessary and correct information before updating to avoid unintended changes.
* **Concurrency:** Be cautious when updating document information in environments where multiple processes might access or modify the same document simultaneously to prevent data inconsistency.
* **Permissions:** Verify that the necessary permissions are in place for the user or application performing the update operation to prevent unauthorized actions.
 IgnoreCase Multiline IgnoreCase Multiline

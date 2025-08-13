---
description: Update a work item's status.
---

# Update Work Item

**Properties**

* **Input**
  * **Work Item Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the work item whose status you want to update. This is a required argument.
  * **Status**
    * **Type:**`WorkItemStatus?`
    * **Description:** The new status to set for the work item (e.g.,`WorkItemStatus.Completed`). This is a required argument.
    * **Default Value:**`WorkItemStatus.Created`

**Usage**

1. **Setup Activity:**
   * Add the "Update Work Item Status" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Work Item Id:** Provide the unique identifier of the work item whose status you want to update.
     * **Status:** Specify the new status for the work item.
2. **Execution:**
   * The activity executes asynchronously, updating the status of the specified work item.
   * It uses the configured API context to perform the status update via the work item client.
3. **Output:**
   * The activity returns a`bool`, indicating the success of the status update operation:
     * `true`if the status was successfully updated.
     * `false`if the operation failed.

**Considerations**

* **Data Integrity:** Ensure that the work item ID is correctly specified to avoid errors during the status update. The ID must match exactly as stored in the system.
* **Permissions:** Verify that the necessary permissions are in place for the user or application updating the work item status to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.
* **Status Transition:** Consider the logical flow of status transitions within your workflow, ensuring that status updates reflect the intended state of the work item.
 IgnoreCase Multiline IgnoreCase Multiline

---
description: Flag a notification object as read by its unique identifier.
---

# Flag As Read

**Properties**

* **Input**
  * **Notification Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the notification to flag as read. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Flag As Read" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Notification Id:** Provide the ID of the notification that you want to flag as read.
2. **Execution:**
   * The activity executes asynchronously, marking the specified notification as read in the AIForged notification subsystem.
   * It uses the configured API context to perform the update via the notification client.
3. **Output:**
   * The activity returns a`bool`, indicating the success of the operation:
     * `true`if the notification was successfully flagged as read.
     * `false`if the operation failed.

**Considerations**

* **Data Integrity:** Ensure that the notification ID is valid and corresponds to an existing notification to avoid errors during the operation.
* **Permissions:** Verify that the necessary permissions are in place for the user or application flagging the notification to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.

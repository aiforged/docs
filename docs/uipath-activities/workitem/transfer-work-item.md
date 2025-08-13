---
description: Transfer a work item to another user.
---

# Transfer Work Item

**Properties**

* **Input**
  * **Work Item Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the work item to transfer. This is a required argument.
  * **User Id**
    * **Type:**`string`
    * **Description:** The user ID to transfer the work item to. This is a required argument.
  * **Comment**
    * **Type:**`string`
    * **Description:** The comment that will be visible to the user actioning the work item. This is an optional argument.
  * **Group Id**
    * **Type:**`int?`
    * **Description:** The group ID that contains the user(s) to transfer the work item to. This is an optional argument.
  * **Method**
    * **Type:**`WorkItemMethod?`
    * **Description:** The method used to transfer the work item (e.g.,`WorkItemMethod.Random`). This is an optional argument.
    * **Default Value:**`WorkItemMethod.Random`
  * **Roles**
    * **Type:**`List<GroupRoleType>`
    * **Description:** The user roles that this work item will be assigned to (e.g.,`verifydoc`or`verifyshred`). This is an optional argument.
  * **Reason**
    * **Type:**`WorkItemReason?`
    * **Description:** Work item reason (e.g.,`WorkItemAction.DataSet`). This is an optional argument.
  * **ReasonLookup**
    * **Type:**`int?`
    * **Description:** An optional reason lookup identifier. This is an optional argument.
  * **ReasonRecord**
    * **Type:**`int?`
    * **Description:** An optional reason record identifier. This is an optional argument.
  * **ReasonCode**
    * **Type:**`string`
    * **Description:** An optional reason code. This is an optional argument.
  * **ReasonDescription**
    * **Type:**`string`
    * **Description:** An optional reason description. This is an optional argument.
  * **ReasonComment**
    * **Type:**`string`
    * **Description:** An optional reason comment. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Transfer Work Item" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Work Item Id:** Provide the unique identifier of the work item to transfer.
     * **User Id:** Specify the user ID to whom the work item will be transferred.
   * Optionally, specify additional parameters such as group ID, method, roles, comments, and reasons.
2. **Execution:**
   * The activity executes asynchronously, transferring the specified work item to another user or group based on the defined options.
   * It uses the configured API context to perform the transfer via the work item client.
3. **Output:**
   * The activity returns a`WorkItemViewModel`, representing the transferred work item.

**Considerations**

* **Transfer Method:** Choose the appropriate method for transferring the work item, whether it's to a specific user, group, or based on roles.
* **Assignment Options:** Use the`Group Id`and`User Id`properties to control work item assignment. Specify roles if needed.
* **Performance:** Be mindful of the potential performance impact when transferring a large number of work items, and consider batching or throttling if necessary.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.

---
description: Escalate a work item to another user.
---

# Escalate Work Item

**Properties**

* **Input**
  * **Work Item Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the work item to escalate. This is a required argument.
  * **Method**
    * **Type:**`WorkItemMethod?`
    * **Description:** The method used to escalate the work item (e.g.,`WorkItemMethod.Random`). This is a required argument.
    * **Default Value:**`WorkItemMethod.Random`
  * **Group Id**
    * **Type:**`int?`
    * **Description:** The group ID that contains the user(s) to escalate the work item to. This is an optional argument.
  * **Roles**
    * **Type:**`List<GroupRoleType>`
    * **Description:** The user roles that this work item will be assigned to (e.g.,`verifydoc`or`verifyshred`). This is an optional argument.
  * **User Id**
    * **Type:**`string`
    * **Description:** The user ID to escalate the work item to. Only valid if Method is set to`WorkItemMethod.User`. This is an optional argument.
  * **Comment**
    * **Type:**`string`
    * **Description:** The comment that will be visible to the user actioning the work item. This is an optional argument.
  * **Grace Period**
    * **Type:**`TimeSpan?`
    * **Description:** The grace period allowed before the work item is automatically escalated to a different user. This is an optional argument.
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
   * Add the "Escalate Work Item" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Work Item Id:** Provide the unique identifier of the work item to escalate.
     * **Method:** Specify the method used to escalate the work item.
   * Optionally, specify additional parameters such as group ID, user ID, roles, comments, grace period, and reasons.
2. **Execution:**
   * The activity executes asynchronously, escalating the specified work item to another user or group based on the defined options.
   * It uses the configured API context to perform the escalation via the work item client.
3. **Output:**
   * The activity returns an`ObservableCollection<WorkItemViewModel>`, representing the escalated work item(s).

**Considerations**

* **Escalation Method:** Choose the appropriate method for escalation, whether it's to a specific user, group, or based on roles.
* **Assignment Options:** Use the`Group Id`and`User Id`properties to control work item assignment. Specify roles if needed.
* **Performance:** Be mindful of the potential performance impact when escalating a large number of work items, and consider batching or throttling if necessary.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.


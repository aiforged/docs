---
description: Create a new work item for a specified document or shred.
---

# Create Work Item

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the document this work item belongs to. Required if a Shred Id is not provided.
  * **Shred Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the shred this work item belongs to. Required if a Document Id is not provided.
  * **Comment**
    * **Type:**`string`
    * **Description:** The work item message. This is an optional argument.
  * **Method**
    * **Type:**`WorkItemMethod?`
    * **Description:** The work item method (e.g.,`WorkItemMethod.Random`). This is an optional argument.
    * **Default Value:**`WorkItemMethod.Random`
  * **Action**
    * **Type:**`WorkItemAction?`
    * **Description:** The work item action (e.g.,`WorkItemAction.Verify`). This is an optional argument.
    * **Default Value:**`WorkItemAction.Verify`
  * **Grace Period**
    * **Type:**`TimeSpan?`
    * **Description:** The grace period before the work item is escalated. This is an optional argument.
    * **Default Value:**`TimeSpan.FromDays(1)`
  * **To Group Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the group where this work item should be assigned. This is an optional argument.
  * **To User Id**
    * **Type:**`string`
    * **Description:** The unique identifier of the user to whom this work item should be assigned. This is an optional argument.
  * **Roles**
    * **Type:**`List<string>`
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
   * Add the "Create Work Item" activity to your UiPath workflow.
   * Configure the input arguments as required:
     * Provide either a **Document Id** or a **Shred Id**.
     * Optionally, specify additional parameters such as comments, method, action, grace period, assignment details, roles, and reasons.
2. **Execution:**
   * The activity executes asynchronously, creating a work item for the specified document or shred with the defined options.
   * It uses the configured API context to create the work item via the work item client.
3. **Output:**
   * The activity returns an`ObservableCollection<WorkItemViewModel>`, representing the created work item(s).

**Considerations**

* **Document or Shred:** Ensure that either a document ID or a shred ID is provided to successfully create a work item.
* **Assignment Options:** Use the`To Group Id`and`To User Id`properties to control work item assignment. Specify roles if needed.
* **Performance:** Be mindful of the potential performance impact when creating a large number of work items, and consider batching or throttling if necessary.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.
 IgnoreCase Multiline IgnoreCase Multiline

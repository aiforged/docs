---
description: Create QA work items based on a provided ratio.
---

# Create QA Work Items

**Properties**

* **Input**
  * **Document Ids**
    * **Type:**`List<int>`
    * **Description:** A list of unique document identifiers for which QA work items will be created. This is a required argument.
  * **QA Ratio**
    * **Type:**`double`
    * **Description:** The QA ratio expressed as a percentage value (e.g., every 10 documents out of 100 would equal 10%). This is a required argument.
  * **Comment**
    * **Type:**`string`
    * **Description:** The QA work item message. This is an optional argument.
  * **Method**
    * **Type:**`WorkItemMethod?`
    * **Description:** The work item method (e.g.,`WorkItemMethod.Random`). This is an optional argument.
    * **Default Value:**`WorkItemMethod.Random`
  * **Action**
    * **Type:**`WorkItemAction?`
    * **Description:** The work item action (e.g.,`WorkItemAction.QA`). This is an optional argument.
    * **Default Value:**`WorkItemAction.QA`
  * **Grace Period**
    * **Type:**`TimeSpan?`
    * **Description:** The grace period before the work item is escalated. This is an optional argument.
    * **Default Value:**`TimeSpan.FromDays(1)`
  * **To Group Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the group where this work item should be assigned. This is an optional argument.
  * **To User Id**
    * **Type:**`string`
    * **Description:** The unique identifier of the user to whom this work item should be assigned if the method is set to User. This is an optional argument.
  * **Roles**
    * **Type:**`List<string>`
    * **Description:** The user roles that this work item will be assigned to (e.g.,`verifydoc`or`verifyshred`). This is an optional argument.
  * **Create Shreds**
    * **Type:**`bool?`
    * **Description:** Create shred work items instead of document work items. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Create QA Work Items" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Ids:** Provide a list of document IDs for which QA work items will be created.
     * **QA Ratio:** Specify the QA ratio as a percentage.
   * Optionally, specify additional parameters such as comments, method, action, grace period, assignment details, roles, and whether to create shreds.
2. **Execution:**
   * The activity executes asynchronously, creating QA work items based on the specified ratio and options.
   * It uses the configured API context to create work items via the work item client.
3. **Output:**
   * The activity returns an`ObservableCollection<WorkItemViewModel>`, representing the created QA work items.

**Considerations**

* **Ratio Calculation:** Ensure that the QA ratio is set appropriately to reflect the desired number of QA work items relative to the total number of documents.
* **Assignment Options:** Use the`To Group Id`and`To User Id`properties to control work item assignment. Specify roles if needed.
* **Performance:** Be mindful of the potential performance impact when creating a large number of work items, and consider batching or throttling if necessary.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.


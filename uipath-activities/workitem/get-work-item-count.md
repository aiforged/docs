---
description: >-
  Get the number of work items that belong to the currently authenticated user
  based on various filters.
---

# Get Work Item Count

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int?`
    * **Description:** Filter by a project's unique identifier. This is an optional argument.
  * **Work Item Type**
    * **Type:**`WorkItemType?`
    * **Description:** Filter by work item type (e.g.,`WorkItemType.Document`). This is an optional argument.
  * **Work Item Action**
    * **Type:**`WorkItemAction?`
    * **Description:** Filter by work item action that the user should perform (e.g.,`WorkItemAction.Verify`). This is an optional argument.
  * **Work Item Status**
    * **Type:**`WorkItemStatus?`
    * **Description:** Filter by work item status (e.g.,`WorkItemStatus.Created`). This is an optional argument.
  * **Document Id**
    * **Type:**`int?`
    * **Description:** Filter by a document's unique identifier. This is an optional argument.
  * **Shred Id**
    * **Type:**`int?`
    * **Description:** Filter by a shred's unique identifier. This is an optional argument.
  * **Start Date**
    * **Type:**`DateTime?`
    * **Description:** Filter from starting date. This is an optional argument.
  * **End Date**
    * **Type:**`DateTime?`
    * **Description:** Filter up to end date. This is an optional argument.
  * **Comment**
    * **Type:**`string`
    * **Description:** Filter by comment. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Work Item Count" activity to your UiPath workflow.
   * Configure the optional input arguments to specify the criteria for filtering work items. This can include project or document-related filters, date/time ranges, and other attributes of the work items such as type, action, and status.
2. **Execution:**
   * The activity executes asynchronously, retrieving the count of work items that match the specified filter criteria for the currently authenticated user.
   * It uses the configured API context to access the work item data via the work item client.
3. **Output:**
   * The activity returns an`int`, representing the count of work items that match the specified filters.

**Considerations**

* **Filter Criteria:** Use the available filters to narrow down the work items to those relevant to your analysis or management needs.
* **Date and Time Filters:** Utilize the date filters to focus on work items within a specific timeframe, improving performance and relevance of the results.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the work item count to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or unexpected API responses.

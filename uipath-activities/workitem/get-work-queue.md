---
description: >-
  Retrieve the work items queue that belongs to the currently authenticated
  user, with optional filters.
---

# Get Work Queue

**Properties**

* **Input**
  * **Service Id**
    * **Type:**`int?`
    * **Description:** Filter by a service's unique identifier. This is an optional argument.
  * **Usage Type**
    * **Type:**`UsageType?`
    * **Description:** Filter by document usage type (e.g.,`UsageType.Inbox`). This is an optional argument.
  * **Document Statuses**
    * **Type:**`List<DocumentStatus>`
    * **Description:** Filter by a collection of document statuses (e.g.,`DocumentStatus.Verification`). This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Work Queue" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Document Statuses:** Provide the list of document statuses to filter the work queue by.
   * Optionally, specify:
     * **Service Id:** Provide the service ID to further filter the work queue.
     * **Usage Type:** Specify the document usage type if applicable.
2. **Execution:**
   * The activity executes asynchronously, retrieving the work items queue that matches the specified filter criteria for the currently authenticated user.
   * It uses the configured API context to access the work queue data via the work item client.
3. **Output:**
   * The activity returns an`ObservableCollection<DocumentsSummary>`, representing the work items queue that match the specified filters.

**Considerations**

* **Filter Criteria:** Use the available filters to narrow down the work queue to those items relevant to your analysis or management needs.
* **Document Statuses:** Ensure that the document statuses provided are valid and accurately represent the items you wish to retrieve.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the work queue to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or unexpected API responses.

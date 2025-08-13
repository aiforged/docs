---
description: Retrieve the audit result for a specified service based on various filters.
---

# Get Service Audit

**Properties**

* **Input**
  * **Target Service Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the target service where the documents are located. This is a required argument.
  * **Target Project Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the target project where the documents are located. This is a required argument.
  * **Start Date**
    * **Type:**`DateTime?`
    * **Description:** Filter audit results from this starting date. This is an optional argument.
  * **End Date**
    * **Type:**`DateTime?`
    * **Description:** Filter audit results up to this end date. This is an optional argument.
  * **Interval**
    * **Type:**`TimeSpan?`
    * **Description:** The result grouping interval for the audit. This is a required argument.
  * **Related Transaction Id**
    * **Type:**`int?`
    * **Description:** An optional related transaction ID for filtering audit results. This is a required argument.
  * **Include Related Transactions**
    * **Type:**`bool?`
    * **Description:** Specify whether to include all related or linked transactions in the audit. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Service Audit" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Target Service Id:** Specify the service ID for which to retrieve the audit.
     * **Target Project Id:** Specify the project ID for which to retrieve the audit.
     * **Interval:** Define the result grouping interval.
     * **Related Transaction Id:** Provide a related transaction ID if needed.
     * **Include Related Transactions:** Specify whether to include related transactions.
   * Optionally, specify:
     * **Start Date and End Date:** Define a date range for filtering audit results.
2. **Execution:**
   * The activity executes asynchronously, retrieving the audit results for the specified service and project based on the provided filters.
   * It uses the configured API context to access the audit data via the project client.
3. **Output:**
   * The activity returns an`ObservableCollection<TransactionsAuditViewModel>`, representing the audit results for the specified service and project.

**Considerations**

* **Data Integrity:** Ensure that the service ID, project ID, and other filter criteria are correctly specified to avoid errors during retrieval.
* **Date Range:** Use the date filters to narrow down the audit results to a specific timeframe, improving performance and relevance.
* **Related Transactions:** Decide whether to include related transactions based on your audit requirements.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the audit results to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.

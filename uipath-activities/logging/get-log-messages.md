---
description: >-
  Get a list of log messages from the AIForged logging subsystem based on filter
  criteria.
---

# Get Log Messages

**Properties**

* **Input**
  * **Definition Id**
    * **Type:**`int?`
    * **Description:** The parameter definition ID to filter log messages by.
  * **Document Id**
    * **Type:**`int?`
    * **Description:** The document ID to filter log messages by.
  * **Document Parameter Id**
    * **Type:**`int?`
    * **Description:** The document parameter ID to filter log messages by.
  * **Project Id**
    * **Type:**`int?`
    * **Description:** The project ID to filter log messages by.
  * **Service Id**
    * **Type:**`int?`
    * **Description:** The service ID to filter log messages by.
  * **User Id**
    * **Type:**`string`
    * **Description:** The user ID to filter log messages by.
  * **Verification Id**
    * **Type:**`int?`
    * **Description:** The verification ID to filter log messages by.
  * **Work Item Id**
    * **Type:**`int?`
    * **Description:** The work item ID to filter log messages by.
  * **Date and Time From**
    * **Type:**`DateTime?`
    * **Description:** The start date and time filter for retrieving log messages.
  * **Date and Time To**
    * **Type:**`DateTime?`
    * **Description:** The end date and time filter for retrieving log messages.

**Usage**

1. **Setup Activity:**
   * Add the "Get Log Messages" activity to your UiPath workflow.
   * Configure the input arguments to specify the criteria for filtering log messages. This can include project or service IDs, document-related filters, user and verification IDs, and date/time ranges.
2. **Execution:**
   * The activity executes asynchronously, retrieving log messages that match the specified filter criteria from the AIForged logging subsystem.
   * It uses the configured API context to access the log data via the log client.
3. **Output:**
   * The activity returns an`ObservableCollection<LogViewModel>`, representing the list of log messages retrieved based on the specified filters.

**Considerations**

* **Filter Criteria:** Use the available filters to narrow down the log messages to those relevant to your analysis or debugging needs.
* **Date and Time Filters:** Utilize the date and time filters to focus on log messages within a specific timeframe, improving performance and relevance of the results.
* **Data Integrity:** Ensure that filter values such as project ID or document ID are valid and correctly specified to avoid errors during retrieval.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the log messages to prevent unauthorized actions.

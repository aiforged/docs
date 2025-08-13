---
description: Retrieve all events for a specified service within a specified time range.
---

# Get Service Events

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the project associated with the service. This is an optional argument.
  * **Service Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the service for which to retrieve events. This is a required argument.
  * **Start Date**
    * **Type:**`DateTime`
    * **Description:** Filter events from this starting date. This is an optional argument.
  * **End Date**
    * **Type:**`DateTime`
    * **Description:** Filter events up to this end date. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Service Events" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Service Id:** Provide the unique identifier of the service for which you want to retrieve events.
   * Optionally, specify:
     * **Project Id:** Provide the project ID if you want to narrow down the events to a specific project.
     * **Start Date and End Date:** Define a date range to filter events within a specific timeframe.
2. **Execution:**
   * The activity executes asynchronously, retrieving events associated with the specified service and project within the given time range.
   * It uses the configured API context to access the event data via the services client.
3. **Output:**
   * The activity returns an`ObservableCollection<ServiceEventViewModel>`, representing the list of events associated with the specified service and project.

**Considerations**

* **Data Integrity:** Ensure that the service ID and project ID (if provided) are correctly specified to avoid errors during retrieval. The IDs must match exactly as stored in the system.
* **Date Range:** Use the date filters to narrow down the events to a specific timeframe, improving performance and relevance.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the events to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.
* **Event Analysis:** Use the retrieved event information for monitoring, analysis, or reporting purposes within your workflow.

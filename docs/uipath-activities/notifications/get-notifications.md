---
description: Get AIForged notifications with various filters.
---

# Get Notifications

Here's the specifications and usage documentation for the "Get Notifications" activity:

#### Get Notifications Activity

**Display Name:** Get Notifications\
**Description:** Get AIForged notifications with various filters.

**Properties**

* **Input**
  * **Start Date**
    * **Type:**`DateTime`
    * **Description:** Filter notifications from this starting date.
  * **End Date**
    * **Type:**`DateTime`
    * **Description:** Filter notifications up to this end date.
  * **Include Read**
    * **Type:**`bool?`
    * **Description:** Include notifications that were previously marked as read.
  * **To**
    * **Type:**`string`
    * **Description:** Filter by a notification's "To" property.
  * **Subject**
    * **Type:**`string`
    * **Description:** Filter by a notification's "Subject" property.
  * **Body**
    * **Type:**`string`
    * **Description:** Filter by a notification's "Body" property.
  * **Error**
    * **Type:**`string`
    * **Description:** Filter by a notification's "Error" property.
  * **Notification Type**
    * **Type:**`NotificationType?`
    * **Description:** Filter by notification type (e.g.,`NotificationType.Email`).
  * **Notification Status**
    * **Type:**`NotificationStatus?`
    * **Description:** Filter by notification status (e.g.,`NotificationStatus.Created`).
  * **Notification Area**
    * **Type:**`NotificationArea?`
    * **Description:** Filter by notification area (e.g.,`NotificationArea.Login`).
  * **Notification Event**
    * **Type:**`NotificationEvent?`
    * **Description:** Filter by notification event (e.g.,`NotificationEvent.Create`).
  * **Page No**
    * **Type:**`int?`
    * **Description:** Filter by page number (only applicable when Page Size is set).
  * **Page Size**
    * **Type:**`int?`
    * **Description:** The maximum number of results to return per page (use Page No to select which page to return results for).
  * **Sort By Field**
    * **Type:**`SortField?`
    * **Description:** Sort results by a specific field.
  * **Sort By Direction**
    * **Type:**`SortDirection?`
    * **Description:** Sort results in a specific direction.

**Usage**

1. **Setup Activity:**
   * Add the "Get Notifications" activity to your UiPath workflow.
   * Configure the input arguments to specify the criteria for filtering notifications. This can include date ranges, inclusion of read notifications, and various attributes of the notifications such as type, status, and event.
2. **Execution:**
   * The activity executes asynchronously, retrieving notifications that match the specified filter criteria from the AIForged notification subsystem.
   * It uses the configured API context to access the notification data via the notification client.
3. **Output:**
   * The activity returns an`ObservableCollection<NotificationViewModel>`, representing the list of notifications retrieved based on the specified filters.

**Considerations**

* **Filter Criteria:** Use the available filters to narrow down the notifications to those relevant to your analysis or monitoring needs.
* **Date and Time Filters:** Utilize the date filters to focus on notifications within a specific timeframe, improving performance and relevance of the results.
* **Sorting and Pagination:** Use sorting and pagination options to manage large sets of notifications efficiently.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the notifications to prevent unauthorized actions.


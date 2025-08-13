---
description: Get the count of unread notifications.
---

# Get Unread Notification

**Properties**

This activity does not require any input properties, as it operates on the current user context to retrieve the unread notification count.

**Usage**

1. **Setup Activity:**
   * Add the "Get Unread Notification Count" activity to your UiPath workflow.
   * No additional configuration is necessary, as the activity automatically retrieves the count of unread notifications for the current user.
2. **Execution:**
   * The activity executes asynchronously, querying the AIForged notification subsystem to determine the number of unread notifications for the current user.
   * It uses the configured API context to access the notification data via the notification client.
3. **Output:**
   * The activity returns an`int`, representing the count of unread notifications for the current user.

**Considerations**

* **User Context:** Ensure that the API context is correctly initialized and that the current user is authenticated to retrieve the unread notification count.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the unread count to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or unexpected API responses.
 IgnoreCase Multiline IgnoreCase Multiline

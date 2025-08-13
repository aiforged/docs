---
description: Retrieve the platform's current system date and time.
---

# Get System Date

**Properties**

This activity does not require any input properties, as it is designed to retrieve the current system date and time from the platform.

**Usage**

1. **Setup Activity:**
   * Add the "Get System Date" activity to your UiPath workflow.
   * No additional configuration is necessary, as the activity retrieves the current system date and time from the platform.
2. **Execution:**
   * The activity executes asynchronously, querying the platform to retrieve the current system date and time.
   * It uses the configured API context to access the system date via the system client.
3. **Output:**
   * The activity returns a`DateTime`, representing the platform's current system date and time.

**Considerations**

* **Time Consistency:** Use this activity to ensure that operations within your workflow are synchronized with the platform's system time, which can be crucial for time-sensitive tasks.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the system date to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or unexpected API responses.

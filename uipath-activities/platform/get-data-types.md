---
description: Retrieve a collection of platform-specific data type objects.
---

# Get Data Types

**Properties**

This activity does not require any input properties, as it retrieves all available data types from the platform.

**Usage**

1. **Setup Activity:**
   * Add the "Get Data Types" activity to your UiPath workflow.
   * No additional configuration is necessary, as the activity is designed to retrieve all data types available on the platform.
2. **Execution:**
   * The activity executes asynchronously, querying the platform to retrieve a collection of data type objects.
   * It uses the configured API context to access the data types via the system client.
3. **Output:**
   * The activity returns a`List<DataTypeViewModel>`, representing the collection of platform-specific data types.

**Considerations**

* **Data Retrieval:** The activity retrieves all available data types from the platform, which can then be used in subsequent workflow steps for various operations.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the data types to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or unexpected API responses.

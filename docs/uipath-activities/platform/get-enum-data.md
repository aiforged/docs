---
description: Retrieve a collection of platform-specific enum data objects.
---

# Get Enum Data

**Properties**

This activity does not require any input properties, as it is designed to retrieve all available enum data from the platform.

**Usage**

1. **Setup Activity:**
   * Add the "Get Enum Data" activity to your UiPath workflow.
   * No additional configuration is necessary, as the activity is intended to retrieve all enum data available on the platform.
2. **Execution:**
   * The activity executes asynchronously, querying the platform to retrieve a collection of enum data objects.
   * It uses the configured API context to access the enum data via the system client.
3. **Output:**
   * The activity returns a`List<EnumDataViewModel>`, representing the collection of platform-specific enum data.

**Considerations**

* **Data Retrieval:** The activity retrieves all available enum data from the platform, which can be used for various operations in subsequent workflow steps.
* **Permissions:** Ensure that the necessary permissions are in place for the user or application retrieving the enum data to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or unexpected API responses.


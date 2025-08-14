---
description: Get remaining credit balance per project/service.
---

# Get Balance

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int?`
    * **Description:** The ID of the project for which to retrieve the remaining credit balance. This is a required argument.
  * **Service Id**
    * **Type:**`int?`
    * **Description:** The ID of the service for which to retrieve the remaining credit balance. This is an optional argument.
  * **Effective Date**
    * **Type:**`DateTime?`
    * **Description:** The effective date for which to retrieve the balance. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Balance" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Project Id:** Specify the project ID for which you want to get the balance.
   * Optionally, specify:
     * **Service Id:** Provide the service ID if you want to narrow down the balance retrieval to a specific service within the project.
     * **Effective Date:** Define the date for which to retrieve the balance.
2. **Execution:**
   * The activity executes asynchronously, retrieving the remaining credit balance for the specified project or service as of the effective date.
   * It uses the configured API context to access the balance information via the project client.
3. **Output:**
   * The activity returns a`decimal?`, representing the remaining credit balance for the specified project or service.

**Considerations**

* **Data Integrity:** Ensure that the project ID and service ID (if provided) are valid and correctly specified to avoid errors during retrieval.
* **Effective Date:** Use the effective date to retrieve the balance as of a specific date. If not specified, the current date may be used by default.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the balance to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.


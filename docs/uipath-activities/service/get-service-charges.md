---
description: Retrieve the service charges for a specified service.
---

# Get Service Charges

**Properties**

* **Input**
  * **Service Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the service for which to retrieve charges. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Service Charges" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Service Id:** Provide the unique identifier of the service for which you want to retrieve the charges.
2. **Execution:**
   * The activity executes asynchronously, retrieving the charges associated with the specified service.
   * It uses the configured API context to access the charge data via the services client.
3. **Output:**
   * The activity returns an`ObservableCollection<ServiceChargeViewModel>`, representing the list of charges associated with the specified service.

**Considerations**

* **Data Integrity:** Ensure that the service ID is correctly specified to avoid errors during retrieval. The ID must match exactly as stored in the system.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the service charges to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.
* **Charge Information:** Use the retrieved charge information for financial analysis, billing, or cost management purposes within your workflow.


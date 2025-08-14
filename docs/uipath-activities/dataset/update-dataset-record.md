---
description: Update a dataset record.
---

# Update Dataset Record

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The document ID of the dataset containing the record to be updated. This is a required argument.
  * **Parameter Definition Id**
    * **Type:**`int`
    * **Description:** The parameter definition ID of the dataset containing the record to be updated. This is a required argument.
  * **Update Record**
    * **Type:**`CustomDataSetRecord`
    * **Description:** The`CustomDataSetRecord`object containing the updated information for the record. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Update Dataset Record" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Id:** Specify the document ID of the dataset.
     * **Parameter Definition Id:** Specify the parameter definition ID of the dataset.
     * **Update Record:** Provide the`CustomDataSetRecord`object with the updated information for the record.
2. **Execution:**
   * The activity executes asynchronously, updating the specified record within the dataset with the provided information.
   * It uses the configured API context to perform the update via the dataset client.
3. **Output:**
   * The activity returns an updated`CustomDataSetRecord`, representing the dataset record with the applied changes.

**Considerations**

* **Data Integrity:** Ensure that the document ID, parameter definition ID, and updated record data are valid and correctly specified to avoid errors during the update process.
* **Permissions:** Verify that the necessary permissions are in place for the user or application performing the update to prevent unauthorized actions.
* **Concurrency:** Consider the possibility of concurrent updates to the same record, which may require implementing locking or versioning mechanisms if supported by your system.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.


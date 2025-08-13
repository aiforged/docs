---
description: Create a dataset record.
---

# Create Dataset Record

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The document ID associated with the dataset. This is a required argument.
  * **Parameter Definition Id**
    * **Type:**`int`
    * **Description:** The parameter definition ID associated with the dataset. This is a required argument.
  * **New Record**
    * **Type:**`CustomDataSetRecord`
    * **Description:** The new`CustomDataSetRecord`to be created. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Create Dataset Record" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Id:** Specify the document ID associated with the dataset where the record will be created.
     * **Parameter Definition Id:** Specify the parameter definition ID associated with the dataset.
     * **New Record:** Provide the new`CustomDataSetRecord`object to be created.
2. **Execution:**
   * The activity executes asynchronously, creating a new record in the specified dataset.
   * It uses the configured API context to create the record via the dataset client.
3. **Output:**
   * The activity returns a`CustomDataSetRecord`, representing the newly created dataset record with its associated metadata.

**Considerations**

* **Data Integrity:** Ensure that the document ID, parameter definition ID, and new record data are valid and correctly specified to avoid errors during the creation process.
* **Unique Record:** Ensure the record data is unique or sufficiently descriptive to prevent duplication or confusion within the dataset.
* **Permissions:** Verify that the necessary permissions are in place for the user or application performing the record creation to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.

---
description: Delete multiple dataset records by their key IDs.
---

# Delete Dataset Records

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The document ID of the dataset from which the records will be deleted. This is a required argument.
  * **Parameter Definition Id**
    * **Type:**`int`
    * **Description:** The parameter definition ID of the dataset from which the records will be deleted. This is a required argument.
  * **Key Ids**
    * **Type:**`List<int>`
    * **Description:** The list of key IDs of the records to be deleted. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Delete Dataset Records" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Id:** Specify the document ID of the dataset.
     * **Parameter Definition Id:** Specify the parameter definition ID of the dataset.
     * **Key Ids:** Provide a list of key IDs of the records to be deleted.
2. **Execution:**
   * The activity executes asynchronously, deleting the specified records from the dataset using their key IDs.
   * It uses the configured API context to perform the deletion via the dataset client.
3. **Output:**
   * The activity returns a`List<CustomDataSetRecord>`, which may represent the remaining records in the dataset or provide information related to the operation, depending on the implementation.

**Considerations**

* **Data Integrity:** Ensure that the document ID, parameter definition ID, and key IDs are valid and correctly specified to avoid errors during the deletion process.
* **Permanent Deletion:** Be aware that deleting dataset records is usually irreversible. Confirm the action before proceeding.
* **Permissions:** Verify that the necessary permissions are in place for the user or application performing the deletion to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.
 IgnoreCase Multiline IgnoreCase Multiline

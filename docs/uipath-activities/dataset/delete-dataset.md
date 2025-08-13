---
description: >-
  Delete a dataset's content and optionally its definition, by its document ID
  and parameter definition ID.
---

# Delete Dataset

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The document ID of the dataset to be deleted. This is a required argument.
  * **Parameter Definition Id**
    * **Type:**`int`
    * **Description:** The parameter definition ID of the dataset to be deleted. This is a required argument.
  * **Delete Definition**
    * **Type:**`bool?`
    * **Description:** Specifies whether to also delete the dataset's definition. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Delete Dataset" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Id:** Specify the document ID of the dataset to be deleted.
     * **Parameter Definition Id:** Specify the parameter definition ID of the dataset to be deleted.
   * Optionally, specify:
     * **Delete Definition:** Set to`true`if you want to delete the dataset's definition along with its content.
2. **Execution:**
   * The activity executes asynchronously, deleting the specified dataset's content and optionally its definition.
   * It uses the configured API context to perform the deletion via the dataset client.
3. **Output:**
   * The activity returns an`int`representing the result of the deletion operation, which might indicate success or provide additional information based on the implementation.

**Considerations**

* **Data Integrity:** Ensure that the document ID and parameter definition ID are valid and correctly specified to avoid errors during the deletion process.
* **Permanent Deletion:** Be aware that deleting a dataset's content and definition is usually irreversible. Confirm the action before proceeding.
* **Permissions:** Verify that the necessary permissions are in place for the user or application performing the deletion to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.
 IgnoreCase Multiline IgnoreCase Multiline

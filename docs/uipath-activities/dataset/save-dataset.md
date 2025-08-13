---
description: Save changes to an existing custom dataset.
---

# Save Dataset

**Properties**

* **Input**
  * **Existing Dataset**
    * **Type:**`CustomDataSet`
    * **Description:** The existing dataset to save. This is a required argument. Make sure to provide the dataset object with any modifications you wish to apply.
  * **Merge Existing Data**
    * **Type:**`bool?`
    * **Description:** Specifies whether to overwrite or merge existing data. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Save Dataset" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Existing Dataset:** Provide the`CustomDataSet`object with any changes that need to be saved.
   * Optionally, specify:
     * **Merge Existing Data:** Set to`true`if you want to merge the changes with existing data, or`false`to overwrite existing data.
2. **Execution:**
   * The activity executes asynchronously, saving the changes to the specified dataset.
   * It uses the configured API context to save the dataset via the dataset client.
3. **Output:**
   * The activity returns an`int`, typically representing a status code or identifier related to the save operation, depending on the implementation.

**Considerations**

* **Data Integrity:** Ensure that the dataset object contains valid and correct information before saving to avoid data corruption or loss.
* **Merge Option:** Use the merge option carefully to control whether changes should replace existing data or be combined with it.
* **Permissions:** Verify that the necessary permissions are in place for the user or application saving the dataset to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.

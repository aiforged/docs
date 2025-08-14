---
description: Synchronise a system dataset with its project/service categories.
---

# Synchronise Dataset

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int`
    * **Description:** The dataset's project ID. This is a required argument.
  * **Service Id**
    * **Type:**`int`
    * **Description:** The dataset's service ID. This is a required argument.
  * **Parameter Definition Id**
    * **Type:**`int`
    * **Description:** The dataset's parameter definition ID. This is a required argument.
  * **Override Comment**
    * **Type:**`bool?`
    * **Description:** Specifies whether to override the comment field of the matching document category. This is an optional argument.
  * **Override Reference**
    * **Type:**`bool?`
    * **Description:** Specifies whether to override the reference field of the matching document category. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Synchronise Dataset" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Project Id:** Specify the project ID of the dataset to be synchronized.
     * **Service Id:** Specify the service ID of the dataset to be synchronized.
     * **Parameter Definition Id:** Specify the parameter definition ID of the dataset to be synchronized.
   * Optionally, specify:
     * **Override Comment:** Set to`true`if you want to override the comment field of the matching document category.
     * **Override Reference:** Set to`true`if you want to override the reference field of the matching document category.
2. **Execution:**
   * The activity executes asynchronously, synchronizing the specified dataset with its project/service categories.
   * It uses the configured API context to perform the synchronization via the dataset client.
3. **Output:**
   * The activity returns a`bool`indicating the success of the synchronization operation:
     * `true`if the synchronization was successful.
     * `false`if the operation failed.

**Considerations**

* **Data Integrity:** Ensure that the project ID, service ID, and parameter definition ID are valid and correctly specified to avoid errors during synchronization.
* **Override Options:** Use the override options carefully to control whether existing comment and reference fields should be updated.
* **Permissions:** Verify that the necessary permissions are in place for the user or application performing the synchronization to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.


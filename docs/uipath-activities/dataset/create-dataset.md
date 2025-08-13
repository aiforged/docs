---
description: Create a new custom dataset in a project/service combination.
---

# Create Dataset

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the project containing the dataset. This is a required argument.
  * **Service Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the service containing the dataset. This is a required argument.
  * **Dataset Name**
    * **Type:**`string`
    * **Description:** The name of the new dataset to be created. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Create Dataset" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Project Id:** Specify the ID of the project where the dataset will be created.
     * **Service Id:** Specify the ID of the service where the dataset will be created.
     * **Dataset Name:** Provide a name for the new dataset.
2. **Execution:**
   * The activity executes asynchronously, creating a new custom dataset within the specified project and service.
   * It uses the configured API context to create the dataset via the dataset client.
3. **Output:**
   * The activity returns a`CustomDataSet`, representing the newly created dataset with its associated metadata.

**Considerations**

* **Data Integrity:** Ensure that the project ID, service ID, and dataset name are valid and correctly specified to avoid errors during the creation process.
* **Unique Dataset Name:** Choose a unique and descriptive name for the dataset to prevent naming conflicts and ensure clarity.
* **Permissions:** Verify that the necessary permissions are in place for the user or application performing the dataset creation to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.
 IgnoreCase Multiline IgnoreCase Multiline

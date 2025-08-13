---
description: Retrieve all custom datasets within a project or service.
---

# Get Datasets

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int`
    * **Description:** The ID of the project containing the datasets. This is a required argument.
  * **Service Id**
    * **Type:**`int?`
    * **Description:** The ID of the service containing the datasets. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Datasets" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Project Id:** Specify the ID of the project from which you want to retrieve datasets.
   * Optionally, specify:
     * **Service Id:** Provide the ID of the service if you want to narrow down the dataset retrieval to a specific service within the project.
2. **Execution:**
   * The activity executes asynchronously, retrieving all custom datasets within the specified project or service.
   * It uses the configured API context to access the datasets via the dataset client.
3. **Output:**
   * The activity returns a`List<CustomDataSet>`, representing all retrieved datasets within the specified project or service.

**Considerations**

* **Scope of Retrieval:** The activity can retrieve datasets at the project level or be narrowed down to a specific service if the Service Id is provided.
* **Data Integrity:** Ensure that the project ID and service ID (if provided) are valid and correctly specified to avoid errors during retrieval.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the datasets to prevent unauthorized actions.
* **Performance:** Depending on the number of datasets, the retrieval process might take some time. Consider implementing pagination or additional filtering if supported by your API to manage large volumes of data.
 IgnoreCase Multiline IgnoreCase Multiline

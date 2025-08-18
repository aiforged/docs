---
description: Retrieve a custom dataset and optionally its data.
---

# Get Dataset by Parameter Definition Id

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
  * **Include Data**
    * **Type:**`bool?`
    * **Description:** Specifies whether to include the dataset data. The amount of data can be paged, determined by the Page Size and Page Index fields. This can slow down the request if the dataset contains a large amount of data. This is an optional argument.
  * **Page Index**
    * **Type:**`int?`
    * **Description:** The index of the paged data to return. This is an optional argument.
  * **Page Size**
    * **Type:**`int?`
    * **Description:** The size of the paged data to return. This is an optional argument.
  * **Sort Field Parameter Definition Id**
    * **Type:**`int?`
    * **Description:** The parameter definition ID of the field to sort the paged data by. This is an optional argument.
  * **Sort Direction**
    * **Type:**`AIForged.API.SortDirection?`
    * **Description:** The direction to sort the paged data by. This is an optional argument.
  * **Search Field**
    * **Type:**`string`
    * **Description:** The name of a field to search by. This is an optional argument.
  * **Search Filter**
    * **Type:**`string`
    * **Description:** A value to search the specified field on. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Dataset by Parameter Definition Id" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Project Id:** Provide the project ID of the dataset.
     * **Service Id:** Provide the service ID of the dataset.
     * **Parameter Definition Id:** Provide the parameter definition ID of the dataset.
   * Optionally, specify:
     * **Include Data:** Set to`true`if you want to include the dataset data.
     * **Page Index and Page Size:** Define pagination options to manage large datasets efficiently.
     * **Sort Field Parameter Definition Id and Sort Direction:** Specify sorting options for the dataset data.
     * **Search Field and Search Filter:** Define search criteria to filter dataset data.
2. **Execution:**
   * The activity executes asynchronously, retrieving the specified dataset and optionally its data according to the specified filters and options.
   * It uses the configured API context to access the dataset via the dataset client.
3. **Output:**
   * The activity returns a`CustomDataSet`, representing the retrieved dataset and optionally its data.

**Considerations**

* **Data Volume:** Be mindful of the volume of data when including dataset data, as this can impact performance. Use pagination to manage large datasets.
* **Data Integrity:** Ensure the project ID, service ID, and parameter definition ID are valid and correctly specified to avoid errors during retrieval.
* **Search and Sort:** Utilize search and sort options to efficiently retrieve and organize dataset data according to specific criteria.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the dataset to prevent unauthorized actions.


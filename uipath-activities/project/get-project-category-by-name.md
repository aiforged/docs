---
description: Retrieve a category object for a given project/category name combination.
---

# Get Project Category By Name

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the project associated with the category. This is a required argument.
  * **Category Name**
    * **Type:**`string`
    * **Description:** The name of the category to retrieve. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Project Category By Name" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Project Id:** Provide the unique identifier of the project associated with the category.
     * **Category Name:** Provide the name of the category you want to retrieve.
2. **Execution:**
   * The activity executes asynchronously, retrieving the category object that matches the specified project and category name.
   * It uses the configured API context to access the categories for the specified project via the classes client and filters by name.
3. **Output:**
   * The activity returns a`ClassesViewModel`, representing the retrieved category object with its associated details.

**Considerations**

* **Data Integrity:** Ensure that the project ID and category name are correctly specified to avoid errors during retrieval. The category name must match exactly as stored in the system.
* **Unique Names:** Ensure that category names are unique within the project to avoid ambiguity. If multiple categories share the same name, ensure you have a mechanism to handle such cases.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the category to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.

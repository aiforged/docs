---
description: Retrieve a category object for a given project/category combination.
---

# Get Project Category

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the project associated with the category. This is a required argument.
  * **Category Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the category to retrieve. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Project Category" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Project Id:** Provide the unique identifier of the project associated with the category.
     * **Category Id:** Provide the unique identifier of the category you want to retrieve.
2. **Execution:**
   * The activity executes asynchronously, retrieving the category object that matches the specified project and category IDs.
   * It uses the configured API context to access the category data via the classes client.
3. **Output:**
   * The activity returns a`ClassesViewModel`, representing the retrieved category object with its associated details.

**Considerations**

* **Data Integrity:** Ensure that the project ID and category ID are correctly specified to avoid errors during retrieval. The IDs must match exactly as stored in the system.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the category to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.
 IgnoreCase Multiline IgnoreCase Multiline

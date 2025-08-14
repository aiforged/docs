---
description: Retrieve all categories for a given project.
---

# Get Project Categories

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the project for which to retrieve all categories. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Project Categories" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Project Id:** Provide the unique identifier of the project from which you want to retrieve all categories.
2. **Execution:**
   * The activity executes asynchronously, retrieving all category objects associated with the specified project.
   * It uses the configured API context to access the categories for the project via the classes client.
3. **Output:**
   * The activity returns a`List<ClassesViewModel>`, representing all categories associated with the specified project.

**Considerations**

* **Data Integrity:** Ensure that the project ID is correctly specified to avoid errors during retrieval. The ID must match exactly as stored in the system.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the categories to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.
* **Project Scope:** The activity retrieves all categories within the specified project, facilitating operations that require access to multiple categories.


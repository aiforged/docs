---
description: Retrieve a project by its unique identifier.
---

# Get Project By Id

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the project to retrieve. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Project By Id" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Project Id:** Provide the unique identifier of the project you want to retrieve.
2. **Execution:**
   * The activity executes asynchronously, retrieving the project that matches the specified ID.
   * It uses the configured API context to access the project data via the project client.
3. **Output:**
   * The activity returns a`ProjectViewModel`, representing the retrieved project with its associated details.

**Considerations**

* **Data Integrity:** Ensure that the project ID is correctly specified to avoid errors during retrieval. The ID must match exactly as stored in the system.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the project to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.
* **Uniqueness:** The project ID must be unique within the system, ensuring that the correct project is retrieved without ambiguity.

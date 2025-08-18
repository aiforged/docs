---
description: Retrieve a project by its name.
---

# Get Project By Name

**Properties**

* **Input**
  * **Project Name**
    * **Type:**`string`
    * **Description:** The name of the project to retrieve. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Project By Name" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Project Name:** Provide the name of the project you want to retrieve.
2. **Execution:**
   * The activity executes asynchronously, retrieving the project that matches the specified name.
   * It uses the configured API context to access the project data via the project client.
3. **Output:**
   * The activity returns a`ProjectViewModel`, representing the retrieved project with its associated details.

**Considerations**

* **Data Integrity:** Ensure that the project name is correctly specified to avoid errors during retrieval. The name must match exactly as stored in the system.
* **Unique Names:** Ensure that project names are unique within your system to avoid ambiguity. If multiple projects share the same name, ensure you have a mechanism to handle such cases.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the project to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data


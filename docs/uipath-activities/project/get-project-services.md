---
description: Retrieve all services contained within a specified project.
---

# Get Project Services

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the project from which to retrieve all services. This is a required argument.
  * **Service Definition Type Id**
    * **Type:**`int?`
    * **Description:** Filter by specific service type. This is an optional argument.
  * **Engine Filter**
    * **Type:**`string`
    * **Description:** Filter by service engine identifier. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Project Services" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Project Id:** Provide the unique identifier of the project from which you want to retrieve all services.
   * Optionally, specify:
     * **Service Definition Type Id:** Provide the type ID to filter services by specific types.
     * **Engine Filter:** Provide an engine identifier to filter services by specific engines.
2. **Execution:**
   * The activity executes asynchronously, retrieving all service definitions associated with the specified project, potentially filtered by type or engine.
   * It uses the configured API context to access the service data via the project client.
3. **Output:**
   * The activity returns a`List<ParameterDefViewModel>`, representing all service definitions associated with the specified project and filtered criteria.

**Considerations**

* **Data Integrity:** Ensure that the project ID is correctly specified to avoid errors during retrieval. The ID must match exactly as stored in the system.
* **Filter Criteria:** Use the available filters to narrow down the retrieved services to specific types or engines.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the services to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.
* **Project Scope:** The activity retrieves all services within the specified project, facilitating operations that require access to multiple services.

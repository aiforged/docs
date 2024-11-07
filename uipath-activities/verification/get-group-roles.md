---
description: Retrieve the roles associated with a specified group.
---

# Get Group Roles

**Properties**

* **Input**
  * **Group Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the group for which to retrieve roles. This is an optional argument but should be provided to specify the target group.
  * **Group Role Type**
    * **Type:**`API.GroupRoleType?`
    * **Description:** The type of group role to filter the results by. This is an optional argument.
  * **Include Users**
    * **Type:**`bool?`
    * **Description:** Specify whether to include users in the result. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Group Roles" activity to your UiPath workflow.
   * Configure the optional input arguments:
     * **Group Id:** Provide the unique identifier of the group for which you want to retrieve roles. Although optional, this argument is necessary to specify the target group.
     * **Group Role Type:** Specify a role type to filter the roles by if needed.
     * **Include Users:** Set to`true`if you want to include user information in the results.
2. **Execution:**
   * The activity executes asynchronously, retrieving the roles associated with the specified group, optionally filtered by role type and including user information.
   * It uses the configured API context to access the group roles data via the group client.
3. **Output:**
   * The activity returns an`ObservableCollection<GroupRoleViewModel>`, representing the roles associated with the specified group.

**Considerations**

* **Data Integrity:** Ensure that the group ID and any filter criteria are correctly specified to avoid errors during retrieval. The ID must match exactly as stored in the system.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the group roles to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.
* **Optional Arguments:** Use the optional arguments to tailor the retrieval process to your specific needs, such as filtering by role type or including user information.

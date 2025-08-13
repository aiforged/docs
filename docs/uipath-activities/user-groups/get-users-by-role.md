---
description: Retrieve the users associated with a specified role.
---

# Get Users by Role

**Properties**

* **Input**
  * **Role Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the role for which to retrieve users. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Users by Role" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Role Id:** Provide the unique identifier of the role for which you want to retrieve users.
2. **Execution:**
   * The activity executes asynchronously, retrieving the users associated with the specified role.
   * It uses the configured API context to access the user data via the group client.
3. **Output:**
   * The activity returns an`ObservableCollection<GroupRoleUserViewModel>`, representing the users associated with the specified role.

**Considerations**

* **Data Integrity:** Ensure that the role ID is correctly specified to avoid errors during retrieval. The ID must match exactly as stored in the system.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the users to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.
* **Role Scope:** The activity retrieves all users within the specified role, facilitating operations that require access to role-based user information.
 IgnoreCase Multiline IgnoreCase Multiline

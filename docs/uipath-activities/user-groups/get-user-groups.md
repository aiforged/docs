---
description: Retrieve the groups associated with a specified user.
---

# Get User Groups

**Properties**

* **Input**
  * **User Id**
    * **Type:**`string`
    * **Description:** The unique identifier of the user for which to retrieve groups. This is an optional argument, but should be provided to specify the target user.

**Usage**

1. **Setup Activity:**
   * Add the "Get User Groups" activity to your UiPath workflow.
   * Configure the optional input argument:
     * **User Id:** Provide the unique identifier of the user for which you want to retrieve groups. Although optional, this argument is necessary to specify the target user.
2. **Execution:**
   * The activity executes asynchronously, retrieving the groups associated with the specified user.
   * It uses the configured API context to access the group data via the group client.
3. **Output:**
   * The activity returns an`ObservableCollection<GroupViewModel>`, representing the groups associated with the specified user.

**Considerations**

* **Data Integrity:** Ensure that the user ID is correctly specified to avoid errors during retrieval. The ID must match exactly as stored in the system.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the user groups to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.
* **Optional Argument:** Although the`User Id`is marked as optional, it should be provided to successfully retrieve groups for a specific user.


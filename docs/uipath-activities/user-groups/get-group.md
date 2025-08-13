---
description: Retrieve a group by its unique identifier.
---

# Get Group

**Properties**

* **Input**
  * **Group Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the group to retrieve. This is an optional argument, but should be provided to specify which group to get.

**Usage**

1. **Setup Activity:**
   * Add the "Get Group" activity to your UiPath workflow.
   * Configure the optional input argument:
     * **Group Id:** Provide the unique identifier of the group you want to retrieve. Although optional, this argument is necessary to specify the target group.
2. **Execution:**
   * The activity executes asynchronously, retrieving the group that matches the specified ID.
   * It uses the configured API context to access the group data via the group client.
3. **Output:**
   * The activity returns a`GroupViewModel`, representing the retrieved group with its associated details.

**Considerations**

* **Data Integrity:** Ensure that the group ID is correctly specified to avoid errors during retrieval. The ID must match exactly as stored in the system.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the group to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.
* **Optional Argument:** Although the`Group Id`is marked as optional, it should be provided to successfully retrieve a specific group.
 IgnoreCase Multiline IgnoreCase Multiline

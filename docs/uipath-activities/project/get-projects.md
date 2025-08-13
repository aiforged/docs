---
description: Retrieve all projects for the currently authenticated user.
---

# Get Projects

**Properties**

This activity does not require any input properties, as it operates based on the current user context to retrieve all projects associated with the user.

**Usage**

1. **Setup Activity:**
   * Add the "Get Projects" activity to your UiPath workflow.
   * No additional configuration is necessary, as the activity automatically retrieves all projects for the current user.
2. **Execution:**
   * The activity executes asynchronously, querying the AIForged platform to retrieve all projects associated with the currently authenticated user.
   * It uses the configured API context to access the project data via the project client.
3. **Output:**
   * The activity returns a`List<ProjectViewModel>`, representing the list of projects associated with the current user.

**Considerations**

* **User Context:** Ensure that the API context is correctly initialized and that the current user is authenticated to retrieve the projects.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the projects to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or unexpected API responses.
* **Project Management:** This activity is useful for workflows that need to display, manage, or perform operations across multiple projects owned or accessible by the current user.
 IgnoreCase Multiline IgnoreCase Multiline

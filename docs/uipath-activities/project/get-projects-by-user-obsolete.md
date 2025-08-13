---
description: Retrieve all projects for the currently authenticated user.
---

# Get Projects By User (Obsolete)

**Obsolescence Notice:**\
This activity is obsolete. It is recommended to use the "Get Projects" activity instead.

**Properties**

This activity does not require any input properties, as it operates based on the current user context to retrieve all projects associated with the user.

**Usage**

1. **Setup Activity:**
   * Add the "Get Projects By User" activity to your UiPath workflow.
   * No additional configuration is necessary, as the activity automatically retrieves all projects for the current user.
2. **Execution:**
   * The activity executes asynchronously, querying the AIForged platform to retrieve all projects associated with the currently authenticated user.
   * It uses the configured API context to access the project data via the project client.
3. **Output:**
   * The activity returns an`ObservableCollection<ProjectViewModel>`, representing the list of projects associated with the current user.

**Considerations**

* **Obsolete Status:** Since this activity is marked as obsolete, it is recommended to transition to using the "Get Projects" activity for future-proofing your workflows.
* **User Context:** Ensure that the API context is correctly initialized and that the current user is authenticated to retrieve the projects.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the projects to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or unexpected API responses.
 IgnoreCase Multiline IgnoreCase Multiline

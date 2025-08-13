---
description: Move a document to another service.
---

# Move Document

**Properties**

* **Input**
  * **Documents Id's**
    * **Type:**`List<int>`
    * **Description:** A list of document IDs to move. This is a required argument.
  * **Target Project Id**
    * **Type:**`int`
    * **Description:** The unique project identifier where you want to move the documents. This is a required argument.
  * **Target Service Id**
    * **Type:**`int`
    * **Description:** The unique service identifier where you want to move the documents. This is a required argument.
  * **Usage Type**
    * **Type:**`AIForged.API.UsageType`
    * **Description:** The usage type for the moved documents (e.g.,`UsageType.Inbox`). This is a required argument.
  * **Document Status**
    * **Type:**`DocumentStatus`
    * **Description:** The status for the moved documents (e.g.,`DocumentStatus.Received`). This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Move Document" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Documents Id's:** Provide a list of document IDs that you want to move.
     * **Target Project Id:** Specify the project ID to which the documents will be moved.
     * **Target Service Id:** Specify the service ID to which the documents will be moved.
     * **Usage Type:** Define the usage type for the moved documents.
     * **Document Status:** Define the status for the moved documents.
2. **Execution:**
   * The activity executes asynchronously, moving the specified documents to the target project and service with the defined usage type and status.
   * It uses the configured API context to perform the move operation via the document client.
3. **Output:**
   * The activity returns a`List<DocumentViewModel>`, representing the documents after they have been moved, including updated properties.

**Considerations**

* **Data Integrity:** Ensure that the document IDs, project ID, and service ID are valid and accessible to avoid errors during the move process.
* **Usage and Status:** Choose appropriate usage types and statuses to reflect the documents' new roles or states within the target service.
* **Permissions:** Verify that the necessary permissions are in place for the user or application performing the move operation to prevent unauthorized actions.
 IgnoreCase Multiline IgnoreCase Multiline

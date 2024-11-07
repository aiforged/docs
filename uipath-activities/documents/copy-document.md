---
description: Copy a document to another service
---

# Copy Document

**Properties**

* **Input**
  * **Documents Id's**
    * **Type:**`List<int>`
    * **Description:** List of document IDs to be copied. This is a required argument to specify which documents will be copied.
  * **Target Project Id**
    * **Type:**`int`
    * **Description:** The unique project identifier where you want to copy the documents. This is a required argument.
  * **Target Service Id**
    * **Type:**`int`
    * **Description:** The unique service identifier where you want to copy the documents. This is a required argument.
  * **Usage Type**
    * **Type:**`AIForged.API.UsageType`
    * **Description:** The usage type for the copied documents, such as`UsageType.Inbox`. This is a required argument.
    * **Default Value:**`UsageType.Inbox`
  * **Document Status**
    * **Type:**`AIForged.API.DocumentStatus`
    * **Description:** The status for the copied documents, such as`DocumentStatus.Received`. This is a required argument.
    * **Default Value:**`DocumentStatus.Received`
  * **Persist Original Data**
    * **Type:**`bool`
    * **Description:** Indicates whether to persist document data from the source to the target.
    * **Default Value:**`true`
  * **Clear Document Category**
    * **Type:**`bool`
    * **Description:** Indicates whether to clear the document category in the target service after copying.
    * **Default Value:**`false`

**Usage**

1. **Setup Activity:**
   * Add the "Copy Document" activity to your UiPath workflow.
   * Configure the required input arguments:
     * Provide the list of document IDs (`Documents Id's`) that you want to copy.
     * Specify the`Target Project Id`and`Target Service Id`where the documents will be copied.
     * Set the desired`Usage Type`and`Document Status`for the copied documents.
   * Configure optional arguments based on your needs:
     * Set`Persist Original Data`to`true`if you want to maintain the original document data from source to target.
     * Set`Clear Document Category`to`true`if you want to remove document categories in the target service.
2. **Execution:**
   * The activity will execute asynchronously, copying the specified documents to the target project and service, applying the given usage type and status.
   * If`Clear Document Category`is set to`true`, the category information will be cleared from the copied documents in the target service.
3. **Output:**
   * The activity returns a`List<DocumentViewModel>`, representing the copied documents in the target service.

**Considerations**

* **Data Integrity:** Ensure that the target project and service IDs are valid and accessible within your system to prevent errors during the copy operation.
* **Performance:** Copying a large number of documents may impact performance. Consider handling such operations in batches if needed.
* **Flexibility:** The activity provides flexibility in managing document metadata, such as usage type and status, during the copy process.

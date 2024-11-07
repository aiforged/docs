---
description: Process documents based on a list of document objects.
---

# Process Document Objects

**Properties**

* **Input**
  * **Target Project Id**
    * **Type:**`int`
    * **Description:** The target project where the documents are located. This is a required argument.
  * **Target Service Id**
    * **Type:**`int`
    * **Description:** The target service where the documents are located. This is a required argument.
  * **Document Objects**
    * **Type:**`List<DocumentViewModel>`
    * **Description:** A list of`AIForged.API.DocumentViewModel`objects to be processed. This is a required argument.
  * **Queue Processing**
    * **Type:**`bool?`
    * **Description:** Run document processing in the background. This is an optional argument.
    * **Default Value:**`false`
  * **Force Re-processing**
    * **Type:**`bool?`
    * **Description:** Force re-processing of documents. This is an optional argument.
  * **Delete Child Documents**
    * **Type:**`bool?`
    * **Description:** Delete linked child documents. This is an optional argument.
  * **Delete Child Documents Recursively**
    * **Type:**`bool?`
    * **Description:** Delete linked child documents recursively. This is an optional argument.
  * **Delete Previous Output Documents**
    * **Type:**`bool?`
    * **Description:** Delete any previously generated output documents. This is an optional argument.
  * **Reset Document Results**
    * **Type:**`bool?`
    * **Description:** Reset the document's results field. This is an optional argument.
  * **Reset Document Comments**
    * **Type:**`bool?`
    * **Description:** Reset the document's comment field. This is an optional argument.
  * **Timeout (milliseconds)**
    * **Type:**`int`
    * **Description:** The activity timeout in milliseconds.
    * **Default Value:**`120000`

**Usage**

1. **Setup Activity:**
   * Add the "Process Document Objects" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Target Project Id:** Specify the project ID where the documents are located.
     * **Target Service Id:** Specify the service ID where the documents are located.
     * **Document Objects:** Provide a list of`DocumentViewModel`objects to be processed.
   * Optionally, specify processing options such as queue processing, forcing re-processing, and deleting related documents or resetting fields.
2. **Execution:**
   * The activity executes asynchronously, processing the specified documents with the defined options.
   * It uses the configured API context to perform the processing via the services client.
3. **Output:**
   * The activity returns a`List<DocumentViewModel>`, representing the processed documents with updated information.

**Considerations**

* **Data Integrity:** Ensure that the project ID, service ID, and document objects are correctly specified to avoid errors during processing.
* **Processing Options:** Use the available options to control how documents are processed, including background processing, resetting fields, and handling related documents.
* **Timeout Handling:** Configure the timeout to accommodate expected processing durations, and implement error handling for timeout exceptions.
* **Permissions:** Verify that the necessary permissions are in place for the user or application processing the documents to prevent unauthorized actions.

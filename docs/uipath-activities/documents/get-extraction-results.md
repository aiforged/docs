---
description: Retrieve a document's extraction results by its unique identifier.
---

# Get Extraction Results

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document for which to retrieve extraction results. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Extraction Results" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Document Id:** Provide the ID of the document whose extraction results you wish to retrieve.
2. **Execution:**
   * The activity executes asynchronously, fetching the extraction results for the specified document ID.
   * It uses the configured API context to access the extraction results via the parameters client.
3. **Output:**
   * The activity returns a`List<DocumentExtraction>`, representing the extracted data for the specified document.

**Considerations**

* **Data Integrity:** Ensure that the document ID is valid and accessible to avoid errors during the extraction process.
* **Further Processing:** The resulting list of`DocumentExtraction`objects can be used for further processing, analysis, or reporting within your workflow.
* **Performance:** The execution time may vary depending on the size and complexity of the document. Ensure the system is properly configured to handle the expected load.


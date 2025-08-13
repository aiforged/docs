---
description: Retrieve a document's information by its unique identifier.
---

# Get Document

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document for which to retrieve information. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Document" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Document Id:** Provide the ID of the document whose information you wish to retrieve.
2. **Execution:**
   * The activity executes asynchronously, fetching the document information for the specified document ID.
   * It uses the configured API context to access the document data via the document client.
3. **Output:**
   * The activity returns a`DocumentViewModel`, representing the document's information, including details like metadata, status, and any associated properties.

**Considerations**

* **Data Integrity:** Ensure that the document ID is valid and accessible to avoid errors during the retrieval process.
* **Further Processing:** The resulting`DocumentViewModel`object can be used for further processing, analysis, or reporting within your workflow.
* **Performance:** The execution time may vary depending on the system's load and the document's complexity. Ensure your system is configured to handle the expected load efficiently.
 IgnoreCase Multiline IgnoreCase Multiline

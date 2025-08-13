---
description: Retrieve the full document parameter hierarchy for a given document.
---

# Get Document Parameter Hierarchy

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document for which to retrieve the parameter hierarchy. This is a required argument.
  * **Service Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the service where the document is located. This is a required argument.
  * **Include Verification Data**
    * **Type:**`bool?`
    * **Description:** Indicates whether to include verification data with each document parameter. This is an optional argument.
  * **Page Index**
    * **Type:**`int?`
    * **Description:** Filter on a specific page. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Document Parameter Hierarchy" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Id:** Provide the ID of the document for which you wish to retrieve the parameter hierarchy.
     * **Service Id:** Specify the ID of the service where the document is located.
   * Optionally, specify:
     * **Include Verification Data:** Set to`true`if you want to include verification data with each parameter.
     * **Page Index:** Provide a page index to filter results for a specific page.
2. **Execution:**
   * The activity executes asynchronously, retrieving the full parameter hierarchy for the specified document.
   * It uses the configured API context to access the parameter data via the parameters client.
3. **Output:**
   * The activity returns a`List<DocumentParameterViewModel>`, representing the complete parameter hierarchy for the specified document, optionally including verification data.

**Considerations**

* **Data Integrity:** Ensure that the document ID and service ID are valid and accessible to avoid errors during the retrieval process.
* **Optional Filters:** Use the optional filters to tailor the retrieval process to your specific needs, such as including verification data or focusing on a specific page.
* **Performance:** The execution time may vary depending on the size and complexity of the document and its parameters. Ensure the system is configured to handle the expected load efficiently.
 IgnoreCase Multiline IgnoreCase Multiline

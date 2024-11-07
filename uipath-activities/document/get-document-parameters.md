---
description: Retrieve a list of all the document parameters for a given document.
---

# Get Document Parameters

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document for which to retrieve parameters. This is a required argument.
  * **Service Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the service where the document is located. This is a required argument.
  * **Definition Category**
    * **Type:**`ParameterDefinitionCategory?`
    * **Description:** Filter by parameter definition category. This is an optional argument.
  * **Grouping Type**
    * **Type:**`GroupingType?`
    * **Description:** Filter by grouping type. This is an optional argument.
  * **Include Verification Data**
    * **Type:**`bool?`
    * **Description:** Indicates whether to include verification data with each document parameter. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Document Parameters" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Id:** Provide the ID of the document for which you wish to retrieve parameters.
     * **Service Id:** Specify the ID of the service where the document is located.
   * Optionally, specify:
     * **Definition Category:** Use this filter to retrieve parameters based on a specific category.
     * **Grouping Type:** Use this filter to retrieve parameters based on their grouping type.
     * **Include Verification Data:** Set to`true`if you want to include verification data with each parameter.
2. **Execution:**
   * The activity executes asynchronously, retrieving all document parameters for the specified document, optionally filtered by category and grouping type.
   * It uses the configured API context to access the parameter data via the parameters client.
3. **Output:**
   * The activity returns a`List<DocumentParameterViewModel>`, representing all the parameters for the specified document, optionally including verification data.

**Considerations**

* **Data Integrity:** Ensure that the document ID and service ID are valid and accessible to avoid errors during the retrieval process.
* **Optional Filters:** Utilize the optional filters to tailor the retrieval process to your specific needs, such as filtering by category or grouping type.
* **Performance:** The execution time may vary depending on the size and complexity of the document's parameters. Ensure the system is configured to handle the expected load efficiently.

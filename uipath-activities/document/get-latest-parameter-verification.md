---
description: >-
  Retrieve the latest verification result for a given document parameter or
  parameter definition.
---

# Get Latest Parameter Verification

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document for which to retrieve verification data. This is a required argument.
  * **Document Parameter Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the document parameter to retrieve verification data for. This is an optional argument.
  * **Parameter Definition Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the parameter definition to retrieve verification data for. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Latest Parameter Verification" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Document Id:** Provide the ID of the document for which you wish to retrieve the latest verification data.
   * Optionally, specify either:
     * **Document Parameter Id:** To retrieve verification data for a specific parameter.
     * **Parameter Definition Id:** To retrieve verification data for a specific parameter definition.
2. **Execution:**
   * The activity executes asynchronously, fetching the latest verification result for the specified document and parameter criteria.
   * It uses the configured API context to access the verification data via the verification client.
3. **Output:**
   * The activity returns a`VerificationViewModel`, representing the latest verification result for the specified document parameter or definition.

**Considerations**

* **Data Integrity:** Ensure that the document ID and any specified parameter or definition IDs are valid and accessible to avoid errors during the retrieval process.
* **Optional Parameters:** You can choose to specify either a document parameter ID or a parameter definition ID to narrow the search for verification data. If both are provided, the system will use the most specific filter available.
* **Further Processing:** The resulting`VerificationViewModel`can be used for further processing, analysis, or reporting within your workflow.

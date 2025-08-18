---
description: Retrieve a list of all parameter verifications for a given document parameter.
---

# Get Parameter Verifications

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document for which to retrieve parameter verification data. This is a required argument.
  * **Document Parameter Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the document parameter for which to retrieve verification data. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Parameter Verifications" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Document Id:** Provide the ID of the document for which you wish to retrieve parameter verifications.
   * Optionally, specify:
     * **Document Parameter Id:** Provide the ID of the specific parameter for which you wish to retrieve verifications.
2. **Execution:**
   * The activity executes asynchronously, retrieving all verification results for the specified document parameter.
   * It uses the configured API context to access the verification data via the verification client.
3. **Output:**
   * The activity returns a`List<VerificationViewModel>`, representing all the verifications for the specified document parameter.

**Considerations**

* **Data Integrity:** Ensure that the document ID is valid and accessible to avoid errors during the retrieval process. If specifying a parameter ID, ensure it corresponds to a valid parameter within the document.
* **Optional Parameter:** If the document parameter ID is not specified, the activity may return verification data for all parameters associated with the document.
* **Performance:** The execution time may vary depending on the number of verifications associated with the document's parameter(s). Ensure the system is configured to handle the expected load efficiently.


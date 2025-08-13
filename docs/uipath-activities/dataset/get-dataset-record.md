---
description: Get a dataset record by its key ID.
---

# Get Dataset Record

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The document ID of the dataset from which to retrieve the record. This is a required argument.
  * **Parameter Definition Id**
    * **Type:**`int`
    * **Description:** The parameter definition ID of the dataset from which to retrieve the record. This is a required argument.
  * **Key Id**
    * **Type:**`int`
    * **Description:** The key ID of the record to retrieve. This is a required argument.
  * **Include Verifications**
    * **Type:**`bool?`
    * **Description:** Specifies whether to include any verification values with the retrieved record. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Dataset Record" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Id:** Specify the document ID of the dataset.
     * **Parameter Definition Id:** Specify the parameter definition ID of the dataset.
     * **Key Id:** Provide the key ID of the record to retrieve.
   * Optionally, specify:
     * **Include Verifications:** Set to`true`if you want to include verification values with the retrieved record.
2. **Execution:**
   * The activity executes asynchronously, retrieving the specified dataset record using its key ID.
   * It uses the configured API context to access the record via the dataset client.
3. **Output:**
   * The activity returns a`CustomDataSetRecord`, representing the retrieved dataset record, optionally including verification values.

**Considerations**

* **Data Integrity:** Ensure that the document ID, parameter definition ID, and key ID are valid and correctly specified to avoid errors during retrieval.
* **Verification Data:** Use the Include Verifications option to obtain additional verification-related data if necessary.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the dataset record to prevent unauthorized actions.
* **Error Handling:** Implement error handling to manage potential issues such as network connectivity problems or invalid input data.

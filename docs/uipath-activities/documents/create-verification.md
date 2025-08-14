---
description: Create a new verification result on a specified document parameter.
---

# Create Verification

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the document on which the verification will be created. This is a required argument.
  * **Document Parameter Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document parameter for which the verification will be created. This is a required argument.
  * **Result Text**
    * **Type:**`string`
    * **Description:** Optional text that describes the verification result.
  * **Info Text**
    * **Type:**`string`
    * **Description:** Optional text providing additional information about the verification result.
  * **Verification Status**
    * **Type:**`VerificationStatus`
    * **Description:** The status flag(s) of the verification result, indicating the outcome or state of the verification.
  * **Value**
    * **Type:**`string`
    * **Description:** The value of the verification result.
  * **Previous Verification**
    * **Type:**`VerificationViewModel`
    * **Description:** A previous verification object for the specified document parameter. The new verification result will utilize the block info and confidence values from this object if provided.

**Usage**

1. **Setup Activity:**
   * Add the "Create Verification" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Id:** Specify the ID of the document for which the verification is being created.
     * **Document Parameter Id:** Specify the ID of the parameter for which the verification will be made.
   * Optionally, specify:
     * **Result Text:** Provide descriptive text for the verification result.
     * **Info Text:** Add any additional information related to the verification.
     * **Verification Status:** Set the status to reflect the verification outcome.
     * **Value:** Include the value associated with the verification result.
     * **Previous Verification:** Use data from a previous verification if applicable, to inherit block information and confidence values.
2. **Execution:**
   * The activity executes asynchronously, creating a new verification result for the specified document parameter.
   * The verification result is created using the provided details and any relevant data from a previous verification, if supplied.
3. **Output:**
   * The activity returns an`ObservableCollection<VerificationViewModel>`, representing the newly created verification result(s) for the document parameter.

**Considerations**

* **Data Integrity:** Ensure that the document and parameter IDs are valid and accessible to prevent errors during verification creation.
* **Optional Inputs:** Use the optional text fields to provide context or additional information about the verification, which can be useful for auditing or review purposes.
* **Confidence Inheritance:** If a previous verification is provided, block info and confidence values are inherited, which can help maintain consistency in verification metrics.


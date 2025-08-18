---
description: Rerun rules on a given verification.
---

# Rerun Verification

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document that owns the verification. This is a required argument.
  * **Verification**
    * **Type:**`VerificationViewModel`
    * **Description:** The verification object to rerun. This is a required argument.
  * **Value**
    * **Type:**`string`
    * **Description:** The new verification value. This is an optional argument.
  * **Confidence**
    * **Type:**`float?`
    * **Description:** The new confidence value. This is an optional argument.
  * **Status**
    * **Type:**`VerificationStatus?`
    * **Description:** The new status value. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Rerun Verification" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Id:** Provide the ID of the document that owns the verification.
     * **Verification:** Provide the verification object that you wish to rerun.
   * Optionally, specify new values for:
     * **Value:** Update the verification with a new value if needed.
     * **Confidence:** Set a new confidence level for the verification.
     * **Status:** Update the status of the verification.
2. **Execution:**
   * The activity executes asynchronously, rerunning the rules on the specified verification with any updated properties.
   * It uses the configured API context to update and rerun the verification via the verification client.
3. **Output:**
   * The activity returns an updated`VerificationViewModel`, representing the verification after rerunning the rules with any applied changes.

**Considerations**

* **Data Integrity:** Ensure that the document ID and verification object are valid and accessible to avoid errors during the rerun process.
* **Optional Updates:** Use the optional inputs to modify the verification's value, confidence, or status as necessary before rerunning.
* **Permissions:** Verify that the necessary permissions are in place for the user or application performing the rerun operation to prevent unauthorized actions.
* **Verification Logic:** Understand the logic and rules applied during verification reruns to ensure the desired outcome.


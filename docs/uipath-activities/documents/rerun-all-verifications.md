---
description: Rerun rules on all verifications in a document.
---

# Rerun All Verifications

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document on which to rerun verification rules. This is a required argument.
  * **Reset Verifications**
    * **Type:**`bool?`
    * **Description:** Indicates whether to restart the verification process from scratch, overwriting any user changes. This is a required argument.
  * **Run custom code after verification**
    * **Type:**`bool?`
    * **Description:** Indicates whether to run custom post-processing code services after verification rules have run. This is a required argument.
  * **Run custom workflow after verification**
    * **Type:**`bool?`
    * **Description:** Indicates whether to run custom post-processing workflow services after verification rules have run. This is a required argument.
  * **Run utilities after verification**
    * **Type:**`bool?`
    * **Description:** Indicates whether to run any post-processing utility services after verification rules have run. This is a required argument.
  * **Run any webhooks after verification**
    * **Type:**`bool?`
    * **Description:** Indicates whether to run any post-processing webhook services after verification rules have run. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Rerun All Verifications" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Id:** Provide the ID of the document for which you wish to rerun all verification rules.
     * **Reset Verifications:** Specify whether to reset verifications, starting from scratch and overwriting any user changes.
     * **Run custom code after verification:** Indicate whether to execute custom post-processing code.
     * **Run custom workflow after verification:** Indicate whether to execute custom post-processing workflows.
     * **Run utilities after verification:** Indicate whether to execute post-processing utility services.
     * **Run any webhooks after verification:** Indicate whether to execute post-processing webhooks.
2. **Execution:**
   * The activity executes asynchronously, rerunning all verification rules on the specified document with the specified post-processing options.
   * It uses the configured API context to perform the verification rerun via the verification client.
3. **Output:**
   * The activity returns a`bool`indicating the success of the operation:
     * `true`if the verification rerun and any specified post-processing were successfully executed.
     * `false`if the operation failed.

**Considerations**

* **Data Integrity:** Ensure that the document ID is valid and accessible to avoid errors during the rerun process.
* **Reset Option:** Be cautious with the reset option, as it will overwrite any manual changes made by users.
* **Post-processing:** Understand the implications of running custom code, workflows, utilities, and webhooks to ensure they align with your business logic.
* **Permissions:** Verify that the necessary permissions are in place for the user or application performing the rerun operation to prevent unauthorized actions.
 IgnoreCase Multiline IgnoreCase Multiline

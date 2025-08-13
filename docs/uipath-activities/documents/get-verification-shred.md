---
description: Returns the shred image for a given verification.
---

# Get Verification Shred

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document where the verification exists. This is a required argument.
  * **Document Parameter Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document parameter that contains the verification. This is a required argument.
  * **Verification Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the verification result. This is a required argument.
  * **Inline**
    * **Type:**`bool`
    * **Description:** Indicates whether to return an inline result. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Verification Shred" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Id:** Provide the ID of the document where the verification exists.
     * **Document Parameter Id:** Provide the ID of the document parameter that contains the verification.
     * **Verification Id:** Provide the ID of the verification result.
     * **Inline:** Specify whether the result should be returned inline.
2. **Execution:**
   * The activity executes asynchronously, retrieving the shred image for the specified verification.
   * It uses the configured API context to access the shred image data via the verification client.
3. **Output:**
   * The activity returns a`FileResponse`, representing the shred image file for the specified verification.

**Considerations**

* **Data Integrity:** Ensure that the document ID, parameter ID, and verification ID are valid and accessible to avoid errors during the retrieval process.
* **Inline Option:** The`Inline`property determines how the image is returned. Ensure this is configured according to your workflow's requirements.
* **Further Processing:** The resulting`FileResponse`can be used for further processing, analysis, or display within your workflow, depending on how the shred image is intended to be utilized.
 IgnoreCase Multiline IgnoreCase Multiline

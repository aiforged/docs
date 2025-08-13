# Human in the Loop

Although OCR technologies have come a long way, there will still be instances where a little human intervention is required to **Verify** extracted data. To this end, **Workflow Items** can be created for **Human Verification**.

A user can be added to a **Project** or a **Service** with the Verification Role to assist the **OCR Engine** to correct data that have been extracted. The **Work Flow** can be set up to send out notifications to the **HITL** when **Work Flow Item** is created.

## Possible Reasons for HITL

There are multiple reasons for extracted data to be verified by a **HITL**. These include, but are not limited to:

* Poor **OCR Confidence** due to poor quality documents.
* Illegible handwriting on handwritten forms.
* An applied **Rule** failed the verification of an extracted field. See [Rules Engine](broken-reference) for more information.
* A required field was not detected by the **OCR Engine**.
* Supporting document data do not match (E.g. the name on a bank statement does not match the ID cards received. Refer to [Practical Example](../practical-examples/credit-application-process-accept-or-reject-the-application.md) for an example.
* Any **Custom Code** logic that places a **Parameter** in the **Verification** state. Refer to [Custom Service Code](../../human-in-the-loop/custom-service-code/) for more information.
 IgnoreCase Multiline IgnoreCase Multiline

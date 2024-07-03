# Human in the Loop

Although OCR technologies have come a long way, there will still be instances where a little human intervention is required to **Verify** extracted data. To this end, **Workflow Items** can be created for **Human Verification**.

A user can be added to a **Project** or a **Service** with the Verification Role to assist the **OCR Engine** to correct data that have been extracted. The **Work Flow** can be set up to send out notifications to the **HITL** when **Work Flow Item** is created.

## Possible Reasons for HITL

There are multiple reasons for extracted data to be verified by a **HITL**. These include, but are not limited to:

* Poor **OCR Confidence** due to poor quality documents.
* Illegible handwriting on handwritten forms.
* An applied **Rule** failed the verification of an extracted field. See [Rules Engine](rules-engine/rules-engine.md) for more information.
* A required field was not detected by the **OCR Engine**.
* Supporting document data do not match (E.g. the name on a bank statement does not match the ID cards received. Refer to [Practical Example](practical-examples/credit-application-process-accept-or-reject-the-application.md) for an example.
* Any **Custom Code** logic that places a **Parameter** in the **Verification** state. Refer to [Custom Service Code](custom-service-code/) for more information.

## Work Flow and Work Flow Items

The **Work Flow** view visually shows Work Flow Items that require attention from a **HITL**.

<figure><img src="../.gitbook/assets/image (152).png" alt=""><figcaption></figcaption></figure>

The **HITL Work Flow** queue shows **Work Flow Items** that have been created for your **Username**. The Work Flow Item card shows all the information regarding the Verification required, these include:

*   The Project name,

    <figure><img src="../.gitbook/assets/image (165).png" alt=""><figcaption></figcaption></figure>
*   The Service name,

    <figure><img src="../.gitbook/assets/image (3) (9).png" alt=""><figcaption></figcaption></figure>
*   The document box the document currently resides in (document **Usage**),

    <figure><img src="../.gitbook/assets/image (58) (1).png" alt=""><figcaption></figcaption></figure>
*   Due date for the verification to be completed,

    <figure><img src="../.gitbook/assets/image (54) (3).png" alt=""><figcaption></figcaption></figure>
*   The **HITL** user assignment method used,

    <figure><img src="../.gitbook/assets/image (12) (4).png" alt=""><figcaption></figcaption></figure>
*   The status of the document of the field that requires verification,

    <figure><img src="../.gitbook/assets/image (9) (4).png" alt=""><figcaption></figcaption></figure>
*   The status of the **Work Flow Item**,

    <figure><img src="../.gitbook/assets/image (13) (4).png" alt=""><figcaption></figcaption></figure>

Every **Work Flow Item** has a **URL** link that can be used in a browser. This will launch the AIForged UI and open the Verification window for the entire **Document** or **Shred**. The link to the **Verification Work Flow Item** can be copied by clicking on the **Link Icon**.

<figure><img src="../.gitbook/assets/image (45).png" alt=""><figcaption></figcaption></figure>

Pasting this link in a web browser will result in the user being asked to open the **AIForgred UI**.

<figure><img src="../.gitbook/assets/image (168).png" alt=""><figcaption></figcaption></figure>

## Field Verification

Clicking on a **Work Flow Item** will open the **Document Verification** window. The user will be instructed to complete any verifications that are required on the document.

### Individual Field Verification

<figure><img src="../.gitbook/assets/image (184).png" alt=""><figcaption></figcaption></figure>

The number of fields that require verification is shown at the top of the **Document Designer** view.

<figure><img src="../.gitbook/assets/image (208).png" alt=""><figcaption></figcaption></figure>

The **Document Data Control** bar on the right-hand side shows the fields that require verification, which is denoted by the red **Warning Triangle**. This is also shown on the document at the location of the field.

<figure><img src="../.gitbook/assets/image (21) (5).png" alt=""><figcaption></figcaption></figure>

To verify the value of the extracted text, click on the **Pencil** icon. This will open a dialogue that provides actions to the user to verify the field.

<figure><img src="../.gitbook/assets/image (43).png" alt=""><figcaption></figcaption></figure>

The value of the field is shown in the text box. If the OCR text is correct, the user can accept the Verification by clicking on the **Check Mark**.

<figure><img src="../.gitbook/assets/image (15) (4).png" alt=""><figcaption></figcaption></figure>

Note that after a **Verification** value has been accepted, the **Status** of the **Field Parameter** has changed to **Verified**. The OCR **Confidence** has also changed to **100 %**.

<figure><img src="../.gitbook/assets/image (151).png" alt=""><figcaption></figcaption></figure>

Once all the Field Parameters that required Verification have been verified, then the status of the entire document will change from **Verification** to **Processed**.

<figure><img src="../.gitbook/assets/image (8) (5).png" alt=""><figcaption></figcaption></figure>

### Accept all Verifications

It is also possible to accept all **Verification** without manually verifying each **Field** that required **Verification**. Select **Verification** from the **Actions Bar**, then select **Accept All** to immediately accepts all **Verification** values.

<figure><img src="../.gitbook/assets/image (20).png" alt=""><figcaption></figcaption></figure>

This action will also immediately place the document in the **Processed** state from the **Verification** state.

<figure><img src="../.gitbook/assets/image (7) (4).png" alt=""><figcaption></figcaption></figure>

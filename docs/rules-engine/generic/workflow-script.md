# Workflow Script

Similar to **Custom Script Code**, **Workflow Script Code** can be applied to individual fields.

**Workflow Script Code** can be added to a **Service** as an independent **Utility**, or it can be applied to individual fields on a document. When applying **Workflow Code Rule** to a field, the **Custom Logic** can be used to manipulate the extracted OCR value. The use cases for applying Custom Code to a field includes:

* Creating **Workflow Items** for manual intervention (Human-in-the-Loop).
* Copying documents to and from other **Services**.
* Specifying **Verification** status conditions for **Parameters**.

The following languages are available for selection when writing **Workflow Code**:

* C#
* Visual Basic
* Python
* F#

The language can be selected form the **Code Language** dropdown box. Refer to [BaseModule](../../custom-service-code/basemodule/ibasemodule-interface-data-types.md) for the available exposed methods that can be used in **Workflow Code**.

<figure><img src="../../assets/image (117).png" alt=""><figcaption></figcaption></figure>


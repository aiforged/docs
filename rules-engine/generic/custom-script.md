---
title: Custom Script Code
parent: Generic Rules
grand_parent: Rules Engine
nav_order: 6
---

# Custom Script

The **Custom Script Rule** provides a means to write **Custom Script Code** for a specific field on a document. The script is executed after the value has been extracted by the **OCR Service**.

**Custom Script Code** can be added to a **Service** as an independent **Utility**, or it can be applied to individual fields on a document. When applying **Custom Code Rule** to a field, the **Custom Logic** can be used to manipulate the extracted OCR value. The use cases for applying Custom Code to a field includes:

* Custom manipulation of individual **Parameter** values.
* Creating additional custom **Parameters**.
* Updating **Parameter** values or confidences on other documents.
* Creating and updating Custom Datasets (refer to Custom Datasets).
* Any required Custom Logic which cannot be implemented by any of the other **Rules Engine Rule Types**.

The following languages are available for selection when writing **Custom Code**:

* C#
* Visual Basic
* Python
* F#

The language can be selected form the **Code Language** dropdown box. Refer to [BaseModule](../../services/custom-service-code/basemodule/ibasemodule-interface-data-types.md) for the available exposed methods that can be used in **Custom Code**.

<figure><img src="../../.gitbook/assets/image (1) (3) (1).png" alt=""><figcaption></figcaption></figure>

For a detailed walkthrough of a practical example of **Custom Code**, please refer to [Credit Application Process: Accept or Reject the Application](../../practical-examples/credit-application-process-accept-or-reject-the-application.md).

---
title: Services
nav_order: 14
has_children: true
---

# Understanding Services

## What is a Service?

A **Service** is a container that hosts an OCR engine and provides a means to receive and process documents. Documents to be processed are received in Service **Inbox**, and the **Extracted Results** are presented in the documents in die Service **Outbox**.

**Services** can be contained within other **Services**, and are called **Child Services**. This is normally the case when certain [Rule Types](../rules-engine/rules-engine.md) are applied to certain fields in the document.

The example project below shows a **Service Box**, which is the **Parent Service** for three **Child Services**.

<figure><img src="../.gitbook/assets/image (11) (2).png" alt=""><figcaption></figcaption></figure>

The following **Action Buttons** can be found on the **Service Box**, the number indicates the document count for each of the boxes:

| Action Button        | Icon                                            | Descritpion                                                  |
| -------------------- | ----------------------------------------------- | ------------------------------------------------------------ |
| Definition           | ![](<../.gitbook/assets/image (14) (2).png>)    | Takes the user to the Definitions box of the service.        |
| Training             | ![](<../.gitbook/assets/image (26).png>)        | Takes the user to the Training documents box of the service. |
| Labelled             | ![](<../.gitbook/assets/image (8) (1).png>)     | Takes the user to the Labelled documents box of the service. |
| Inbox                | ![](<../.gitbook/assets/image (6) (2) (1).png>) | Takes the user to the Document Inbox of the service.         |
| Outbox               | ![](<../.gitbook/assets/image (15) (3).png>)    | Takes the user to the Document Outbox of the service.        |
| Configuration Wizard | ![](<../.gitbook/assets/image (12) (2).png>)    | Opens the Configuration Wizard of the service.               |
| Service Definitions  | ![](<../.gitbook/assets/image (3) (2).png>)     | Open the Parameter Definitions of the service.               |
| Service Logs         | ![](<../.gitbook/assets/image (10) (5).png>)    | Opens the Service Logs of the service.                       |
| Delete Service       | ![](<../.gitbook/assets/image (16) (4).png>)    | Delete the service.                                          |

## How to create a Service?

1. Open an existing Project, or create a new one.
2.  At the bottom of the AIForged UI, select **Add Service.**

    <figure><img src="../.gitbook/assets/image (20) (3).png" alt=""><figcaption></figcaption></figure>
3.  The "_Add New Service"_ dialogue pops up.

    <figure><img src="../.gitbook/assets/image (9) (3).png" alt=""><figcaption></figcaption></figure>
4. Select the **Service Type** of the service and click on **Select**.
5.  Click **Yes** on the confirmation message box.

    <figure><img src="../.gitbook/assets/image (22) (2).png" alt=""><figcaption></figcaption></figure>

## Service Actions

Other **Service Actions** are (found at the bottom of the AIForged UI):

*   Document Categories.

    <figure><img src="../.gitbook/assets/image (24) (1).png" alt=""><figcaption></figcaption></figure>
*   Document Keys

    <figure><img src="../.gitbook/assets/image (18).png" alt=""><figcaption></figcaption></figure>
*   All Definitions of the service.

    <figure><img src="../.gitbook/assets/image (25) (5).png" alt=""><figcaption></figcaption></figure>
*   Manage Users for the service.

    <figure><img src="../.gitbook/assets/image (17) (1).png" alt=""><figcaption></figcaption></figure>
*   Share a service on the marketplace.

    <figure><img src="../.gitbook/assets/image (13) (3).png" alt=""><figcaption></figcaption></figure>
*   Open Report for the service.

    <figure><img src="../.gitbook/assets/image (21) (2).png" alt=""><figcaption></figcaption></figure>


---
title: Understanding Services
nav_order: 14
has_children: true
---

# Understanding Services

## What is a Service?

A **Service** is an AIForged function. It can be any of the available **Service Types,** such as an OCR engine that performs optical character recognition on a document, or an email scraper that downloads emails from a mailbox and separates attachments as useable objects, or even a simple copy function that can copy objects from one service's **Outbox** to another service's **Inbox**.

A service typically has an **Inbox** and **Outbox.** The **Inbox** stores objects that need to be processed by the service. The **Outbox** contains the processing results.

Depending on the service type, a service can also have a **Definition Box**, **Training Box**, and **Label Box.**

Multiple **Services** can be nested within a **Service**. These nested services are called **Child Services**. **Child Services** will automatically be added to a service depending on the **Service Type's** dependencies, or [**Rule Type**](../rules-engine/rules-engine.md) dependencies, but can also be manually added to extend a service's functionality.

The example below shows a **Service Card** within a **Service's Detail View**, which in this case represents a **Parent Service** with three **Child Services**.

<figure><img src="../.gitbook/assets/image (19) (2).png" alt=""><figcaption></figcaption></figure>

The following **Action Buttons** can be found in a **Service Card**, the number indicates the document count for each of the boxes:

| Action Button        | Icon                                                | Descritpion                                                                                                        |
| -------------------- | --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| Definition           | ![](<../.gitbook/assets/image (14) (2).png>)        | Opens the **Definitions box** of the service. (Only valid for **Classification** and **Extraction Service Types**) |
| Training             | ![](<../.gitbook/assets/image (26) (1).png>)        | Opens the **Training box** of the service. (Only valid for **Classification** and **Extraction Service Types**)    |
| Labelled             | ![](<../.gitbook/assets/image (8) (1).png>)         | Opens the **Label box** of the service. (Only valid for **Classification** and **Extraction Service Types**)       |
| Inbox                | ![](<../.gitbook/assets/image (6) (2) (1).png>)     | Opens the **Inbox** of the service.                                                                                |
| Outbox               | ![](<../.gitbook/assets/image (4) (3) (1) (2).png>) | Opens the **Outbox** of the service.                                                                               |
| Configuration Wizard | ![](<../.gitbook/assets/image (12) (2).png>)        | Opens the **Configuration Wizard** of the service.                                                                 |
| Service Definitions  | ![](<../.gitbook/assets/image (3) (2) (1).png>)     | Opens the **Configuration page** of the service.                                                                   |
| Service Logs         | ![](<../.gitbook/assets/image (10) (5).png>)        | Opens the **Service Logs** of the service.                                                                         |
| Delete Service       | ![](<../.gitbook/assets/image (16) (4).png>)        | Deletes the service.                                                                                               |

## How to create a Service?

1. Open an existing **Project**, or create a new **Project**.
2.  At the bottom of the **Project Detail View**, select **Add Service.**

    <figure><img src="../.gitbook/assets/image (20) (3) (1) (1) (1) (2).png" alt=""><figcaption></figcaption></figure>
3.  The **Add New Service** dialogue will open.\


    <figure><img src="../.gitbook/assets/image (9) (3).png" alt=""><figcaption></figcaption></figure>
4. Select the **Service Type** of the **Service** you want to add and click on **Select**.
5.  Click **Yes** on the confirmation message box.

    <figure><img src="../.gitbook/assets/image (22) (2).png" alt=""><figcaption></figcaption></figure>

## Service Actions

Various **Service Actions** are available from the **Command Bar** of the **Service Detail View.**

*   Document Categories.

    <figure><img src="../.gitbook/assets/image (24) (1) (1).png" alt=""><figcaption></figcaption></figure>
*   Document Keys

    <figure><img src="../.gitbook/assets/image (18) (1).png" alt=""><figcaption></figcaption></figure>
*   All Definitions of the service.

    <figure><img src="../.gitbook/assets/image (25) (5).png" alt=""><figcaption></figcaption></figure>
*   Manage User access for the service.

    <figure><img src="../.gitbook/assets/image (17) (1) (1).png" alt=""><figcaption></figcaption></figure>
*   Share a service on the marketplace.

    <figure><img src="../.gitbook/assets/image (13) (3).png" alt=""><figcaption></figcaption></figure>
*   Open Report for the service.

    <figure><img src="../.gitbook/assets/image (21) (2).png" alt=""><figcaption></figcaption></figure>

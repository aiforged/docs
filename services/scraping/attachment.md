---
title: Attachment
parent: Scraping
grand_parent: Understanding Services
nav_order: 3
---

# Attachment

<figure><img src="../../.gitbook/assets/image (40) (2).png" alt=""><figcaption></figcaption></figure>

The **Attachment** service allows you to extract attachments from e-mails.&#x20;

## Possible use cases

* Can be used to extract attachments from Emails for further document analysis or other use cases where you might be required to extract attachments

## Service Setup

1. Open the **Project Detail View** of the service you would like to add the service to.
2. Click on the **Add Service** button in the command bar.\
   ![](<../../.gitbook/assets/image (16).png>)
3.  Select **Attachment Service** from the available **Service Types.**

    <figure><img src="../../.gitbook/assets/image (14).png" alt=""><figcaption></figcaption></figure>
4.  This will add the **Attachment Service** with a **Dependent OCR Engine** that needs to be configured.

    <figure><img src="../../.gitbook/assets/image (12) (1).png" alt=""><figcaption></figcaption></figure>
5.  In order to configure the OCR service for the **Attachment Service**, click on the **Wizard** icon of the **Attachment Service**.

    <figure><img src="../../.gitbook/assets/image (10).png" alt=""><figcaption></figcaption></figure>
6.  A new **Service Configuration Wizard** will open:\
    (When navigating the Wizard, please make sure to use the **Next Step** button in the command bar to save any changes made).

    <figure><img src="../../.gitbook/assets/image (8) (1).png" alt=""><figcaption></figcaption></figure>

    * **Step 1** **-** Allows configuration of various service settings, including the name and description. The default settings are sufficient for most use cases.
    *   **Step 2 -** Allows adding an OCR Engine to the Attachment Service. Click on the Step 2 card to open the Select a Service popup. Only OCR and Extraction Services are listed here.

        <figure><img src="../../.gitbook/assets/image (4) (1) (3).png" alt=""><figcaption></figcaption></figure>

        Click on Complete to finish the Wizard.\
        ![](<../../.gitbook/assets/image (84) (1).png>)

## Service Configuration Settings

The **Attachment Service** can be configured by the user as a flexible solution. The following **Settings** are available:

| Setting                 | Type                                                               | Required Type | Description                                                                                                                  |
| ----------------------- | ------------------------------------------------------------------ | ------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| ArchivingStrategy       | ![](<../../.gitbook/assets/image (14) (6).png>)                    | Optional      | Days before documents get deleted.                                                                                           |
| BatchSize               | ![](<../../.gitbook/assets/image (5) (3).png>)                     | Hidden        | Processing batch size.                                                                                                       |
| DocumentProcessedStatus | ![](<../../.gitbook/assets/image (6) (4).png>)                     | Optional      | Document status used to denote that a document has been processed.                                                           |
| Enabled                 | ![](<../../.gitbook/assets/image (15) (1) (6).png>)                | Hidden        | Enable or disable the service.                                                                                               |
| ExecuteBeforeProcess    | ![](<../../.gitbook/assets/image (15) (1) (3).png>)                |               | When set up as a child service, specify whether this service should be executed **before** the parent service gets executed. |
| ExecuteAfterProcess     | ![](<../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (4).png>) |               | When set up as a child service, specify whether this service should be executed **after** the parent service gets executed.  |
| MinHeight               | ![](<../../.gitbook/assets/image (5) (3).png>)                     | Optional      | Minimum height of the image in pixels.                                                                                       |
| MinSize                 | ![](<../../.gitbook/assets/image (5) (3).png>)                     | Optional      | Minimum size of the image in bytes.                                                                                          |
| MinWidth                | ![](<../../.gitbook/assets/image (5) (3).png>)                     | Optional      | Minimum width of the image in pixels.                                                                                        |
| Password                | ![](<../../.gitbook/assets/image (3) (5) (1).png>)                 | Optional      | Used for service authentication. Custom Code can be used to set the password. Can be set per document.                       |
| RemoveComments          | ![](<../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (7).png>) | Optional      | Remove human comments from a document.                                                                                       |

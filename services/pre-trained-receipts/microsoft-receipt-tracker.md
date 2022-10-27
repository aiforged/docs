---
title: Microsoft Receipt
parent: Pretrained Receipts
grand_parent: Understanding Services
nav_order: 1
---

# Microsoft Receipts

<figure><img src="../../.gitbook/assets/image (26) (3) (1).png" alt=""><figcaption></figcaption></figure>

The ​**Microsoft Receipts Service** makes use of pre-trained Invoice models to extract **Key-Value Pairs** of invoice-related data making use of **Microsoft Cognitive Services**. The processing of invoices returns typical information found on invoices, such as **Subtotal, Vat, Total,** and **Date**. **Microsoft Receipts** allows users to categorize and visualize their expenses. Below is an example of a receipt.

<figure><img src="../../.gitbook/assets/image (4) (1).png" alt=""><figcaption></figcaption></figure>

The service extracts basic fields that can typically be found on a **Receipt**, such as the **Receipt #**, **Receipt Date**, **Vendor Name**, **Shipping Address Recipient**, and **Purchase Orders**, to name a few. In addition to this, the line items are also extracted.&#x20;

<figure><img src="../../.gitbook/assets/image (3).png" alt=""><figcaption></figcaption></figure>

## Supported Content Types

* Pdf
* jpeg
* png

If you need to use a different type of content, you can use the **AIForged Pdf Converter**.

## Possible use cases

* Extract data from receipts
* Visualize your receipts data

## Service Setup

1. Open the **Project Detail View** of the project you would like to add the service to.
2. Click on the **Add Service** button in the command bar.\
   ![](<../../.gitbook/assets/image (82) (1).png>)
3.  Select **Microsoft Receipts Service** from the available **Service Types.**

    <figure><img src="../../.gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>
4.  A new **Service Configuration Wizard** will open:\
    (When navigating the Wizard, please make sure to use the **Next Step** button in the command bar to save any changes made).

    <figure><img src="../../.gitbook/assets/image (2) (1).png" alt=""><figcaption></figcaption></figure>

    * **Step 1** **-** Allows configuration of various service settings, including the name and description. The default settings are sufficient for most use cases.
    * **Step 2 -** Verification of any documents that have been processed.\
      ![](<../../.gitbook/assets/image (84) (1).png>)

## Service Configuration Settings

The **Microsoft ReceiptService** can be configured by the user as a flexible solution. The following **Settings** are available:

| Setting                 | Type                                                           | Required Type | Description                                                                                                                  |
| ----------------------- | -------------------------------------------------------------- | ------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| ArchivingStrategy       | ![](<../../.gitbook/assets/image (5) (3) (1).png>)             | Optional      | Days before documents get deleted.                                                                                           |
| BatchSize               | ![](<../../.gitbook/assets/image (14) (6).png>)                | Hidden        | Processing batch size.                                                                                                       |
| DocumentProcessedStatus | ![](<../../.gitbook/assets/image (6) (4).png>)                 | Optional      | Document status used to denote that a document has been processed.                                                           |
| Enabled                 | ![](<../../.gitbook/assets/image (15) (5) (1).png>)            | Hidden        | Enable or disable the service.                                                                                               |
| ExecuteBeforeProcess    | ![](<../../.gitbook/assets/image (15) (5).png>)                |               | When set up as a child service, specify whether this service should be executed **before** the parent service gets executed. |
| ExecuteAfterProcess     | ![](<../../.gitbook/assets/image (1) (1) (3) (1) (2).png>)     |               | When set up as a child service, specify whether this service should be executed **after** the parent service gets executed.  |
| Password                | ![](<../../.gitbook/assets/image (3) (5) (1).png>)             | Optional      | Used for service authentication. Custom Code can be used to set the password. Can be set per document.                       |
| RemoveComments          | ![](<../../.gitbook/assets/image (1) (1) (3) (1) (2) (1).png>) | Optional      | Remove human comments from a document.                                                                                       |

## Add and Process Documents

1. In the **Microsoft Receipts Service** click on **Inbox** in the App Bar.
2. Select the Status you want to upload and use Status **None** or **Received** for new documents that have not been processed yet.
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”.
4. Find the files on your Local machine and upload them. **The demo's test files can be found at the following link:** [**Click here**](https://docs.aiforged.com/DemoDocuments/ABBYY%20Classification%20%20Testing.zip)​
5. After all the documents have been uploaded you can check the documents to be processed, click on **Processed Checked** to process the documents.

It is recommended to only process a few documents at a time, especially if it is a new service to properly test if you receive the results you want before processing everything.

## View Processed Documents

1. In the **Microsoft Receipts Service** click on **Outbox** button.
2. You can view the **Processing** results by opening a processed doc for verification.

##

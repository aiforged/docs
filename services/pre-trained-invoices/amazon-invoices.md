---
title: Amazon Invoices
parent: Pretrained Invoices
grand_parent: Understanding Services
nav_order: 1
---

# Amazon Invoice Extraction

<figure><img src="../../.gitbook/assets/image (44) (3).png" alt=""><figcaption></figcaption></figure>

The ​**Amazon Invoice Extraction Service** makes use of pre-trained Invoice models to extract **Key-Value Pairs** of invoice-related data. The processing of invoices returns typical information found on invoices, such as **Subtotal, Vat, Total,** and **Date**. The service also extracts individual line items from the invoice and is presented in table format.

## Possible use cases <a href="#possible-use-cases" id="possible-use-cases"></a>

* Extracting invoice-related data.
* Extracting individual line items that may appear on an invoice.

## Service Setup

1. Open the **Project Detail View** of the project you would like to add the service to.
2. Click on the **Add Service** button in the command bar.\
   ![](<../../.gitbook/assets/image (82) (1).png>)
3.  Select **Amazon Invoice Extraction Service** from the available **Service Types.**

    <figure><img src="../../.gitbook/assets/image (1) (2) (2).png" alt=""><figcaption></figcaption></figure>
4. A new **Service Configuration Wizard** will open:\
   (When navigating the Wizard, please make sure to use the **Next Step** button in the command bar to save any changes made).

<figure><img src="../../.gitbook/assets/image (1) (1).png" alt=""><figcaption></figcaption></figure>

1. **Step 1** **-** Allows configuration of various service settings, including the name and description. The default settings are sufficient for most use cases.
2. **Step 2 -** Allows adding **User Defined Categories** to train the service on.
3. **Step 3 -** Verification of any documents that have been processed.
4. **Step 4** - The **Definition Document** should be created after the **Service** has been trained successfully.
5. Click on the **Complete** button in the command bar to validate your service configuration and close the wizard.\
   ![](<../../.gitbook/assets/image (84) (1).png>)

## Service Configuration Settings

The **Amazon Invoice Extraction** can be configured by the user as a flexible solution. The following **Settings** are available:​

| Setting                 | Type                                                       | Required Type | Description                                                                                                                  |
| ----------------------- | ---------------------------------------------------------- | ------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| ArchivingStrategy       | ![](<../../.gitbook/assets/image (5) (3).png>)             | Optional      | Days before documents get deleted.                                                                                           |
| BatchSize               | ![](<../../.gitbook/assets/image (14) (6).png>)            | Hidden        | Processing batch size.                                                                                                       |
| DocumentProcessedStatus | ![](<../../.gitbook/assets/image (6) (4).png>)             | Optional      | Document status used to denote that a document has been processed.                                                           |
| Enabled                 | ![](<../../.gitbook/assets/image (18).png>)                | Hidden        | Enable or disable the service.                                                                                               |
| EnableTableDetection    | ![](<../../.gitbook/assets/image (15).png>)                | Optional      | Specifies whether the service should save any tables detected by the MS Form Recognizer API call.                            |
| ExecuteBeforeProcess    | ![](<../../.gitbook/assets/image (15) (5).png>)            |               | When set up as a child service, specify whether this service should be executed **before** the parent service gets executed. |
| ExecuteAfterProcess     | ![](<../../.gitbook/assets/image (1) (1) (3) (1) (3).png>) |               | When set up as a child service, specify whether this service should be executed **after** the parent service gets executed.  |
| Password                | ![](<../../.gitbook/assets/image (3) (5) (1).png>)         | Optional      | Used for service authentication. Custom Code can be used to set the password. Can be set per document.                       |
| RemoveComments          | ![](<../../.gitbook/assets/image (1) (1) (3) (1) (5).png>) | Optional      | Remove human comments from a document.                                                                                       |
| WorkflowAlgorithm       | ![](<../../.gitbook/assets/image (2) (7).png>)             | Required      | Algorithm used for assigning users for verification for workflow item.                                                       |
| WorkflowCategory        | ![](<../../.gitbook/assets/image (14) (6).png>)            | Optional      | Trigger Workflow for all documents in this category (category ID).                                                           |
| WorkflowDocument        | ![](<../../.gitbook/assets/image (1) (1) (3) (1) (2).png>) | Required      | Enable document workflow for this service.                                                                                   |
| WorkflowShred           | ![](<../../.gitbook/assets/image (1) (1) (3) (1).png>)     | Required      | Enable document shred workflow for this service.                                                                             |
| WorkflowGracePeriod     | ![](<../../.gitbook/assets/image (13) (6).png>)            | Required      | Grace period before a workflow item gets escalated.                                                                          |

## Add and Process Documents <a href="#add-and-process-documents" id="add-and-process-documents"></a>

1. In the **Amazon Invoice Extraction Service** click on **Inbox** button.
2. Select the Status you want to upload and use Status **None** or **Received** for new documents that have not been processed yet.
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”.
4. Find the files on your Local machine and upload them. **The demo's test files can be found at the following link:** [**Click here**](https://docs.aiforged.com/DemoDocuments/ABBYY%20Classification%20%20Testing.zip)​
5. After all the documents have been uploaded you can check the documents to be processed, click on **Processed Checked** to process the documents.

It is recommended to only process a few documents at a time, especially if it is a new service to properly test if you receive the results you want before processing everything.

## View Processed Documents <a href="#view-processed-documents" id="view-processed-documents"></a>

1. In the **Amazon Invoice Extraction Service** click on **Outbox** button.
2. You can view the **Processing** results by opening a processed doc for verification.


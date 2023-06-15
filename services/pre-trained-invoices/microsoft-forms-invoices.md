---
title: Microsoft Invoices
parent: Pretrained Invoices
grand_parent: Understanding Services
nav_order: 3
---

# Microsoft Invoices

​

<figure><img src="../../.gitbook/assets/image (28) (1).png" alt=""><figcaption></figcaption></figure>

The ​**Microsoft Invoice Service** makes use of pre-trained Invoice models to extract **Key-Value Pairs** of invoice-related data making use of **Microsoft Cognitive Services**. The processing of invoices returns typical information found on invoices, such as **Subtotal, Vat, Total,** and **Date**. The service also extracts individual line items from the invoice and is presented in table format.

No custom training of a **Microsoft Invoices Service** is required. The service utilizes internal pre-built invoice models when trying to extract information from **Invoice Documents**.

## Possible use cases <a href="#possible-use-cases" id="possible-use-cases"></a>

* Extracting invoice-related data.
* Extracting individual line items that may appear on an invoice.

## Service Setup

1. Open the **Project Detail View** of the project you would like to add the service to.
2. Click on the **Add Service** button in the command bar.\
   ![](<../../.gitbook/assets/image (82) (1).png>)
3.  Select **Microsoft Invoices Service** from the available **Service Types.**

    <figure><img src="../../.gitbook/assets/image (27).png" alt=""><figcaption></figcaption></figure>
4.  A new **Service Configuration Wizard** will open:\
    (When navigating the Wizard, please make sure to use the **Next Step** button in the command bar to save any changes made).



    <figure><img src="../../.gitbook/assets/image (3) (5).png" alt=""><figcaption></figcaption></figure>

    1. **Step 1** **-** Allows configuration of various service settings, including the name and description. The default settings are sufficient for most use cases.
    2. **Step 2 -** Allows adding **User Defined Categories** to train the service on.
    3. **Step 3 -** Verification of any documents that have been processed.
    4. **Step 4** - The **Definition Document** should be created after the **Service** has been trained successfully.
    5. Click on the **Complete** button in the command bar to validate your service configuration and close the wizard.\
       ![](<../../.gitbook/assets/image (84) (1).png>)

## Service Configuration Settings

The **Microsoft Invoices Service** can be configured by the user as a flexible solution. The following **Settings** are available:

<table><thead><tr><th width="256">Setting</th><th width="126">Type</th><th width="139">Required Type</th><th>Description</th></tr></thead><tbody><tr><td>ArchivingStrategy</td><td><img src="../../.gitbook/assets/image (5) (3).png" alt=""></td><td>Optional</td><td>Days before documents get deleted.</td></tr><tr><td>BatchSize</td><td><img src="../../.gitbook/assets/image (14) (6).png" alt=""></td><td>Hidden</td><td>Processing batch size.</td></tr><tr><td>DocumentProcessedStatus</td><td><img src="../../.gitbook/assets/image (6) (4).png" alt=""></td><td>Optional</td><td>Document status used to denote that a document has been processed.</td></tr><tr><td>Enabled</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1).png" alt=""></td><td>Hidden</td><td>Enable or disable the service.</td></tr><tr><td>EnableTableDetection</td><td><img src="../../.gitbook/assets/image (15) (1) (3).png" alt=""></td><td>Optional</td><td>Specifies whether the service should save any tables detected by the MS Form Recognizer API call.</td></tr><tr><td>ExecuteBeforeProcess</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (2).png" alt=""></td><td></td><td>When set up as a child service, specify whether this service should be executed <strong>before</strong> the parent service gets executed.</td></tr><tr><td>ExecuteAfterProcess</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (1).png" alt=""></td><td></td><td>When set up as a child service, specify whether this service should be executed <strong>after</strong> the parent service gets executed.</td></tr><tr><td>Password</td><td><img src="../../.gitbook/assets/image (3) (5) (1).png" alt=""></td><td>Optional</td><td>Used for service authentication. Custom Code can be used to set the password. Can be set per document.</td></tr><tr><td>RemoveComments</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (1) (3).png" alt=""></td><td>Optional</td><td>Remove human comments from a document.</td></tr><tr><td>WorkflowAlgorithm</td><td><img src="../../.gitbook/assets/image (2) (7).png" alt=""></td><td>Required</td><td>Algorithm used for assigning users for verification for workflow item.</td></tr><tr><td>WorkflowCategory</td><td><img src="../../.gitbook/assets/image (14) (6).png" alt=""></td><td>Optional</td><td>Trigger Workflow for all documents in this category (category ID).</td></tr><tr><td>WorkflowDocument</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (1) (6).png" alt=""></td><td>Required</td><td>Enable document workflow for this service.</td></tr><tr><td>WorkflowShred</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (1) (4).png" alt=""></td><td>Required</td><td>Enable document shred workflow for this service.</td></tr><tr><td>WorkflowGracePeriod</td><td><img src="../../.gitbook/assets/image (13) (6).png" alt=""></td><td>Required</td><td>Grace period before a workflow item gets escalated.</td></tr></tbody></table>

## Add and Process Documents <a href="#add-and-process-documents" id="add-and-process-documents"></a>

1. In the **Microsoft Invoice Service** click on the **Inbox** button.
2. Select the Status you want to upload and use Status **None** or **Received** for new documents that have not been processed yet.
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”.
4. Find the files on your Local machine and upload them. **The demo's test files can be found at the following link:** [**Click here**](https://docs.aiforged.com/DemoDocuments/ABBYY%20Classification%20%20Testing.zip)​
5. After all the documents have been uploaded you can check the documents to be processed, click on **Processed Checked** to process the documents.

It is recommended to only process a few documents at a time, especially if it is a new service to properly test if you receive the results you want before processing everything.

## View Processed Documents <a href="#view-processed-documents" id="view-processed-documents"></a>

1. In the **Microsoft Object Detection Service** click on the **Outbox** button.
2. You can view the **Processing** results by opening a processed doc for verification.

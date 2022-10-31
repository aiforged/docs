---
title: Microsoft ID Docs
parent: Pretrained ID Docs
grand_parent: Understanding Services
nav_order: 3
---

# Amazon Identity Documents Extraction

<figure><img src="../../.gitbook/assets/image (2) (1) (4).png" alt=""><figcaption></figcaption></figure>

The **Amazon Identity Documents Service** makes use of pre-trained ID doc models to extract **Key-Value Pairs** of invoice-related data making use of **Amazon AnalyzeID API**. The processing of invoices returns relevant information from passports, driver licenses, and other identity documentation issued by the US Government, such as **Name, Surname, ID Number,** and **Date of Birth**.

Key names are standardized within the response. For example, if your driver license says LIC# (license number) and passport says Passport No, **Analyze ID** response will return the standardized key as **Document ID** along with the raw key (e.g. LIC#). This standardization lets customers easily combine information across many IDs that use different terms for the same concept.

## Possible use cases <a href="#possible-use-cases" id="possible-use-cases"></a>

* Extracting invoice-related data.
* Match Name and Surname fields to other supporting docs to verify the identity of a person.

## Service Setup

1. Open the **Project Detail View** of the project you would like to add the service to.
2. Click on the **Add Service** button in the command bar.\
   ![](<../../.gitbook/assets/image (82) (1).png>)
3.  Select **Amazon Identity Documents Service** from the available **Service Types.**

    <figure><img src="../../.gitbook/assets/image (3) (3).png" alt=""><figcaption></figcaption></figure>
4.  A new **Service Configuration Wizard** will open:\
    (When navigating the Wizard, please make sure to use the **Next Step** button in the command bar to save any changes made).

    <figure><img src="../../.gitbook/assets/image (1) (3) (2).png" alt=""><figcaption></figcaption></figure>

    * **Step 1** **-** Allows configuration of various service settings, including the name and description. The default settings are sufficient for most use cases.
    * **Step 2 -** Allows adding **User Defined Categories** to train the service on.
    * **Step 3 -** Verification of any documents that have been processed.\
      ![](<../../.gitbook/assets/image (84) (1).png>)

## Service Configuration Settings

The **Microsoft OCR Service** can be configured by the user as a flexible solution. The following **Settings** are available:

| Setting                 | Type                                                           | Required Type | Description                                                                                                                  |
| ----------------------- | -------------------------------------------------------------- | ------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| ArchivingStrategy       | ![](<../../.gitbook/assets/image (14) (6).png>)                | Optional      | Days before documents get deleted.                                                                                           |
| BatchSize               | ![](<../../.gitbook/assets/image (5) (3).png>)                 | Hidden        | Processing batch size.                                                                                                       |
| DocumentProcessedStatus | ![](<../../.gitbook/assets/image (6) (4).png>)                 | Optional      | Document status used to denote that a document has been processed.                                                           |
| Enabled                 | ![](<../../.gitbook/assets/image (15) (1) (1).png>)            | Hidden        | Enable or disable the service.                                                                                               |
| ExecuteBeforeProcess    | ![](<../../.gitbook/assets/image (15) (1).png>)                |               | When set up as a child service, specify whether this service should be executed **before** the parent service gets executed. |
| ExecuteAfterProcess     | ![](<../../.gitbook/assets/image (1) (1) (3) (1) (1).png>)     |               | When set up as a child service, specify whether this service should be executed **after** the parent service gets executed.  |
| IsVerification          | ![](<../../.gitbook/assets/image (15) (1).png>)                | Optional      | Save the lines and words for verification.                                                                                   |
| Password                | ![](<../../.gitbook/assets/image (3) (5) (1).png>)             | Optional      | Used for service authentication. Custom Code can be used to set the password. Can be set per document.                       |
| RemoveComments          | ![](<../../.gitbook/assets/image (1) (1) (3) (1) (1) (1).png>) | Optional      | Remove human comments from a document.                                                                                       |

## Add and Process Documents

1. In the **Amazon Identity Documents Service** click on **Inbox** button.
2. Select the Status you want to upload and use Status **None** or **Received** for new documents that have not been processed yet.
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”.
4. Find the files on your Local machine and upload them. **The demo's test files can be found at the following link:** [**Click here**](https://larchold-my.sharepoint.com/:u:/g/personal/jannie\_larcai\_com/Ec-\_k8RmUqNAv6WgCgwItfcBTRp1Gk0V6OeyTj2S3SIUQg?e=EquxX9)**.**
5. After all the documents have been uploaded you can check the documents to be processed, click on **Processed Checked** to process the documents.

It is recommended to only process a few documents at a time, especially if it is a new service to properly test if you receive the results you want before processing everything.

## View Processed Documents <a href="#view-processed-documents" id="view-processed-documents"></a>

1. In the **Amazon Identity Documents Service** click on the **Outbox** button.
2. You can view your **Processing** results by opening a processed doc for verification.

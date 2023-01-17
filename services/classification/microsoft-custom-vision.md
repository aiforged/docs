---
title: Microsoft Custom Vision
parent: Classification
grand_parent: Understanding Services
nav_order: 4
---

# Microsoft Custom Vision

<figure><img src="../../.gitbook/assets/image (3) (1).png" alt=""><figcaption></figcaption></figure>

The **Microsoft Custom Vision Service** is a **Classification** service that allows users to customize and embed state-of-the-art computer vision image analysis for specific domains with **Azure Cognitive Services**.&#x20;

The **Microsoft Custom Vision Service** allows users to create **Custom Tags** from documents or images, based on their own custom needs for image recognition. Users start by uploading samples of each **Custom Tag** and sending them to **Azure Cognitive Services** to train the **Classification** model**.**

## Possible use cases

* Distinguish between different types of documents.
* Distinguish between different types of variations of documents.
* Distinguish between different types of invoices.

## Service Setup

1. Open the **Project Detail View** of the project you would like to add the service to.
2. Click on the **Add Service** button in the command bar.\
   ![](<../../.gitbook/assets/image (82) (1).png>)
3.  Select **Microsoft Custom Vision Service** from the available **Service Types.**

    <figure><img src="../../.gitbook/assets/image (2) (1).png" alt=""><figcaption></figcaption></figure>
4.  A new **Service Configuration Wizard** will open:\
    (When navigating the Wizard, please make sure to use the **Next Step** button in the command bar to save any changes made).

    <figure><img src="../../.gitbook/assets/image (4).png" alt=""><figcaption></figcaption></figure>

* **Step 1** **-** Allows configuration of various service settings, including the name and description. The default settings are sufficient for most use cases.
* **Step 2 -** Allows adding **User Defined Categories** to train the service on.
* **Step 3 -** Training&#x20;
  1. Click **Upload Training Documents** in the command bar\
     ![](<../../assets/33 (1) (1) (1) (1) (1) (1) (2) (1).png>)
  2. Select the **User Defined Category** you want to upload documents to.\
     **Demo training files are available**[ **here**](https://docs.aiforged.com/DemoDocuments/AIForged%20Classification%20%20Testing.zip)**.**
  3. Upload files for each **User Defined Category** you wish to train the service on.
  4.  Once you have uploaded all your documents, click the **Train Service** button in the command bar to train your service. (**Note** that training can take **several** minutes!)

      <figure><img src="../../.gitbook/assets/image (4) (1).png" alt=""><figcaption></figcaption></figure>
  5. Click **Process** on the dialog window that appears. Leave all settings as default.
  6. A progress dialog will appear displaying the progress of the training.\
     Training times can vary depending on the number of files that have been uploaded for training.
  7. The progress dialog should automatically close once the training has been completed.
* **Step 4** - Verification. No verification required.
* Click on the **Complete** button in the command bar to validate your service configuration and close the wizard.\
  ![](<../../.gitbook/assets/image (84) (1).png>)

## Service Configuration Settings

The **Microsoft OCR Service** can be configured by the user as a flexible solution. The following **Settings** are available:

| Setting                 | Type                                                               | Required Type | Description                                                                                                                  |
| ----------------------- | ------------------------------------------------------------------ | ------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| ArchivingStrategy       | ![](<../../.gitbook/assets/image (5) (3).png>)                     | Optional      | Days before documents get deleted.                                                                                           |
| BatchSize               | ![](<../../.gitbook/assets/image (14) (6).png>)                    | Hidden        | Processing batch size.                                                                                                       |
| DocumentProcessedStatus | ![](<../../.gitbook/assets/image (6) (4).png>)                     | Optional      | Document status used to denote that a document has been processed.                                                           |
| Enabled                 | ![](<../../.gitbook/assets/image (15) (1) (3).png>)                | Hidden        | Enable or disable the service.                                                                                               |
| ExecuteBeforeProcess    | ![](<../../.gitbook/assets/image (15) (1) (4).png>)                |               | When set up as a child service, specify whether this service should be executed **before** the parent service gets executed. |
| ExecuteAfterProcess     | ![](<../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (2).png>) |               | When set up as a child service, specify whether this service should be executed **after** the parent service gets executed.  |
| Password                | ![](<../../.gitbook/assets/image (3) (5) (1).png>)                 | Optional      | Used for service authentication. Custom Code can be used to set the password. Can be set per document.                       |
| RemoveComments          | ![](<../../.gitbook/assets/image (1) (1) (3) (1) (1) (2).png>)     | Optional      | Remove human comments from a document.                                                                                       |

## Add and Process Documents

1. In the **Microsoft Custom Vision Service** click on **Inbox** button.
2. Select the Status you want to upload and use Status **None** or **Received** for new documents that have not been processed yet.
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”.
4. Find the files on your Local machine and upload them. **The demo's test files can be found at the following link:** [**Click here**](https://larchold-my.sharepoint.com/:u:/g/personal/jannie\_larcai\_com/Ec-\_k8RmUqNAv6WgCgwItfcBTRp1Gk0V6OeyTj2S3SIUQg?e=EquxX9)**.**
5. After all the documents have been uploaded you can check the documents to be processed, click on **Processed Checked** to process the documents.

It is recommended to only process a few documents at a time, especially if it is a new service to properly test if you receive the results you want before processing everything.

## View Processed Documents <a href="#view-processed-documents" id="view-processed-documents"></a>

1. In the **Microsoft Custom Vision Service** click on the **Outbox** button.
2. You can view your **Processing** results by opening a processed doc for verification.

---
title: Microsoft Speech-to-Text
parent: Speech
grand_parent: Understanding Services
nav_order: 1
---

# Microsoft Speech to Text

<figure><img src="../../.gitbook/assets/image (10) (3).png" alt=""><figcaption></figcaption></figure>

The **Microsoft Speech-to-Text Service** can quickly and accurately transcribe audio to text in more than **30** languages. Customize models to enhance accuracy for domain-specific terminology.

## Supported Content Types

* Mp3

## Possible use cases

* Extracting Music lyrics from a song.
* Create meeting notes based on recorded audio.

## Service Setup

1. Open the **Project Detail View** of the project you would like to add the service to.
2. Click on the **Add Service** button in the command bar.\
   ![](<../../.gitbook/assets/image (82) (1).png>)
3.  Select **Microsoft Speech-to-Text Service** from the available **Service Types.**

    <figure><img src="../../.gitbook/assets/image (18).png" alt=""><figcaption></figcaption></figure>
4.  A new **Service Configuration Wizard** will open:\
    (When navigating the Wizard, please make sure to use the **Next Step** button in the command bar to save any changes made).

    <figure><img src="../../.gitbook/assets/image (1) (6).png" alt=""><figcaption></figcaption></figure>

    * **Step 1** **-** Allows configuration of various service settings, including the name and description. The default settings are sufficient for most use cases.
    * **Step 2 -** Verification of any documents that have been processed.\
      ![](<../../.gitbook/assets/image (84) (1).png>)

## Service Configuration Settings

The **Microsoft Speech-to-Text Service** can be configured by the user as a flexible solution. The following **Settings** are available:

| Setting                 | Type                                                               | Required Type | Description                                                                                                                  |
| ----------------------- | ------------------------------------------------------------------ | ------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| ArchivingStrategy       | ![](<../../.gitbook/assets/image (5) (3).png>)                     | Optional      | Days before documents get deleted.                                                                                           |
| AccessKey               | ![](<../../.gitbook/assets/image (7) (2).png>)                     | Optional      | Override the Access Key to the configured Microsoft cloud service.                                                           |
| BaseURL                 | ![](<../../.gitbook/assets/image (7) (2).png>)                     | Optional      | Override the URL to the configured Microsoft cloud service.                                                                  |
| BatchSize               | ![](<../../.gitbook/assets/image (14) (6).png>)                    | Hidden        | Processing batch size.                                                                                                       |
| DocumentProcessedStatus | ![](<../../.gitbook/assets/image (6) (4).png>)                     | Optional      | Document status used to denote that a document has been processed.                                                           |
| Enabled                 | ![](<../../.gitbook/assets/image (15) (1) (3).png>)                | Hidden        | Enable or disable the service.                                                                                               |
| ExecuteBeforeProcess    | ![](<../../.gitbook/assets/image (15) (1) (4).png>)                |               | When set up as a child service, specify whether this service should be executed **before** the parent service gets executed. |
| ExecuteAfterProcess     | ![](<../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (2).png>) |               | When set up as a child service, specify whether this service should be executed **after** the parent service gets executed.  |
| Password                | ![](<../../.gitbook/assets/image (3) (5) (1).png>)                 | Optional      | Used for service authentication. Custom Code can be used to set the password. Can be set per document.                       |
| RemoveComments          | ![](<../../.gitbook/assets/image (1) (1) (3) (1) (1) (2).png>)     | Optional      | Remove human comments from a document.                                                                                       |

## Add and Process Documents

1. In the **Microsoft Speech-to-Text Service** click on the **Inbox** button.
2. Select the Status you want to upload and use Status **None** or **Received** for new documents that have not been processed yet.
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”.
4. Find the files on your Local machine and upload them. **The demos test files can be found at the following link:** [**Click here**](https://larchold-my.sharepoint.com/:u:/g/personal/jannie\_larcai\_com/Ec-\_k8RmUqNAv6WgCgwItfcBTRp1Gk0V6OeyTj2S3SIUQg?e=EquxX9)**.**
5. After all the documents have been uploaded you can check the documents to be processed, click on **Processed Checked** to process the documents.

It is recommended to only process a few documents at a time, especially if it is a new service to properly test if you receive the results you want before processing everything.

## View Processed Documents

1. In the **Microsoft Speech-to-Text Service** click on the **Outbox** button.
2. You can view the **Processing** results by opening a processed doc for verification.


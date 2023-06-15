---
title: ABBYY classification
parent: Classification
grand_parent: Understanding Services
nav_order: 2
description: File and Image Classification
---

# ABBYY Classification

<figure><img src="../../.gitbook/assets/image (60).png" alt=""><figcaption></figcaption></figure>

The **ABBYY Classification Service** is an advanced **Classification** service designed to automatically categorize files and images based on their contents. This advanced classification service leverages modern technologies such as machine learning and natural language processing to detect even subtlest of differences among different files and images. The **ABBYY Classification Service** allows easy training of a flexible and scalable classification process that can granularly distinguish among many different **User Defined Categories**.

## Possible use cases

* Distinguish between different types of bank statements
* Distinguish between different types of Identification documents
* Distinguish between different types of invoices
* Distinguish between objects in images

## Service Setup

1. Open the **Project Detail View** of the project you would like to add the service to.
2. Click on the **Add Service** button in the command bar.\
   ![](<../../.gitbook/assets/image (82) (1).png>)
3.  Select **ABBYY Classification Service** from the available **Service Types.**\


    <figure><img src="../../.gitbook/assets/image (83).png" alt=""><figcaption></figcaption></figure>
4. A new **Service Configuration Wizard** will open:\
   (When navigating the Wizard, please make sure to use the **Next Step** button in the command bar to save any changes made).

<figure><img src="../../.gitbook/assets/image (45) (2).png" alt=""><figcaption></figcaption></figure>

* **Step 1** **-** Allows configuration of various service settings, including the name and description. The default settings are sufficient for most use cases.
* **Step 2 -** Allows adding **User Defined Categories** to train the service on.
* **Step 3 -** Training \*
  1. ![](<../../.gitbook/assets/33 (1) (2) (1) (1) (1) (1) (1) (1) (1) (2).png>) Click **Upload Training Documents** in the command bar
  2. Select the **User Defined Category** you want to upload documents to.\
     **Demo training files are available**[ **here**](https://docs.aiforged.com/DemoDocuments/ABBYY%20Classification%20Training.zip)**.**
  3. Upload files for each **User Defined Category** you wish to train the service on.
  4. Once you have uploaded all your documents, click the **Train Service** button in the command bar to train your service.
  5. Click **Process** on the dialog window that appears. Leave all settings as default.
  6. A progress dialog will appear displaying the progress of the training.\
     Training times can vary depending on the number of files that have been uploaded for training.
  7. The progress dialog should automatically close once the training has completed.
* **Step 4** - The **Definition Document** should be created after the **Service** has been trained successfully.
* Click on the **Complete** button in the command bar to validate your service configuration and close the wizard.\
  ![](<../../.gitbook/assets/image (84) (1).png>)

## Service Configuration Settings

The **Microsoft OCR Service** can be configured by the user as a flexible solution. The following **Settings** are available:

<table><thead><tr><th width="256">Setting</th><th width="126">Type</th><th width="139">Required Type</th><th>Description</th></tr></thead><tbody><tr><td>ArchivingStrategy</td><td><img src="../../.gitbook/assets/image (5) (3).png" alt=""></td><td>Optional</td><td>Days before documents get deleted.</td></tr><tr><td>BatchSize</td><td><img src="../../.gitbook/assets/image (14) (6).png" alt=""></td><td>Hidden</td><td>Processing batch size.</td></tr><tr><td>DocumentProcessedStatus</td><td><img src="../../.gitbook/assets/image (6) (4).png" alt=""></td><td>Optional</td><td>Document status used to denote that a document has been processed.</td></tr><tr><td>Enabled</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1).png" alt=""></td><td>Hidden</td><td>Enable or disable the service.</td></tr><tr><td>ExecuteBeforeProcess</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (2).png" alt=""></td><td></td><td>When set up as a child service, specify whether this service should be executed <strong>before</strong> the parent service gets executed.</td></tr><tr><td>ExecuteAfterProcess</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (1).png" alt=""></td><td></td><td>When set up as a child service, specify whether this service should be executed <strong>after</strong> the parent service gets executed.</td></tr><tr><td>Password</td><td><img src="../../.gitbook/assets/image (3) (5) (1).png" alt=""></td><td>Optional</td><td>Used for service authentication. Custom Code can be used to set the password. Can be set per document.</td></tr><tr><td>RemoveComments</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (1) (3).png" alt=""></td><td>Optional</td><td>Remove human comments from a document.</td></tr></tbody></table>

## Add and Process Documents

1. In your **Classification Service Card** click on the **Inbox** button.\
   ![](<../../.gitbook/assets/image (86) (1).png>)
2. Drag and drop files over the **Inbox** grid or click on the **Upload** button in the command bar.\
   **The demo test files are available**[ **here**](https://docs.aiforged.com/DemoDocuments/ABBYY%20Classification%20Training.zip)**.**
3. When prompted to select a category, select the **No Selection** option in the bottom right of the dialog window.
4. To process single documents, click on the document's **Process** action button.
5. To process multiple documents, select the documents you want to process and click on **Process Documents** in the command bar.

When testing a newly trained service it is recommended to only process a couple of documents at a time and to review the process results.\
Should the results not appear satisfactory, then additional documents may need to be trained.

## View Processed Documents

1. In your **Classification Service Card** click on the **Outbox** button.
2. Classification results will appear as new documents/files in the outbox with the **Category** column indicating the final document classification.

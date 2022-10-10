---
title: ABBYY classification
parent: Classification
grand_parent: Understanding Services
nav_order: 2
---

# ABBYY Classification

<figure><img src="../../.gitbook/assets/image (60).png" alt=""><figcaption></figcaption></figure>

The **ABBYY Classification Service** allows you to automatically categorize documents and sort them into predefined document categories. The advanced document classification leverages modern technologies such as machine learning and natural language processing. These technologies can detect even subtle differences among individual document categories and allow setting up flexible and scalable classification processes that can granularly distinguish among many document categories.

## Possible use cases

* Distinguish between different types of bank statements
* Distinguish between different types of Identification documents
* Distinguish between different types of invoices

## Setup and Train Service

1. Open the project you would like to add the service to
2. Click on Add Service
3. Select the ABBYY Classification Service
4. **Step 1** – Service (Displays the service setting, you can change it as required)
5. Click the “Next” Action in the Action Bar to save the Service
6. **Step 2** Classes, to add a Class View [Document Categories](abby-classification.md) (Click next to save categories)
7. **Step 3** Training \*
   1. ![](<../../assets/33 (1) (1) (1) (1) (1).png>) Click “Upload Training Documents” in the Action Bar
   2. Select the Document Category you want to upload documents to. **The demos training files can be found at the following link:** [**Click here**](https://docs.aiforged.com/DemoDocuments/ABBYY%20Classification%20%20Training.zip)
   3. Upload Documents for each category you want to train
   4. Click Train Service once all documents have been uploaded
   5. A log Window will open displaying the current logs for the Training Document
   6. Click the Next button when done training
8. **Step 4** Definition, the definition Document would be created after the Service has trained successfully

## Add and Process Documents

1. In your **ABBYY Classification Service** click on **Inbox** button.
2. Select the **Status** to upload and use Status **None** or **Received** for new documents that have not been processed yet
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”
4. Find the files on your Local machine and upload them. **The demos test files can be found at the following link:** [**Click here**](https://docs.aiforged.com/DemoDocuments/ABBYY%20Classification%20%20Testing.zip)
5. After all the documents have been uploaded you can check the documents to be processed, click on “Processed Checked” to process the documents

It is recommended to only process a few documents at a time, especially if it is a new service to properly test if you receive the results you want before processing everything.

## View Processed Documents <a href="#view-processed-documents" id="view-processed-documents"></a>

1. In the **Microsoft Object Detection Service** click on the **Outbox** button.
2. You can view your **Processing** results by opening a processed doc for verification.

## Settings

| **Setting**                  | Description                                                                         |
| ---------------------------- | ----------------------------------------------------------------------------------- |
| **ExecuteAfterProcess**      | Execute this Utility after the Service Process Documents                            |
| **ExecuteBeforeProcess**     | Execute this Utility before the Service Process Documents                           |
| **Language**                 | The ABBYY language to use                                                           |
| **PageExtension**            | The file extension to use for the classified images or pages                        |
| **PageFileFormat**           | The image format to use for the classified images or pages                          |
| **PageImageCompressionType** | This is the Image Compression Type to use when storing the classified image or page |

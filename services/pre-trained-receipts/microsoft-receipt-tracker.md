---
title: Microsoft Receipt
parent: Pretrained Receipts
grand_parent: Understanding Services
nav_order: 1
---

# Microsoft Receipt Tracker

![](<../../.gitbook/assets/40 (1) (1).png>)

Microsoft Receipt Tracker uses Optical Character Recognition (OCR) to automatically extract information from receipt photos. Receipt Tracker allows users to categorize and visualize their expenses

## Setup Service

1. Open the project you would like to add the service to
2. Click on Add Service
3. Select the Microsoft Receipt Tracker Service
4. **Step 1** – Service (Displays the service setting, you can change it as required)
5. Click the “Next” Action in the Action Bar to save the Service
6. **Step 2** Verification, TODO

## Add and Process Documents

1. In your Microsoft Receipt Tracker Service click on “Inbox” in the App Bar
2. Select your Status you want to upload, use Status “None” or “Received” for new documents that have not been processed yet
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”
4. Find the files on your Local machine and upload them. **The demos test files can be found at the following link:** [**Click here**](https://docs.aiforged.com/DemoDocuments/Microsoft%20Receipt%20Tracker.zip)
5. After all the documents have been uploaded you can check the documents to be processed, click on “Processed Checked” to process the documents

It is Recommended to only process a few documents at a time if is a new service to properly test if you receive the results you want before processing everything

## View Processed Documents

1. In your AIForged Classification Service click on “Outbox” in the App Bar
2. You can View your Processing results in the Status

## Supported Content Types

* Pdf
* jpeg
* png

If you need to use a different type of content, you can use the AiForged Pdf Converter.

## Possible use cases

* Extract data from receipts
* Visualise your receipts data

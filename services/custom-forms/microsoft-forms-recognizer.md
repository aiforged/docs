---
title: Microsoft Form Recognizer
parent: Custom Forms
grand_parent: Understanding Services
nav_order: 2
---

# Microsoft Forms Recognizer

![](<../../.gitbook/assets/37 (1) (1).png>)

Form Recognizer learns the structure of your forms to intelligently extract text and data. It ingests text from forms, applies machine learning technology to identify keys and tables, and then outputs structured data that includes the relationships within the original file. That way, you can extract information quickly, accurately, and tailored to your specific content, without heavy manual intervention or extensive data science expertise.

Form Recognizer extracts key value pairs and tables from documents and includes the following options:

* **Custom** – Form Recognizer learns the structure of your forms (invoices, Pos, industry specific records) to intelligently extract text and data. It ingests text from forms, and then outputs structured data that includes the relationships within the original file. That way, you can extract information quickly, accurately, and tailored to your specific content, without heavy manual intervention or extensive data science expertise.
* **Prebuilt** – Detects and extracts data from US receipts using optical character recognition (OCR). Our receipt model enables you to easily extract structured data from receipts such as merchant name, subtotal, tax, line items, transaction total and more.
* **Layout** – Detects and extracts text and table structure (row1, column1…row n column n) from documents using optical character recognition (OCR).

## Setup and Train Service

1. Open the project you would like to add the service to
2. Click on Add Service
3. Select the Microsoft Forms Recognizer
4. **Step 1** – Service (Displays the service setting, you can change it as required)
5. Click the “Next” Action in the Action Bar to save the Service
6. **Step 2** Classes, to add a Class View to [Document Categories](microsoft-forms-recognizer.md) (Click next to save categories)
7. **Step 3** Training \*
   1. ![](<../../assets/33 (1) (2).png>) Click “Upload Training Documents” in the Action Bar
   2. Select the Document Category you want to upload documents to. **The demos training files can be found at the following link:** [**Click here**](https://larchold-my.sharepoint.com/:u:/g/personal/jannie\_larcai\_com/EVXJvXsMjM1Gnmhcic-UUnoB99xK0fDRjsaZREkx63PFHg?e=4RtU6d)
   3. Upload Documents for each category you want to train
   4. Click Train Service once all documents have been uploaded
   5. A log Window will open displaying the current logs for the Training Document
   6. Click the Next button when done training
8. **Step 4** Definition, the definition Document would be created after the Service has trained successfully

## Add and Process Documents

1. In your Microsoft Forms Recognizer Service click on “Inbox” in the App Bar
2. Select your Status you want to upload, use Status “None” or “Received” for new documents that have not been processed yet
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”
4. Find the files on your Local machine and upload them. **The demos test files can be found at the following link:** [**Click here**](https://larchold-my.sharepoint.com/:u:/g/personal/jannie\_larcai\_com/Ec-\_k8RmUqNAv6WgCgwItfcBTRp1Gk0V6OeyTj2S3SIUQg?e=EquxX9)
5. After all the documents have been uploaded you can check the documents to be processed, click on “Processed Checked” to process the documents

It is Recommended to only process a few documents at a time if is a new service to properly test if you receive the results you want before processing everything

## View Processed Documents

1. In your AIForged Classification Service click on “Outbox” in the App Bar
2. You can View your Processing results in the Status

## Possible use cases

* Handwritten forms that needs information to be extracted
* Images that has information to be extracted
* PDF’s that has information to be extracted (Proof of payments, Bank Statements etc.)

## Supported Content Types

* Pdf
* images

If you need to use a different type of content, you can use the AiForged Pdf Converter.

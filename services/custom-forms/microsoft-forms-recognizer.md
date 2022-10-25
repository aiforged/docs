---
title: Microsoft Form Recognizer
parent: Custom Forms
grand_parent: Understanding Services
nav_order: 2
---

# Microsoft Forms Recognizer

<figure><img src="../../.gitbook/assets/image (16) (1) (1).png" alt=""><figcaption></figcaption></figure>

The **Microsoft Form Recognizer Service** learns the structure of your forms to intelligently extract text and data. It ingests text from forms, applies machine learning technology to identify keys and tables, and then outputs structured data that includes the relationships within the original file. That way, you can extract information quickly, accurately, and tailored to your specific content, without heavy manual intervention or extensive data science expertise.

Form Recognizer extracts **Key-Value Pairs** and tables from documents and includes the following options:

* **Custom** – Form Recognizer learns the structure of your forms (invoices, POS, industry specific records) to intelligently extract text and data. It ingests text from forms, and then outputs structured data that includes the relationships within the original file. That way, you can extract information quickly, accurately, and tailored to your specific content, without heavy manual intervention or extensive data science expertise.
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
   1. ![](<../../.gitbook/assets/33 (1) (2) (1) (1) (1) (1) (1) (5).png>) Click “Upload Training Documents” in the Action Bar
   2. Select the Document Category you want to upload documents to. **The demos training files can be found at the following link:** [**Click here**](https://larchold-my.sharepoint.com/:u:/g/personal/jannie\_larcai\_com/EVXJvXsMjM1Gnmhcic-UUnoB99xK0fDRjsaZREkx63PFHg?e=4RtU6d)
   3. Upload Documents for each category you want to train
   4. Click Train Service once all documents have been uploaded
   5. A log Window will open displaying the current logs for the Training Document
   6. Click the Next button when done training
8. **Step 4** Definition, the definition Document would be created after the Service has trained successfully

## Add and Process Documents

1. In your Microsoft Forms Recognizer Service click on the **Inbox** button.
2. Select the Status you want to upload and use Status **None** or **Received** for new documents that have not been processed yet.
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”..
4. Find the files on your Local machine and upload them. **The demos test files can be found at the following link:** [**Click here**](https://larchold-my.sharepoint.com/:u:/g/personal/jannie\_larcai\_com/Ec-\_k8RmUqNAv6WgCgwItfcBTRp1Gk0V6OeyTj2S3SIUQg?e=EquxX9)
5. After all the documents have been uploaded you can check the documents to be processed, click on “Processed Checked” to process the documents

It is recommended to only process a few documents at a time, especially if it is a new service to properly test if you receive the results you want before processing everything.

## View Processed Documents

1. In the **Microsoft Form Recognizer Service** click on **Outbox** button.
2. You can view the **Processing** results by opening a processed doc for verification.

## Possible use cases

* Handwritten forms that need the information to be extracted.
* Images that have information to be extracted
* PDFs that have information to be extracted (Proof of payments, Bank Statements etc.).

## Supported Content Types

* Pdf
* images

If you need to use a different type of content, you can use the **AIForged Pdf Converter**.

## Service Configuration Settings

The **Microsoft Form Recognizer Service** can be configured by the user as a flexible solution. The following **Settings** are available:

| Setting                           | Type                                            | Required Type | Description                                                                                                                                                                                          |
| --------------------------------- | ----------------------------------------------- | ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ArchivingStrategy                 | ![](<../../.gitbook/assets/image (14) (6).png>) | Optional      | Days before documents get deleted.                                                                                                                                                                   |
| BatchSize                         | ![](<../../.gitbook/assets/image (5).png>)      | Hidden        | Processing batch size.                                                                                                                                                                               |
| DocumentProcessedStatus           | ![](<../../.gitbook/assets/image (6) (4).png>)  | Optional      | Document status used to denote that a document has been processed.                                                                                                                                   |
| Enabled                           | ![](<../../.gitbook/assets/image (15).png>)     | Hidden        | Enable or disable the service.                                                                                                                                                                       |
| EnableSelectionMarks              | ![](<../../.gitbook/assets/image (20).png>)     | Optional      | Specifies whether the service should save any selection marks returned by MS Form API call.                                                                                                          |
| EnableTableDetection              | ![](<../../.gitbook/assets/image (4).png>)      | Option        | Specifies whether the service should save any tables detected by the MS Form Recognizer API call.                                                                                                    |
| ExecuteBeforeProcess              | ![](<../../.gitbook/assets/image (18).png>)     |               | When set up as a child service, specify whether this service should be executed **before** the parent service gets executed                                                                          |
| ExecuteAfterProcess               | ![](<../../.gitbook/assets/image (21).png>)     |               | When set up as a child service, specify whether this service should be executed **after** the parent service gets executed                                                                           |
| MatchHeadingLevenshteinConfidence | ![](<../../.gitbook/assets/image (16).png>)     | Optional      | Try to match heading columns using a Levenshtein confidence. This is useful when poor quality docs might misidentify characters when trying to match tables to existing table parameter definitions. |
| MinimumColumnMatchCount           | ![](<../../.gitbook/assets/image (19).png>)     | Optional      | The minimum number of columns required to be matched to map the table to an existing table parameter definition. If this number of column can't be matched, then a new table definition is created.  |
| MatchTablesWithSameColumnCount    | ![](<../../.gitbook/assets/image (9).png>)      |               | Try to match a table to an existing table parameter definition by using column counts only. This is especially useful when tables span multiple pages without repeating headers on each page.        |
| Password                          | ![](<../../.gitbook/assets/image (3) (5).png>)  | Optional      | Used for service authentication. Custom Code can be used to set the password. Can be set per document.                                                                                               |
| RemoveComments                    | ![](<../../.gitbook/assets/image (11).png>)     | Optional      | Remove human comments from a document.                                                                                                                                                               |
| SaveOCRLayout                     | ![](<../../.gitbook/assets/image (3).png>)      |               | Save the OCR layout of the documents (Lines, words, etc.).                                                                                                                                           |
| WorkflowAlgorithm                 | ![](<../../.gitbook/assets/image (2) (7).png>)  | Required      | Algorithm used for assigning users for verification for workflow item.                                                                                                                               |
| WorkflowDocument                  | ![](<../../.gitbook/assets/image (10) (6).png>) | Required      | Enable document workflow for this service.                                                                                                                                                           |
| WorkflowShred                     | ![](<../../.gitbook/assets/image (17).png>)     | Required      | Enable document shred workflow for this service.                                                                                                                                                     |
| WorkflowGracePeriod               | ![](<../../.gitbook/assets/image (13) (6).png>) | Required      | Grace period before a workflow item gets escalated.                                                                                                                                                  |

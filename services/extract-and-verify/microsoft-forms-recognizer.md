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
   1. ![](<../../.gitbook/assets/33 (1) (2) (1) (1) (1) (1) (1) (1) (1) (3).png>) Click “Upload Training Documents” in the Action Bar
   2. Select the Document Category you want to upload documents to. **The demos training files can be found at the following link:** [**Click here**](https://larchold-my.sharepoint.com/:u:/g/personal/jannie\_larcai\_com/EVXJvXsMjM1Gnmhcic-UUnoB99xK0fDRjsaZREkx63PFHg?e=4RtU6d)
   3. Upload Documents for each category you want to train
   4. Click Train Service once all documents have been uploaded
   5. A log Window will open displaying the current logs for the Training Document
   6. Click the Next button when done training
8. **Step 4** Definition, the definition Document would be created after the Service has trained successfully

## Add and Process Documents

1. In your Microsoft Forms Recognizer Service click on the **Inbox** button.
2. Select the Status you want to upload and use Status **None** or **Received** for new documents that have not been processed yet.
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”.
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

<table><thead><tr><th width="256">Setting</th><th width="126">Type</th><th width="139">Required Type</th><th>Description</th></tr></thead><tbody><tr><td>ArchivingStrategy</td><td><img src="../../.gitbook/assets/image (14) (6).png" alt=""></td><td>Optional</td><td>Days before documents get deleted.</td></tr><tr><td>BatchSize</td><td><img src="../../.gitbook/assets/image (5) (3).png" alt=""></td><td>Hidden</td><td>Processing batch size.</td></tr><tr><td>DocumentProcessedStatus</td><td><img src="../../.gitbook/assets/image (6) (4).png" alt=""></td><td>Optional</td><td>Document status used to denote that a document has been processed.</td></tr><tr><td>Enabled</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1).png" alt=""></td><td>Hidden</td><td>Enable or disable the service.</td></tr><tr><td>EnableSelectionMarks</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (3).png" alt=""></td><td>Optional</td><td>Specifies whether the service should save any selection marks returned by MS Form API call.</td></tr><tr><td>EnableTableDetection</td><td><img src="../../.gitbook/assets/image (15) (5) (1).png" alt=""></td><td>Optional</td><td>Specifies whether the service should save any tables detected by the MS Form Recognizer API call.</td></tr><tr><td>ExecuteBeforeProcess</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (2).png" alt=""></td><td></td><td>When set up as a child service, specify whether this service should be executed <strong>before</strong> the parent service gets executed</td></tr><tr><td>ExecuteAfterProcess</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (2) (7).png" alt=""></td><td></td><td>When set up as a child service, specify whether this service should be executed <strong>after</strong> the parent service gets executed</td></tr><tr><td>MatchHeadingLevenshteinConfidence</td><td><img src="../../.gitbook/assets/image (19) (2).png" alt=""></td><td>Optional</td><td>Try to match heading columns using a Levenshtein confidence. This is useful when poor quality docs might misidentify characters when trying to match tables to existing table parameter definitions.</td></tr><tr><td>MinimumColumnMatchCount</td><td><img src="../../.gitbook/assets/image (16) (1).png" alt=""></td><td>Optional</td><td>The minimum number of columns required to be matched to map the table to an existing table parameter definition. If this number of column can't be matched, then a new table definition is created.</td></tr><tr><td>MatchTablesWithSameColumnCount</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (1) (2).png" alt=""></td><td></td><td>Try to match a table to an existing table parameter definition by using column counts only. This is especially useful when tables span multiple pages without repeating headers on each page.</td></tr><tr><td>Password</td><td><img src="../../.gitbook/assets/image (3) (5) (1).png" alt=""></td><td>Optional</td><td>Used for service authentication. Custom Code can be used to set the password. Can be set per document.</td></tr><tr><td>RemoveComments</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (1) (3).png" alt=""></td><td>Optional</td><td>Remove human comments from a document.</td></tr><tr><td>SaveOCRLayout</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (1) (7).png" alt=""></td><td></td><td>Save the OCR layout of the documents (Lines, words, etc.).</td></tr><tr><td>WorkflowAlgorithm</td><td><img src="../../.gitbook/assets/image (2) (7).png" alt=""></td><td>Required</td><td>Algorithm used for assigning users for verification for workflow item.</td></tr><tr><td>WorkflowDocument</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (1) (6).png" alt=""></td><td>Required</td><td>Enable document workflow for this service.</td></tr><tr><td>WorkflowShred</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (1) (4).png" alt=""></td><td>Required</td><td>Enable document shred workflow for this service.</td></tr><tr><td>WorkflowGracePeriod</td><td><img src="../../.gitbook/assets/image (13) (6).png" alt=""></td><td>Required</td><td>Grace period before a workflow item gets escalated.</td></tr></tbody></table>

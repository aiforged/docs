---
description: Custom invoice training
---

# Microsoft Forms Custom Invoices

<figure><img src="../../.gitbook/assets/image (14) (5).png" alt=""><figcaption></figcaption></figure>

The **Microsoft Form Recognizer - Custom Invoice Service** extends the functionality of [Microsoft Form Recognizer](microsoft-forms-recognizer.md) to specifically extract information from invoices. Specifically, this service will return the same extracted OCR data in the form of **Key-Value Pairs**, but it returns the **Invoice Line Items** in table format.

This makes the processing of line items much easier, as invoice data such as **Item Codes**, **Descriptions**, **Unit Prices**, **VAT,** **Bruto-** and **Netto Amounts** can easily be grouped.

## Setup and Train Service

1. Open the project you would like to add the service to
2. Click on Add Service
3. Select the Microsoft Forms Recognizer
4. **Step 1** – Service (Displays the service setting, you can change it as required)
5. Click the “Next” Action in the Action Bar to save the Service
6. **Step 2** Classes, to add a Class View to [Document Categories](microsoft-forms-recognizer.md) (Click next to save categories)
7. **Step 3** Training \*
   1. ![](<../../.gitbook/assets/33 (1) (2) (1) (1) (1) (1) (1) (1) (1) (1) (1).png>) Click “Upload Training Documents” in the Action Bar
   2. Select the Document Category you want to upload documents to. **The demos training files can be found at the following link:** [**Click here**](https://larchold-my.sharepoint.com/:u:/g/personal/jannie_larcai_com/EVXJvXsMjM1Gnmhcic-UUnoB99xK0fDRjsaZREkx63PFHg?e=4RtU6d)
   3. Upload Documents for each category you want to train
   4. Click Train Service once all documents have been uploaded
   5. A log Window will open displaying the current logs for the Training Document
   6. Click the Next button when done training
8. **Step 4** Definition, the definition Document would be created after the Service has been trained successfully

## Add and Process Documents

1. In the **Microsoft Forms Recognizer - Custom Invoices Service** click on the **Inbox** button.
2. Select the Status you want to upload and use Status **None** or **Received** for new documents that have not been processed yet.
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”.
4. Find the files on your Local machine and upload them. **The demos test files can be found at the following link:** [**Click here**](https://larchold-my.sharepoint.com/:u:/g/personal/jannie_larcai_com/Ec-_k8RmUqNAv6WgCgwItfcBTRp1Gk0V6OeyTj2S3SIUQg?e=EquxX9)
5. After all the documents have been uploaded you can check the documents to be processed, click on “Processed Checked” to process the documents

It is recommended to only process a few documents at a time, especially if it is a new service to properly test if you receive the results you want before processing everything.

## View Processed Documents

1. In the **Microsoft Form Recognizer - Custom Invoices Service** click on the **Outbox** button.
2. You can view the **Processing** results by opening a processed doc for verification.

## Possible use cases

* Extract information from any invoice.
* Specifically extract energy, sewage, and water usages from **Utility Bills**.

## Configuring the Items Table Definition

The **MS Form Recognizer - Custom Invoice** service extends the functionality of the standard **MS Form Recognizer service**, and is focuses on extracting data from an invoice document. Invoice documents are well **structured** documents, and the information is typically presented in a table format. An example of an invoice is shown below.

<figure><img src="../../.gitbook/assets/image (6) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

Information can be scattered around in the document layout, such as **Account Numbers**, C**ompany VAT Registration Numbers**, **Invoice-** and **Due Dates**. These fields can be extracted by training an **MS Form Recognizer model** by specifying the regions where each field is expected to be situated on the form layout.

The **Line Items** are then typically presented in a table format, with generic column names to describe each line item. Typically, column headings such as **Item Code**, **Description**, **Quantity**, **Units**, **Unit Price**, and **Amount** are often used. However, there is no official guideline or standard when it comes to the actual wording of the column headers. **AIForged** addresses this issue by allowing users to create and customize the column headings that are expected to be on an **Invoice**. This is done by creating **Tags** that will map the table heading to an existing **Table Column Parameter Definition**. Consider the **Items Table** in the screenshot below.

<figure><img src="../../.gitbook/assets/image (14) (1) (1).png" alt=""><figcaption></figcaption></figure>

**AIForged** automatically creates a standard **Items Table** when the service is created. Generic names are used for column headings. **AIForged** allows users to add **Tags** to the **Table Column Parameter Definition**, which will be used to compare the text used as column headings on the **Invoice**. For instance, in the example invoice above, the term **Qty** is used to denote the number of items are billed for for each line item. In order to map the term **Qty** to an existing **Units** column definition, double-click on the the **Units** definition to open the **Definition Editor**.

<figure><img src="../../.gitbook/assets/image (13) (1) (1).png" alt=""><figcaption></figcaption></figure>

By default, a pre-populated list of **Default Tags** are created for each column in the **Items Table**. In this example, the term Qty is already added to the list of tags, meaning that the **MS Form Recognizer - Custom Invoices** service would already match the **Qty** column to the **Units Definition.**

<figure><img src="../../.gitbook/assets/image (3) (1) (2).png" alt=""><figcaption></figcaption></figure>

The screenshot below shows, after that model was trained, how the table has been extracted for the **Line Items** on the invoice.

<figure><img src="../../.gitbook/assets/image (2) (1) (3).png" alt=""><figcaption></figcaption></figure>

By using the **Tags List**, other descriptions or terms can be added that will allow **MS Form Recognizer - Custom Invoice** service to map any **Line Item Table** to the default Table definition created in **AIForged**. Even words from **other languages** can be added to the **Tags List**.

## Service Configuration Settings

The **Microsoft Form Recognizer Service** can be configured by the user as a flexible solution. The following **Settings** are available:

<table><thead><tr><th width="256">Setting</th><th width="126">Type</th><th width="140">Required Type</th><th>Description</th></tr></thead><tbody><tr><td>ArchivingStrategy</td><td><img src="../../.gitbook/assets/image (5) (3).png" alt=""></td><td>Optional</td><td>Days before documents get deleted.</td></tr><tr><td>BatchSize</td><td><img src="../../.gitbook/assets/image (5) (3).png" alt=""></td><td>Hidden</td><td>Processing batch size.</td></tr><tr><td>DocumentProcessedStatus</td><td><img src="../../.gitbook/assets/image (6) (4).png" alt=""></td><td>Optional</td><td>Document status used to denote that a document has been processed.</td></tr><tr><td>Enabled</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1) (1).png" alt=""></td><td>Hidden</td><td>Enable or disable the service.</td></tr><tr><td>EnableSelectionMarks</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1) (1).png" alt=""></td><td>Optional</td><td>Specifies whether the service should save any selection marks returned by MS Form API call.</td></tr><tr><td>EnableTableDetection</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1) (1).png" alt=""></td><td>Optional</td><td>Specifies whether the service should save any tables detected by the MS Form Recognizer API call.</td></tr><tr><td>ExecuteBeforeProcess</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1) (1).png" alt=""></td><td></td><td>When set up as a child service, specify whether this service should be executed <strong>before</strong> the parent service gets executed</td></tr><tr><td>ExecuteAfterProcess</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1) (1).png" alt=""></td><td></td><td>When set up as a child service, specify whether this service should be executed <strong>after</strong> the parent service gets executed</td></tr><tr><td>IgnoreTablesOtherThanItemsTable</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1) (1).png" alt=""></td><td>Optional</td><td>Specifies whether any tables other than the main 'Items' table should be saved. This is useful when many tables are detected on the document, which is typically the case with Invoices.</td></tr><tr><td>MatchHeadingLevenshteinConfidence</td><td><img src="../../.gitbook/assets/image (19) (2) (1).png" alt=""></td><td>Optional</td><td>Try to match heading columns using a Levenshtein confidence. This is useful when poor quality docs might misidentify characters when trying to match tables to existing table parameter definitions.</td></tr><tr><td>MinimumColumnMatchCount</td><td><img src="../../.gitbook/assets/image (16) (1).png" alt=""></td><td>Optional</td><td>The minimum number of columns required to be matched to map the table to an existing table parameter definition. If this number of column can't be matched, then a new table definition is created.</td></tr><tr><td>MatchTablesWithSameColumnCount</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1) (1).png" alt=""></td><td></td><td>Try to match a table to an existing table parameter definition by using column counts only. This is especially useful when tables span multiple pages without repeating headers on each page.</td></tr><tr><td>Password</td><td><img src="../../.gitbook/assets/image (3) (5) (1).png" alt=""></td><td>Optional</td><td>Used for service authentication. Custom Code can be used to set the password. Can be set per document.</td></tr><tr><td>RemoveComments</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1) (1).png" alt=""></td><td>Optional</td><td>Remove human comments from a document.</td></tr><tr><td>SaveOCRLayout</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1) (1).png" alt=""></td><td></td><td>Save the OCR layout of the documents (Lines, words, etc.).</td></tr><tr><td>UseDefaultCategoryforTableDefs</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1) (1).png" alt=""></td><td>Optional</td><td>Specifies whether all table definitions should be saved in the global 'Default' category of the service. This is useful when sharing tables parameter definitions across multiple document categories.</td></tr><tr><td>WorkflowAlgorithm</td><td><img src="../../.gitbook/assets/image (2) (7).png" alt=""></td><td>Required</td><td>Algorithm used for assigning users for verification for workflow item.</td></tr><tr><td>WorkflowDocument</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1) (1).png" alt=""></td><td>Required</td><td>Enable document workflow for this service.</td></tr><tr><td>WorkflowShred</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1) (1).png" alt=""></td><td>Required</td><td>Enable document shred workflow for this service.</td></tr><tr><td>WorkflowGracePeriod</td><td><img src="../../.gitbook/assets/image (13) (6).png" alt=""></td><td>Required</td><td>Grace period before a workflow item gets escalated.</td></tr></tbody></table>

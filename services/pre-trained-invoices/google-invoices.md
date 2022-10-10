---
title: Google Invoices
parent: Pretrained Invoices
grand_parent: Understanding Services
nav_order: 2
---

# Google Invoices

<figure><img src="../../.gitbook/assets/image (49).png" alt=""><figcaption></figcaption></figure>

The ​**Google Invoice Parser** makes use of pre-trained Invoice models to extract **Key-Value Pairs** of invoice-related data making use of **Google Documents AI**. The processing of invoices returns typical information found on invoices, such as **Subtotal, Vat, Total,** and **Date**. The service also extracts individual line items from the invoice and is presented in table format.

## Add and Process Documents <a href="#add-and-process-documents" id="add-and-process-documents"></a>

1. In the **Google Invoice Parser Service** click on **Inbox** button.
2. Select the Status you want to upload and use Status **None** or **Received** for new documents that have not been processed yet.
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”.
4. Find the files on your Local machine and upload them. **The demo's test files can be found at the following link:** [**Click here**](https://docs.aiforged.com/DemoDocuments/ABBYY%20Classification%20%20Testing.zip)​
5. After all the documents have been uploaded you can check the documents to be processed, click on **Processed Checked** to process the documents.

It is recommended to only process a few documents at a time, especially if it is a new service to properly test if you receive the results you want before processing everything.

## View Processed Documents <a href="#view-processed-documents" id="view-processed-documents"></a>

1. In the **Google Invoice Parser Service** click on **Outbox** button.
2. You can view the **Processing** results by opening a processed doc for verification.

## Possible use cases <a href="#possible-use-cases" id="possible-use-cases"></a>

* Extracting invoice-related data.
* Extracting individual line items that may appear on an invoice.

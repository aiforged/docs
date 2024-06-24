# Microsoft Receipts

<figure><img src="../../.gitbook/assets/image (26) (3).png" alt=""><figcaption></figcaption></figure>

The ​**Microsoft Receipts Service** makes use of pre-trained Invoice models to extract **Key-Value Pairs** of invoice-related data making use of **Microsoft Cognitive Services**. The processing of invoices returns typical information found on invoices, such as **Subtotal, Vat, Total,** and **Date**. **Microsoft Receipts** allows users to categorize and visualize their expenses. Below is an example of a receipt.

<figure><img src="../../.gitbook/assets/image (4) (1) (2).png" alt=""><figcaption></figcaption></figure>

The service extracts basic fields that can typically be found on a **Receipt**, such as the **Receipt #**, **Receipt Date**, **Vendor Name**, **Shipping Address Recipient**, and **Purchase Orders**, to name a few. In addition to this, the line items are also extracted.

<figure><img src="../../.gitbook/assets/image (3) (8).png" alt=""><figcaption></figcaption></figure>

## Supported Content Types

* Pdf
* jpeg
* png

If you need to use a different type of content, you can use the **AIForged Pdf Converter**.

## Possible use cases

* Extract data from receipts
* Visualize your receipts data

## Service Setup

1. Open the **Project Detail View** of the project you would like to add the service to.
2. Click on the **Add Service** button in the command bar.\
   ![](<../../.gitbook/assets/image (82) (2).png>)
3.  Select **Microsoft Receipts Service** from the available **Service Types.**

    <figure><img src="../../.gitbook/assets/image (4) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>
4.  A new **Service Configuration Wizard** will open:\
    (When navigating the Wizard, please make sure to use the **Next Step** button in the command bar to save any changes made).

    <figure><img src="../../.gitbook/assets/image (2) (1) (2) (1).png" alt=""><figcaption></figcaption></figure>

    * **Step 1** **-** Allows configuration of various service settings, including the name and description. The default settings are sufficient for most use cases.
    * **Step 2 -** Verification of any documents that have been processed.\
      ![](<../../.gitbook/assets/image (84) (1).png>)

## Service Configuration Settings

The **Microsoft Receipt Service** can be configured by the user as a flexible solution. The following **Settings** are available:

<table><thead><tr><th width="256">Setting</th><th width="122">Type</th><th width="139">Required Type</th><th>Description</th></tr></thead><tbody><tr><td>ArchivingStrategy</td><td><img src="../../.gitbook/assets/image (14) (6).png" alt=""></td><td>Optional</td><td>Days before documents get deleted.</td></tr><tr><td>BatchSize</td><td><img src="../../.gitbook/assets/image (5) (3).png" alt=""></td><td>Hidden</td><td>Processing batch size.</td></tr><tr><td>DocumentProcessedStatus</td><td><img src="../../.gitbook/assets/image (6) (4).png" alt=""></td><td>Optional</td><td>Document status used to denote that a document has been processed.</td></tr><tr><td>Enabled</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1).png" alt=""></td><td>Hidden</td><td>Enable or disable the service.</td></tr><tr><td>ExecuteBeforeProcess</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (2).png" alt=""></td><td></td><td>When set up as a child service, specify whether this service should be executed <strong>before</strong> the parent service gets executed.</td></tr><tr><td>ExecuteAfterProcess</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (2) (7).png" alt=""></td><td></td><td>When set up as a child service, specify whether this service should be executed <strong>after</strong> the parent service gets executed.</td></tr><tr><td>Password</td><td><img src="../../.gitbook/assets/image (3) (5) (1).png" alt=""></td><td>Optional</td><td>Used for service authentication. Custom Code can be used to set the password. Can be set per document.</td></tr><tr><td>RemoveComments</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (1) (3).png" alt=""></td><td>Optional</td><td>Remove human comments from a document.</td></tr></tbody></table>

## Add and Process Documents

1. In the **Microsoft Receipts Service** click on **Inbox** in the App Bar.
2. Select the Status you want to upload and use Status **None** or **Received** for new documents that have not been processed yet.
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”.
4. Find the files on your Local machine and upload them. **The demo's test files can be found at the following link:** [**Click here**](https://docs.aiforged.com/DemoDocuments/ABBYY%20Classification%20%20Testing.zip)​
5. After all the documents have been uploaded you can check the documents to be processed, click on **Processed Checked** to process the documents.

It is recommended to only process a few documents at a time, especially if it is a new service to properly test if you receive the results you want before processing everything.

## View Processed Documents

1. In the **Microsoft Receipts Service** click on **Outbox** button.
2. You can view the **Processing** results by opening a processed doc for verification.

##

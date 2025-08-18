---
hidden: true
---

# Microsoft Identity Documents

![](../../assets/image%20%281%29%20%287%29.png)
The **Microsoft Identity Document Service** makes use of pre-trained ID doc models to extract **Key-Value Pairs** of invoice-related data making use of **Microsoft Cognitive Services**. The processing of invoices returns typical information found on invoices, such as **Name, Surname, ID Number,** and **Date**. The service also extracts individual line items from the invoice and is presented in table format.

## Possible use cases <a href="#possible-use-cases" id="possible-use-cases"></a>

* Extracting invoice-related data.
* Match Name and Surname fields to other supporting docs to verify the identity of a person.

## Service Setup

1. Open the **Project Detail View** of the project you would like to add the service to.
2. Click on the **Add Service** button in the command bar.
   ![](../../assets/image%20%2882%29%20%282%29.png)
3.  Select **Microsoft Identity Documents Service** from the available **Service Types.**

    ![](../../assets/image%20%282%29%20%282%29.png)
4.  A new **Service Configuration Wizard** will open:
    (When navigating the Wizard, please make sure to use the **Next Step** button in the command bar to save any changes made).

    ![](../../assets/image%20%281%29%20%282%29%20%281%29.png)
    * **Step 1** **-** Allows configuration of various service settings, including the name and description. The default settings are sufficient for most use cases.
    * **Step 2 -** Allows adding **User Defined Categories** to train the service on.
    * **Step 3 -** Verification of any documents that have been processed.
      ![](../../assets/image%20%2884%29%20%281%29.png)

## Service Configuration Settings

The **Microsoft OCR Service** can be configured by the user as a flexible solution. The following **Settings** are available:

<table><thead><tr><th width="256">Setting</th><th width="126">Type</th><th width="139">Required Type</th><th>Description</th></tr></thead><tbody><tr><td>ArchivingStrategy</td><td><img src="../../assets/image%20%2814%29%20%286%29.png" alt=""></td><td>Optional</td><td>Days before documents get deleted.</td></tr><tr><td>BatchSize</td><td><img src="../../assets/image%20%285%29%20%283%29.png" alt=""></td><td>Hidden</td><td>Processing batch size.</td></tr><tr><td>DocumentProcessedStatus</td><td><img src="../../assets/image%20%286%29%20%284%29.png" alt=""></td><td>Optional</td><td>Document status used to denote that a document has been processed.</td></tr><tr><td>Enabled</td><td><img src="../../assets/image%20%2815%29%20%281%29%20%283%29%20%281%29.png" alt=""></td><td>Hidden</td><td>Enable or disable the service.</td></tr><tr><td>ExecuteBeforeProcess</td><td><img src="../../assets/image%20%2815%29%20%281%29%20%283%29%20%282%29.png" alt=""></td><td></td><td>When set up as a child service, specify whether this service should be executed <strong>before</strong> the parent service gets executed.</td></tr><tr><td>ExecuteAfterProcess</td><td><img src="../../assets/image%20%281%29%20%281%29%20%283%29%20%281%29%20%282%29%20%287%29.png" alt=""></td><td></td><td>When set up as a child service, specify whether this service should be executed <strong>after</strong> the parent service gets executed.</td></tr><tr><td>IsVerification</td><td><img src="../../assets/image%20%2815%29%20%281%29%20%283%29%20%282%29.png" alt=""></td><td>Optional</td><td>Save the lines and words for verification.</td></tr><tr><td>Password</td><td><img src="../../assets/image%20%283%29%20%285%29%20%281%29.png" alt=""></td><td>Optional</td><td>Used for service authentication. Custom Code can be used to set the password. Can be set per document.</td></tr><tr><td>RemoveComments</td><td><img src="../../assets/image%20%281%29%20%281%29%20%283%29%20%281%29%20%281%29%20%282%29%20%281%29%20%283%29.png" alt=""></td><td>Optional</td><td>Remove human comments from a document.</td></tr></tbody></table>

## Add and Process Documents <a href="#add-and-process-documents" id="add-and-process-documents"></a>

1. In the **Microsoft Identity Document Service** click on **Inbox** in the App Bar.
2. Select the Status you want to upload and use Status **None** or **Received** for new documents that have not been processed yet.
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”.
4. Find the files on your Local machine and upload them. **The demo's test files can be found at the following link:** [**Click here**](https://docs.aiforged.com/DemoDocuments/ABBYY%20Classification%20%20Testing.zip)​
5. After all the documents have been uploaded you can check the documents to be processed, click on **Processed Checked** to process the documents.

It is recommended to only process a few documents at a time, especially if it is a new service to properly test if you receive the results you want before processing everything.

## View Processed Documents <a href="#view-processed-documents" id="view-processed-documents"></a>

1. In the **Microsoft Identity Document Service** click on **Outbox** button.
2. You can view the **Processing** results by opening a processed doc for verification.

## Possible use cases <a href="#possible-use-cases" id="possible-use-cases"></a>

* Extracting **Identity Document** data.
* Match Name and Surname fields to other supporting docs to verify the identity of a person.






# Google Handwriting

​

<figure><img src="../../.gitbook/assets/image (17) (1) (1).png" alt=""><figcaption></figcaption></figure>

Write a caption​The **Google Handwriting Service** reads text from images for you to use. Any detected handwriting will be extracted per **Area**, which will contain a list of **Paragraphs** (if applicable) and **Words.** An example is shown below.

<figure><img src="../../.gitbook/assets/image (11) (1) (1).png" alt=""><figcaption></figcaption></figure>

## Supported Content Types

* Images
* Pdf

If you need to use a different type of content, you can use the **AIForged Pdf Converter**.

## Possible use cases

* Extract any handwritten information from documents.

## Service Setup

1. Open the **Project Detail View** of the project you would like to add the service to.
2. Click on the **Add Service** button in the command bar.\
   ![](<../../.gitbook/assets/image (82) (2).png>)
3.  Select the **Google Handwriting Service**.

    <figure><img src="../../.gitbook/assets/image (13) (2).png" alt=""><figcaption></figcaption></figure>
4.  A new **Service Configuration Wizard** will open:\
    (When navigating the Wizard, please make sure to use the **Next Step** button in the command bar to save any changes made).

    <figure><img src="../../.gitbook/assets/image (3) (4).png" alt=""><figcaption></figcaption></figure>

* **Step 1 -** Service Config (Displays the service setting, you can change it as required).
* Click the “Next” Action in the Action Bar to save the Service.
* **Step 2 -** Verification. No verification required.

## Service Configuration Settings

The **Microsoft OCR Service** can be configured by the user as a flexible solution. The following **Settings** are available:

<table><thead><tr><th width="256">Setting</th><th width="126">Type</th><th width="139">Required Type</th><th>Description</th></tr></thead><tbody><tr><td>ArchivingStrategy</td><td><img src="../../.gitbook/assets/image (14) (6).png" alt=""></td><td>Optional</td><td>Days before documents get deleted.</td></tr><tr><td>AccessKey</td><td><img src="../../.gitbook/assets/image (7) (2).png" alt=""></td><td>Optional</td><td>Override the Access Key to the configured Google cloud service.</td></tr><tr><td>BaseURL</td><td><img src="../../.gitbook/assets/image (7) (2).png" alt=""></td><td>Optional</td><td>Override the URL to the configured Google cloud service.</td></tr><tr><td>BatchSize</td><td><img src="../../.gitbook/assets/image (5) (3).png" alt=""></td><td>Hidden</td><td>Processing batch size.</td></tr><tr><td>DocumentProcessedStatus</td><td><img src="../../.gitbook/assets/image (6) (4).png" alt=""></td><td>Optional</td><td>Document status used to denote that a document has been processed.</td></tr><tr><td>Enabled</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (1) (1).png" alt=""></td><td>Hidden</td><td>Enable or disable the service.</td></tr><tr><td>ExecuteBeforeProcess</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (2).png" alt=""></td><td></td><td>When set up as a child service, specify whether this service should be executed <strong>before</strong> the parent service gets executed.</td></tr><tr><td>ExecuteAfterProcess</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (2) (7).png" alt=""></td><td></td><td>When set up as a child service, specify whether this service should be executed <strong>after</strong> the parent service gets executed.</td></tr><tr><td>IsVerification</td><td><img src="../../.gitbook/assets/image (15) (1) (3) (2).png" alt=""></td><td>Optional</td><td>Save the lines and words for verification.</td></tr><tr><td>Language</td><td><img src="../../.gitbook/assets/image (7) (2).png" alt=""></td><td>Optional</td><td>Hint at the language to use when performing OCR.</td></tr><tr><td>Password</td><td><img src="../../.gitbook/assets/image (3) (5) (1).png" alt=""></td><td>Optional</td><td>Used for service authentication. Custom Code can be used to set the password. Can be set per document.</td></tr><tr><td>RemoveComments</td><td><img src="../../.gitbook/assets/image (1) (1) (3) (1) (1) (2) (1) (3) (1).png" alt=""></td><td>Optional</td><td>Remove human comments from a document.</td></tr></tbody></table>

## Add and Process Documents <a href="#add-and-process-documents" id="add-and-process-documents"></a>

1. In the **Google Handwriting Service** click on **Inbox** in the App Bar.
2. Select the Status you want to upload and use Status **None** or **Received** for new documents that have not been processed yet.
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”.
4. Find the files on your Local machine and upload them. **The demo's test files can be found at the following link:** [**Click here**](https://larchold-my.sharepoint.com/:u:/g/personal/jannie_larcai_com/Ec-_k8RmUqNAv6WgCgwItfcBTRp1Gk0V6OeyTj2S3SIUQg?e=EquxX9)**.**
5. After all the documents have been uploaded you can check the documents to be processed, click on **Processed Checked** to process the documents.

It is recommended to only process a few documents at a time, especially if it is a new service to properly test if you receive the results you want before processing everything.

## View Processed Documents <a href="#view-processed-documents" id="view-processed-documents"></a>

1. In the **Google Handwriting Service** click on the **Outbox** button.
2. You can view your **Processing** results by opening a processed doc for verification.

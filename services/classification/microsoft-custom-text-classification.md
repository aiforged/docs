# Microsoft Custom Text Classification

<figure><img src="../../.gitbook/assets/image (7) (3).png" alt=""><figcaption></figcaption></figure>

The **Microsoft Custom Text Classification Service** is a **Classification** service that allows users to supply custom data to train a **Classification Model** with **Azure Cognitive Services for Language**. It is a cloud-based API service that applies machine-learning intelligence to enable you to build custom models for text classification tasks.

Users provide their own documentation for training, which has to be **Labeled** with a class or category. The user can also specify which percentage of the supplied documents must be used for training and evaluation of the AI models.

Although there is no fixed number of labels that can guarantee that the model will perform best, it is recommended that **50** documents are uploaded per **Category** in the service for training and evaluation purposes, in order to minimize ambiguity in the schema. The recommended split percentage is **80 %** for training and **20 %** for testing (evaluation).

A **Dependent OCR Service** is also created along with the creation of the **Microsoft Custom Text Classification Service**, which is easily configured if required (default settings are usually sufficient). The OCR service is used to extract text from any document type, which is then passed to **Azure Cognitive Services for Language** for classification.

## Possible use cases

* Distinguish between different types or variants of similar documents.
* Automatic emails or ticket triage.

## Supported Content Types

* Pdf
* Word or Excel
* Images
* Text files

If you need to use a different type of content, you can use the **AIForged Pdf Converter**.

## Service Setup

1. Open the **Project Detail View** of the project that you would like to add the service to.
2. Click on the **Add Service** button in the command bar.\
   ![](<../../.gitbook/assets/image (82) (2).png>)
3.  Select **AIForged Classification Service** from the available **Service Types.**

    <figure><img src="../../.gitbook/assets/image (8) (3).png" alt=""><figcaption></figcaption></figure>
4.  A new **Service Configuration Wizard** will open:\
    (When navigating the Wizard, please make sure to use the **Next Step** button in the command bar to save any changes made).

    <figure><img src="../../.gitbook/assets/image (3) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

* **Step 1** **-** Allows configuration of various service settings, including the name and description. The default settings are sufficient for most use cases.
* **Step 2 -** Allows adding **User Defined Categories** to train the service on.
* **Step 3 -** Training \*
  1. ![](<../../.gitbook/assets/33 (1) (2) (1) (1) (1) (1) (1) (1) (1) (7) (1).png>) Click **Upload Training Documents** in the command bar.
  2. Select the **User Defined Category** that you want to upload documents to.
  3. Upload files for each **User Defined Category** you wish to train the service on. It is recommended to upload **50** training documents per category.
  4. Once you have uploaded all your documents, ensure that the correct settings have been applied to the service in **Step 1** (such as Training/testing split percentage, etc.), and click the **Train Service** button in the command bar to train your service.
  5. Click **Process** on the dialog window that appears. Leave all settings as default.
  6. A progress dialog will appear displaying the progress of the training.\
     Training times can vary depending on the number of files that have been uploaded for training.
  7. The progress dialog should automatically close once the training has been completed.
* **Step 4** - The **Definition Document** should be created after the **Service** has been trained successfully.
* **Step 5** - Opens the service configuration page for the Dependant OCR service used to extract text from documents. Depending on the **OCR Engine** selected, please refer to the relevant **OCR Engine** page:
  * [Tesseract OCR](../ocr/teseract-ocr.md)
  * [Microsoft OCR](../ocr/microsoft-ocr.md)
  * [Google OCR](../ocr/google-ocr.md)
* Click on the **Complete** button in the command bar to validate your service configuration and close the wizard.\
  ![](<../../.gitbook/assets/image (84) (1).png>)

## Add and Process Documents

1. In your Microsoft Forms Recognizer Service click on the **Inbox** button.
2. Select the Status you want to upload and use Status **None** or **Received** for new documents that have not been processed yet.
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”.
4. Find the files on your Local machine and upload them. **The demos test files can be found at the following link:** [**Click here**](https://larchold-my.sharepoint.com/:u:/g/personal/jannie_larcai_com/Ec-_k8RmUqNAv6WgCgwItfcBTRp1Gk0V6OeyTj2S3SIUQg?e=EquxX9)
5. After all the documents have been uploaded you can check the documents to be processed, click on “Processed Checked” to process the documents

It is recommended to only process a few documents at a time, especially if it is a new service to properly test if you receive the results you want before processing everything.

## Service Configuration Settings

The **Microsoft Form Recognizer Service** can be configured by the user as a flexible solution. The following **Settings** are available:

| Setting                  | Type                                                                   | Required Type | Description                                                                                                                                   |
| ------------------------ | ---------------------------------------------------------------------- | ------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| AccessKey                | ![](<../../.gitbook/assets/image (7) (2).png>)                         | Optional      | Override the Access Key to the configured Google cloud service.                                                                               |
| ApiVersion               | ![](<../../.gitbook/assets/image (7) (2).png>)                         | Optional      | Override the MS API version to use when making requests.                                                                                      |
| ArchivingStrategy        | ![](<../../.gitbook/assets/image (5) (3).png>)                         | Optional      | Days before documents get deleted.                                                                                                            |
| BaseURL                  | ![](<../../.gitbook/assets/image (7) (2).png>)                         | Optional      | Override the URL to the configured Google cloud service.                                                                                      |
| BatchSize                | ![](<../../.gitbook/assets/image (14) (6).png>)                        | Hidden        | Processing batch size.                                                                                                                        |
| DocumentProcessedStatus  | ![](<../../.gitbook/assets/image (6) (4).png>)                         | Optional      | Document status used to denote that a document has been processed.                                                                            |
| Enabled                  | ![](<../../.gitbook/assets/image (15) (5) (3).png>)                    | Hidden        | Enable or disable the service.                                                                                                                |
| ExecuteBeforeProcess     | ![](<../../.gitbook/assets/image (15) (1) (1) (4).png>)                |               | When set up as a child service, specify whether this service should be executed **before** the parent service gets executed                   |
| ExecuteAfterProcess      | ![](<../../.gitbook/assets/image (1) (1) (3) (1) (1) (1) (1) (1).png>) |               | When set up as a child service, specify whether this service should be executed **after** the parent service gets executed                    |
| Password                 | ![](<../../.gitbook/assets/image (3) (5) (1).png>)                     | Optional      | Used for service authentication. Custom Code can be used to set the password. Can be set per document.                                        |
| RemoveComments           | ![](<../../.gitbook/assets/image (1) (1) (3) (1) (1) (1) (2) (1).png>) | Optional      | Remove human comments from a document.                                                                                                        |
| TrainingTimeoutInMinutes | ![](<../../.gitbook/assets/image (5) (3).png>)                         | Required      | Specifies after how many minutes the training operation should time out, if not completed by then                                             |
| TrainingSplitPercentage  | ![](<../../.gitbook/assets/image (5) (3).png>)                         | Required      | Percentage of uploaded training docs to be used for actually training the AI model. The remainder will be used to evaluate the trained model. |

# AIForged Classification

![](../assets/34.png)

The AIForged Classification service is a inhouse Classification service build to automatically categorize documents and sort them into predefined document categories. The AIForged Classification service allows setting up flexible and scalable classification processes that can granularly distinguish among many document categories.

#### Setup Service

1. Open the project you would like to add the service to
2. Click on Add Service
3. Select the ABBYY Classification Service
4. **Step 1** – Service \(Displays the service setting, you can change it as required\)
5. Click the “Next” Action in the Action Bar to save the Service
6. **Step 2** Classes, to add a Class View [Document Categories]() \(Click next to save categories\)
7. **Step 3** Training
   * 1. ![](../assets/35.png) Click “Upload Training Documents” in the Action Bar
     2. Select the Document Category you want to upload documents to
     3. Upload Documents for each category you want to train
     4. Click Train Service once all documents have been uploaded
     5. A log Window will open displaying the current logs for the Training Document
     6. Click the Next button when done training
8. **Step 4** Definition, the definition Document would be created after the Service has trained successfully

#### Add and Process Documents

1. In your AIForged Classification Service click on “Inbox” in the App Bar
2. Select your Status you want to upload, use Status “None” or “Received” for new documents that have not been processed yet
3. Select an optional category if you know the category for the document, if you don’t want to select one just click on “No selection”
4. Find the files on your Local machine and upload them. **The demos test files can be found at the following link:** [**Click here**](https://larchold-my.sharepoint.com/:u:/g/personal/jannie_larcai_com/Ec-_k8RmUqNAv6WgCgwItfcBTRp1Gk0V6OeyTj2S3SIUQg?e=EquxX9)
5. After all the documents have been uploaded you can check the documents to be processed, click on “Processed Checked” to process the documents
6. It is Recommended to only process a few documents at a time if is a new service to properly test if you receive the results you want before processing everything

#### View Processed Documents

1. In your AIForged Classification Service click on “Outbox” in the App Bar
2. You can View your Processing results in the Status

#### Possible use cases

* Distinguish between different types of bank statements
* Distinguish between different types of Identification documents
* Distinguish between different types of invoices


---
title: Bank Statement
parent: Practical Examples
nav_order: 1
---

# Bank Statement

## How to extract data from a bank statement

This is an example of a **bank statement**.

<figure><img src="../.gitbook/assets/image (35) (2).png" alt=""><figcaption></figcaption></figure>

The purpose of this process is to extract the **Account Number**, **Full Name**, **Statement Date,** and the line items of the **Transactions** table. The detailed steps are as follows:

1. Create a new or select an existing **Project**.
2. Create a new **Service**.
3.  Select **MS Forms Recognizer - Bank Statements** from the **Extract & Verify** group.

    <figure><img src="../.gitbook/assets/image (56).png" alt=""><figcaption></figcaption></figure>
4.  The **Configuration Wizard** for the service will appear.\\

    <figure><img src="../.gitbook/assets/image (13) (2).png" alt=""><figcaption></figcaption></figure>
5.  (Optional) Rename the **service name** and **service description**.

    <figure><img src="../.gitbook/assets/image (25) (2) (1).png" alt=""><figcaption></figcaption></figure>
6.  Click on **Next: Step 2 - Categories** (or click on **Step 2** Wizard Step).

    <figure><img src="../.gitbook/assets/image (34) (1).png" alt=""><figcaption></figcaption></figure>
7.  Add a new **Category** to upload the training documents.

    <figure><img src="../.gitbook/assets/image (15) (2).png" alt=""><figcaption></figcaption></figure>

    <figure><img src="../.gitbook/assets/image (29) (2).png" alt=""><figcaption></figcaption></figure>

    <figure><img src="../.gitbook/assets/image (27).png" alt=""><figcaption></figcaption></figure>
8.  Click on **Next: Step 3** **- Layout Analysis** (or click on **Step 3** Wizard Step).

    <figure><img src="../.gitbook/assets/image (25) (3).png" alt=""><figcaption></figcaption></figure>
9.  The Document Data Grid will appear. Select **Upload Training Documents** to open a dialogue to upload training documents for **Bank Statement**. Files can also be dragged and dropped onto the grid.

    <figure><img src="../.gitbook/assets/image (44) (2).png" alt=""><figcaption></figcaption></figure>
10. Select the **Category** of the training documents.

    <figure><img src="../.gitbook/assets/image (12) (2) (1).png" alt=""><figcaption></figcaption></figure>
11. Once the files are loaded, note that they are in the **Received** state.

    <figure><img src="../.gitbook/assets/image (38).png" alt=""><figcaption></figcaption></figure>
12. Select the documents you want to include in training the service (a minimum of 5 is required for MS Forms Recognizer), and select **Analyze Documents**.

    <figure><img src="../.gitbook/assets/image (43) (3).png" alt=""><figcaption></figcaption></figure>
13. Select the desired **Execution Parameters** for analyzing the documents. Normally, the default values will suffice. Click **Process**.

    <figure><img src="../.gitbook/assets/image (35) (1).png" alt=""><figcaption></figcaption></figure>
14. A progress dialogue will be displayed during the processing of the request. The **Progress Logs** can be expanded to scrutinize detailed logging of the progress. Once the operation is complete, the dialogue can be closed.

    <figure><img src="../.gitbook/assets/image (10) (2) (1).png" alt=""><figcaption></figcaption></figure>
15. After the documents are analyzed, the layout of the document is available in a structured format. These documents are demarcated by the **Analyzed** status. By using **Custom Labelling**, the service can be trained to detect values relative to the document layout. Click **Next: Step 4 - Custom Labeling** (or click on **Step 4** Wizard Step).

    <figure><img src="../.gitbook/assets/image (2) (3).png" alt=""><figcaption></figcaption></figure>
16. The **Document Designer** is presented in step 4. A preview of the document is shown with the overlayed analyzed layout data.

    <figure><img src="../.gitbook/assets/image (4) (3) (2).png" alt=""><figcaption></figcaption></figure>
17. Details and metadata of the detected layout **Parameters** can be viewed by clicking on the bounding box of the text.

    <figure><img src="../.gitbook/assets/image (24) (3).png" alt=""><figcaption></figcaption></figure>
18. In the case of Bank Statements cards, we are interested in extracting the **Account Number**, **Full Name**, **Statement Date,** and the line items of the **Transactions** table fields. To start labeling, click on the preview of the document in the **Document Designer**, and drag the region where the field data can be found.

    <figure><img src="../.gitbook/assets/image (9) (3) (1).png" alt=""><figcaption></figcaption></figure>
19. When a region is selected, a dialogue is presented to create a **Parameter Definition** for each of the fields. An existing field can be used, or a new one can be created.

    <figure><img src="../.gitbook/assets/image (40).png" alt=""><figcaption></figcaption></figure>
20. Once all the fields that required extraction are labeled, the **Parameters** with the detected values are displayed in the **Document Data** view. Once all the labels have been drawn, the document can be saved by clicking on **Save Custom Labels.**

    <figure><img src="../.gitbook/assets/image (20) (1).png" alt=""><figcaption></figcaption></figure>
21. Repeat steps 18 - 20 for all the documents uploaded for training.
22. Once all the documents are labeled, the model of the service can be trained. Click on **Next: Step 5 - Training** (or click on **Step 5** Wizard Step).\\

    <figure><img src="../.gitbook/assets/image (26) (2).png" alt=""><figcaption></figcaption></figure>
23. Now that the documents have been labeled, we can request the train operation. In step 5, click on **Train Service**. Again the progress dialogue will show the progress of the training operation. Note that after training has been completed successfully, the status will change to **Trained**.

    <figure><img src="../.gitbook/assets/image (19) (3).png" alt=""><figcaption></figcaption></figure>
24. At this stage, the service is trained, and documents can be loaded into the [**Inbox** ](../documents/documents-inbox.md)of the service and can be processed.
25. The OCR results can be viewed in the [**Outbox**](../documents/documents-outbox.md) of the service.

---
title: Credit Application Form
parent: Practical Examples
nav_order: 2
---

# Credit Application Form

## How to extract data from an application form

This is an example of a **Credit Application** form.

<figure><img src="../.gitbook/assets/image (30).png" alt=""><figcaption></figcaption></figure>

The purpose of this process is to extract various fields on the form, including the **First Name**, **Last Name**, **Date of Birth**, **Physical Address**, **E-mail Address**, **Employment Details**, and **Banking Information**, to name a few. The detailed steps are as follows:

1. Create a new or select an existing **Project**.
2. Create a new **Service**.
3. Select **MS Forms Recognizer** from the **Extract & Verify** group.![](<../.gitbook/assets/image (41) (2).png>)
4.  The **Configuration Wizard** for the service will appear.

    <figure><img src="../.gitbook/assets/image (13) (2).png" alt=""><figcaption></figcaption></figure>
5.  (Optional) Rename the **service name** and **service description**.

    <figure><img src="../.gitbook/assets/image (25) (2).png" alt=""><figcaption></figcaption></figure>
6.  Click on **Next: Step 2 - Categories** (or click on **Step 2** Wizard Step).

    <figure><img src="../.gitbook/assets/image (34) (1).png" alt=""><figcaption></figcaption></figure>
7.  Add a new **Category** to upload the training documents.

    <figure><img src="../.gitbook/assets/image (15) (2).png" alt=""><figcaption></figcaption></figure>

    <figure><img src="../.gitbook/assets/image (7) (3).png" alt=""><figcaption></figcaption></figure>

    <figure><img src="../.gitbook/assets/image (17) (2).png" alt=""><figcaption></figcaption></figure>
8. Click on **Next: Step 3** **- Layout Analysis** (or click on **Step 3** Wizard Step).
9.  The Document Data Grid will appear. Select **Upload Training Documents** to open a dialogue to upload training documents for **Credit Application**. Files can also be dragged and dropped onto the grid.

    <figure><img src="../.gitbook/assets/image (43) (2).png" alt=""><figcaption></figcaption></figure>
10. Select the **Category** of the training documents.

    <figure><img src="../.gitbook/assets/image (50) (2).png" alt=""><figcaption></figcaption></figure>
11. Once the files are loaded, note that they are in the **Received** state.

    <figure><img src="../.gitbook/assets/image (42).png" alt=""><figcaption></figcaption></figure>
12. Select the documents you want to include in training the service (a minimum of 5 is required for MS Forms Recognizer), and select **Analyze Documents**.

    <figure><img src="../.gitbook/assets/image (14) (3).png" alt=""><figcaption></figcaption></figure>
13. Select the desired **Execution Parameters** for analyzing the documents. Normally, the default values will suffice. Click **Process**.

    <figure><img src="../.gitbook/assets/image (35) (1).png" alt=""><figcaption></figcaption></figure>
14. A progress dialogue will be displayed during the processing of the request. The **Progress Logs** can be expanded to scrutinize detailed logging of the progress. Once the operationis complete, the dialogue can be closed.

    <figure><img src="../.gitbook/assets/image (10) (2).png" alt=""><figcaption></figcaption></figure>
15. After the documents are analyzed, the layout of the document is available in a structured format. These documents are demarcated by the **Analyzed** status. By using **Custom Labelling**, the service can be trained to detect values relative to the document layout. Click **Next: Step 4 - Custom Labeling** (or click on **Step 4** Wizard Step).

    <figure><img src="../.gitbook/assets/image (49) (2).png" alt=""><figcaption></figcaption></figure>
16. The **Document Designer** is presented in step 4. A preview of the document is shown with the overlayed analyzed layout data.

    <figure><img src="../.gitbook/assets/image (16) (2).png" alt=""><figcaption></figcaption></figure>
17. Details and metadata of the detected layout **Parameters** can be viewed by clicking on the bounding box of the text.

    <figure><img src="../.gitbook/assets/image (3) (4).png" alt=""><figcaption></figcaption></figure>
18. In the case of Social Security cards, we are interested in extracting the **SSN**, the **Full Name** and the **Date of Issue** fields. To start labeling, click on the preview of the document in the **Document Designer**, and drag the region where a field can be found.

    <figure><img src="../.gitbook/assets/image (23) (1).png" alt=""><figcaption></figcaption></figure>
19. When a region is selected, a dialogue is presented to create a **Parameter Definition** for each of the fields. An existing field can be used, or a new one can be created.

    <figure><img src="../.gitbook/assets/image (18) (2).png" alt=""><figcaption></figcaption></figure>
20. Once all the fields that required extraction are labeled, the **Parameters** with the detected values are displayed in the **Document Data** view. Once all the labels have been drawn, the document can be saved by clicking on **Save Custom Labels.**

    <figure><img src="../.gitbook/assets/image (40) (2).png" alt=""><figcaption></figcaption></figure>
21. Repeat steps 18 - 20 for all the documents uploaded for training.
22. Once all the documents are labeled, the model of the service can be trained. Click on **Next: Step 5 - Training** (or click on **Step 5** Wizard Step).

    <figure><img src="../.gitbook/assets/image (52).png" alt=""><figcaption></figcaption></figure>
23. Now that the documents have been labeled, we can request the train operation. In step 5, click on **Train Service**. Again the progress dialogue will show the progress of the training operation. Note that after training has been completed successfully, the status will change to **Trained**.

    <figure><img src="../.gitbook/assets/image (21) (1).png" alt=""><figcaption></figcaption></figure>
24. At this stage, the service is trained, and documents can be loaded into the [**Inbox**](../documents/documents-inbox.md) of the service and can be processed.
25. The OCR results can be viewed in the [**Outbox**](../documents/documents-outbox.md) \*\*\*\* of the service.

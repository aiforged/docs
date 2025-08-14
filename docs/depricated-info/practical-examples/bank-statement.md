# Bank Statement

## How to extract data from a bank statement

This is an example of a **bank statement**.

![](../../assets/image%20%28219%29.png)
The purpose of this process is to extract the **Account Number**, **Full Name**, **Statement Date,** and the line items of the **Transactions** table. The detailed steps are as follows:

1. Create a new or select an existing **Project**.
2. Create a new **Service**.
3.  Select **MS Forms Recognizer - Bank Statements** from the **Extract & Verify** group.

    ![](../../assets/image%20%2875%29%20%281%29.png)
4.  The **Configuration Wizard** for the service will appear.\

    ![](../../assets/image%20%2859%29%20%282%29.png)
5.  (Optional) Rename the **service name** and **service description**.

    ![](../../assets/image%20%2891%29%20%281%29.png)
6.  Click on **Next: Step 2 - Categories** (or click on **Step 2** Wizard Step).

    ![](../../assets/image%20%2869%29%20%281%29.png)
7.  Add a new **Category** to upload the training documents.

    ![](../../assets/image%20%2896%29%20%281%29.png)
    ![](../../assets/image%20%28192%29.png)
    ![](../../assets/image%20%28172%29.png)
8.  Click on **Next: Step 3** **- Layout Analysis** (or click on **Step 3** Wizard Step).

    ![](../../assets/image%20%28252%29.png)
9.  The Document Data Grid will appear. Select **Upload Training Documents** to open a dialogue to upload training documents for **Bank Statement**. Files can also be dragged and dropped onto the grid.

    ![](../../assets/image%20%28177%29.png)
10. Select the **Category** of the training documents.

    ![](../../assets/image%20%28218%29.png)
11. Once the files are loaded, note that they are in the **Received** state.

    ![](../../assets/image%20%28205%29.png)
12. Select the documents you want to include in training the service (a minimum of 5 is required for MS Forms Recognizer), and select **Analyze Documents**.

    ![](../../assets/image%20%28246%29.png)
13. Select the desired **Execution Parameters** for analyzing the documents. Normally, the default values will suffice. Click **Process**.

    ![](../../assets/image%20%28105%29%20%281%29.png)
14. A progress dialogue will be displayed during the processing of the request. The **Progress Logs** can be expanded to scrutinize detailed logging of the progress. Once the operation is complete, the dialogue can be closed.

    ![](../../assets/image%20%2840%29%20%281%29%20%281%29.png)
15. After the documents are analyzed, the layout of the document is available in a structured format. These documents are demarcated by the **Analyzed** status. By using **Custom Labelling**, the service can be trained to detect values relative to the document layout. Click **Next: Step 4 - Custom Labeling** (or click on **Step 4** Wizard Step).

    ![](../../assets/image%20%28185%29.png)
16. The **Document Designer** is presented in step 4. A preview of the document is shown with the overlayed analyzed layout data.

    ![](../../assets/image%20%28220%29.png)
17. Details and metadata of the detected layout **Parameters** can be viewed by clicking on the bounding box of the text.

    ![](../../assets/image%20%28200%29.png)
18. In the case of Bank Statements cards, we are interested in extracting the **Account Number**, **Full Name**, **Statement Date,** and the line items of the **Transactions** table fields. To start labeling, click on the preview of the document in the **Document Designer**, and drag the region where the field data can be found.

    ![](../../assets/image%20%28221%29.png)
19. When a region is selected, a dialogue is presented to create a **Parameter Definition** for each of the fields. An existing field can be used, or a new one can be created.

    ![](../../assets/image%20%28217%29.png)
20. Once all the fields that required extraction are labeled, the **Parameters** with the detected values are displayed in the **Document Data** view. Once all the labels have been drawn, the document can be saved by clicking on **Save Custom Labels.**

    ![](../../assets/image%20%28235%29.png)
21. Repeat steps 18 - 20 for all the documents uploaded for training.
22. Once all the documents are labeled, the model of the service can be trained. Click on **Next: Step 5 - Training** (or click on **Step 5** Wizard Step).\

    ![](../../assets/image%20%28210%29.png)
23. Now that the documents have been labeled, we can request the train operation. In step 5, click on **Train Service**. Again the progress dialogue will show the progress of the training operation. Note that after training has been completed successfully, the status will change to **Trained**.

    ![](../../assets/image%20%28211%29.png)
24. At this stage, the service is trained, and documents can be loaded into the **Inbox** of the service and can be processed.
25. The OCR results can be viewed in the **Outbox** of the service.

 IgnoreCase Multiline IgnoreCase Multiline




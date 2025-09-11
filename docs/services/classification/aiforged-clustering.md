# AIForged Clustering

### Overview

The **AIForged Clustering Service** is an in-house developed machine learning solution designed to group unlabeled documents and data. Leveraging unsupervised machine learning, this service automatically classifies documents into logical clusters or categories—without the need for predefined labels.

!!! info
    Clustering is ideal for sorting large volumes of documents, especially when you don’t have labeled training data or need to discover new document types.

***

### Possible Use Cases

* **Distinguish between different types or variants of similar documents.**
* **Automatically sort and organize large volumes of documents into logical groups or categories.**

***

### Service Setup

Follow these steps to add and configure the AIForged Clustering Service for your agent:

1. **Open the Agent  View**  
    Navigate to the agent where you want to add the clustering service.
2. **Add the Clustering Service**  
    Click the **Add Service** ![](../../assets/image%20%2814%29%20%281%29%20%281%29%20%281%29.png) button.
3. **Select Service Type**  
    In the **Classification** service category choose **AIForged Clustering** from the available service types.
    ![](../../assets/image%20%2815%29%20%281%29%20%281%29%20%281%29.png)
4. **Configure via the Service Wizard**  
    Open the service configuration wizard.  
    ![](../../assets/image%20%2816%29%20%281%29%20%281%29%20%281%29.png)  
    Or  
    ![](../../assets/image%20%2817%29%20%281%29%20%281%29%20%281%29.png)  
    * **Step 1:**  
        Configure general service settings.  
        *Default settings are sufficient for most use cases.*  
        ![](../../assets/image%20%2818%29%20%281%29%20%281%29%20%281%29.png)  
    * **Step 2:**  
        Add any User Defined Categories you want to train the service on.  
        *The Clustering Service will automatically add new categories as it discovers clusters.*  
        ![](../../assets/image%20%2819%29%20%281%29%20%281%29%20%281%29.png)  
    * **Step 3: Training**  
        1. Click **Upload Training Documents** ![](../../assets/image%20%2820%29%20%281%29%20%281%29%20%281%29.png) or drag and drop files over the documents grid.  
            ![](../../assets/image%20%2821%29%20%281%29%20%281%29%20%281%29.png)  
        2. Select the User Defined Category for your uploads.
        3. Upload demo or real files for each category you wish to train.
        4. After uploading, make sure no documents are selected and click the **Train Service** ![](../../assets/image%20%2822%29%20%281%29%20%281%29.png) button.
        5. In the dialog window that appears, click **Process** and leave all settings as default.
        6. A progress dialog will show training progress; it will close automatically when training is complete.

!!!tip
      Training times vary depending on the number of files uploaded.

***

### Add and Process Documents

To upload and process documents using the Clustering Service:

1. **Open Service**  
    In the AIForged Studio open the clustering service.
2.  **Upload Documents**  
    Locate and upload files from your local machine.  
    Click the **Upload** ![](../../assets/image%20%2820%29%20%281%29%20%281%29%20%281%29.png) button or drag and drop files over the document grid.  
    ![](../../assets/image%20%2823%29%20%281%29%20%281%29.png)
3. **Choose Category (Optional)**  
    If you already know the document category, select it. Otherwise, select **No category**.
4. **Process Documents**  
    After uploading, check the documents to be processed and click on the **Process** ![](../../assets/image%20%2824%29%20%281%29%20%281%29.png) button.

!!! info
    It is recommended to process a small batch first, especially if this is a new service, to validate results before full-scale processing.

***

### View Processed Documents

* In the Clustering Service, change the usage filter to **Outbox**.  
  ![](../../assets/image%20%2825%29%20%281%29%20%281%29.png)
* Open any processed document to view clustering results and perform verification.






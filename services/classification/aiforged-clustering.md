# AIForged Clustering

### Overview

The **AIForged Clustering Service** is an in-house developed machine learning solution designed to group unlabeled documents and data. Leveraging unsupervised machine learning, this service automatically classifies documents into logical clusters or categories—without the need for predefined labels.

{% hint style="info" %}
Clustering is ideal for sorting large volumes of documents, especially when you don’t have labeled training data or need to discover new document types.
{% endhint %}

***

### Possible Use Cases

* **Distinguish between different types or variants of similar documents.**
* **Automatically sort and organize large volumes of documents into logical groups or categories.**

***

### Service Setup

Follow these steps to add and configure the AIForged Clustering Service for your agent:

1. **Open the Agent  View**\
   Navigate to the agent where you want to add the clustering service.
2. **Add the Clustering Service**\
   Click the **Add Service** ![](<../../.gitbook/assets/image (14) (1) (1) (1).png>) button.
3. **Select Service Type**\
   In the **Classification** service category choose **AIForged Clustering** from the available service types.\
   ![](<../../.gitbook/assets/image (15) (1) (1) (1).png>)
4. **Configure via the Service Wizard**\
   Open the service configuration wizard.\
   ![](<../../.gitbook/assets/image (16) (1) (1) (1).png>)  or  ![](<../../.gitbook/assets/image (17) (1) (1) (1).png>)
   * **Step 1:**\
     Configure general service settings.\
     &#xNAN;_&#x44;efault settings are sufficient for most use cases._\
     ![](<../../.gitbook/assets/image (18) (1) (1) (1).png>)
   * **Step 2:**\
     Add any User Defined Categories you want to train the service on.\
     &#xNAN;_&#x54;he Clustering Service will automatically add new categories as it discovers clusters._\
     ![](<../../.gitbook/assets/image (19) (1) (1) (1).png>)
   * **Step 3: Training**
     1. Click **Upload Training Documents** ![](<../../.gitbook/assets/image (20) (1) (1) (1).png>) or drag and drop files over the documents grid.\
        ![](<../../.gitbook/assets/image (21) (1) (1) (1).png>)
     2. Select the User Defined Category for your uploads.
     3. Upload demo or real files for each category you wish to train.
     4. After uploading, make sure no documents are selected and click the **Train Service** ![](<../../.gitbook/assets/image (22) (1) (1).png>) button.
     5. In the dialog window that appears, click **Process** and leave all settings as default.
     6.  A progress dialog will show training progress; it will close automatically when training is complete.

         > **Tip:** Training times vary depending on the number of files uploaded.
   * **Step 4:**\
     After successful training, you can start clustering documents.

***

### Add and Process Documents

To upload and process documents using the Clustering Service:

1. **Open Service**\
   In the AIForged Studio open the clustering service.
2.  **Upload Documents**\
    Locate and upload files from your local machine.

    > **Tip:** Demo test files are available at the provided link.

    \
    Click the **Upload** ![](<../../.gitbook/assets/image (20) (1) (1) (1).png>) button or drag and drop files over the document grid.\
    ![](<../../.gitbook/assets/image (23) (1).png>)
3. **Choose Category (Optional)**\
   If you already know the document category, select it. Otherwise, select **No category**.
4. **Process Documents**\
   After uploading, check the documents to be processed and click on the **Process** ![](<../../.gitbook/assets/image (24) (1).png>) button.

{% hint style="info" %}
It is recommended to process a small batch first, especially if this is a new service, to validate results before full-scale processing.
{% endhint %}

***

### View Processed Documents

* In the Clustering Service, change the usage filter to **Outbox**.\
  ![](<../../.gitbook/assets/image (25) (1).png>)
* Open any processed document to view clustering results and perform verification.

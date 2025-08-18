# Microsoft Custom Text Classification

### Overview

The Microsoft Custom Text Classification Service in AIForged leverages Azure Cognitive Services for Language to enable powerful, custom document classification. This cloud-based API allows you to train machine learning models on your own labeled data, providing flexibility and high accuracy for text classification tasks.

!!! info
    This service is ideal for organizations with unique document types, custom workflows, or specific classification needs that aren’t addressed by out-of-the-box models.

***

### How It Works

* **Custom Model Training:**
  Users upload their own labeled documents to train the model. Each document must be tagged with the correct class or category.
* **Flexible Data Split:**
  You can specify the percentage of documents used for training versus evaluation (recommended: 80% training, 20% testing).
* **Dependent OCR Service:**
  An OCR service is automatically created alongside this classification service to extract text from documents before classification. Default OCR settings are usually sufficient, but can be adjusted if needed.

***

### Possible Use Cases

* Distinguishing between different types or variants of similar documents.
* Automating email or ticket triage.
* Custom document routing based on content.

***

### Supported Content Types

* PDF
* Word or Excel documents
* Images
* Text files

!!! info
    If your content is in a different format, use the AIForged PDF Converter as a pre-processor to generate a compatible file for classification.

***

### Best Practices

* **Upload at Least 50 Documents per Category:**
  For best results, upload a minimum of 50 labeled documents for each category you want to train.
* **Use Clear and Consistent Labels:**
  Ensure each document is accurately tagged with its intended category.
* **Recommended Data Split:**
  Use 80% of your data for training and 20% for evaluation to minimize overfitting and improve model performance.
* **Diverse Examples:**
  Include a variety of real-world examples for each category to help the model generalize.

***

### Service Setup

Follow these steps to add and configure the Microsoft Custom Text Classification Service to your agent:

1. **Open the Agent View**
   Navigate to the agent where you want to add the classification service.
2. **Add the Classification Service**
   Click the **Add Service** ![](../../assets/image%20%2830%29%20%281%29.png) button.
3. **Select Service Type**
   Choose **Microsoft Custom Text Classifier Service** from the available service types.
   ![](../../assets/image%20%2831%29%20%281%29.png)
4. **Configure the Service Wizard**
   Open the Service Configuration Wizard.
   ![](../../assets/image%20%2832%29%20%281%29.png)  or  ![](../../assets/image%20%2833%29%20%281%29.png)
   * **Step 1: General Settings**
     Configure the core settings. Default settings are sufficient for most use cases.
     * Set the **Training/Testing Split Percentage** as desired (default: 80% training, 20% testing).
       ![](../../assets/image%20%2834%29%20%281%29.png)
   * **Step 2: Define Categories**
     Add user-defined categories for your classification task.
     ![](../../assets/image%20%2835%29.png)
   *   **Step 3: Upload Training Documents**
       ![](../../assets/image%20%2836%29.png)

       1. Click the **Upload** ![](../../assets/image%20%2837%29.png) button or drag and drop files over the documents grid.
          ![](../../assets/image%20%2838%29.png)
       2. Select the user-defined category for your uploads.
       3. Upload files for each category (recommended: at least 50 documents per category).
       4. Once all files are uploaded, review your settings.
       5. Click the **Train** ![](../../assets/image%20%2839%29.png) button.
       6. In the dialog window, click **Process** (leave all settings as default).
       7. The training progress dialog will appear and close automatically when finished.

       > **Tip:** Training duration depends on the number of files uploaded.
   * **Step 4: Definition Document**
     After training, a definition document will be created automatically.
   * **Step 5: Dependent OCR Service**
     The service configuration page for the dependent OCR service will open.
     * Choose the appropriate OCR engine (Tesseract, Microsoft, or Google) if you need to adjust settings.
     * For most use cases, default settings are sufficient.

***

### Adding and Processing Documents

1. **Open Service**
   In your Microsoft Custom Text Classification Service, click the **Upload** ![](../../assets/image%20%2837%29.png) button or drag and drop files over the document grid.
   ![](../../assets/image%20%2840%29.png)
2. **Select Category (Optional)**
   If known, select the document category. Otherwise, click on **No category**.
3. **Process Documents**
   After uploading, select the documents to process and click the **Process** ![](../../assets/image%20%2841%29.png) button.

> **Tip:** For new services, process a small batch first to verify results before processing everything.

***

### Troubleshooting Tips

* **Model Accuracy Is Low:**
  * Ensure you have uploaded enough labeled documents per category (at least 50).
  * Double-check that labels are accurate and unambiguous.
  * Increase data diversity by including a variety of document types for each category.
* **Training Fails or Is Slow:**
  * Make sure your files are in a supported format (PDF, Word, Excel, Image, or Text).
  * Check for upload errors or corrupted documents.
  * Large datasets may take longer; monitor the progress dialog for updates.
* **OCR Issues:**
  * If text extraction is poor, try a different OCR engine or adjust OCR settings.
  * Use clear, high-quality source documents for best OCR accuracy.





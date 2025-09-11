# Amazon Invoice Extraction

### Overview

The Amazon Invoice Extraction Service in AIForged utilizes pre-trained invoice models to extract key-value pairs and detailed line items from invoices. This service returns essential invoice data—including Subtotal, VAT, Total, Date, and more—and presents individual line items in a structured table format.

!!! info
    This service is ideal for automating invoice data entry, financial reconciliation, and reporting workflows.

***

### Possible Use Cases

* Extracting invoice-related data for accounting or auditing.
* Automatically capturing individual line items for ERP or expense systems.

***

### Service Setup

Follow these steps to add and configure the **Amazon Invoice Extraction Service** to your agent:

1. **Open the Agent View:**  
   Navigate to the agent where you want to add the service.
2. **Add the Amazon Invoice Extraction Service:**  
   Click the **Add Service** ![](../../assets/image%20%2842%29.png) button.
3. **Select Service Type:**  
   Choose **Amazon Invoice Extraction Service** from the available service types.  
   ![](../../assets/image%20%2853%29.png)
4. **Configure the Service Wizard**
    Open the Service Configuration Wizard.  
    ![](../../assets/image%20%2854%29.png)  
    or  
    ![](../../assets/image%20%2855%29.png)  
    * **Step 1: General Settings:**  
        Configure core settings.  
        _Default settings are sufficient for most use cases._  
        ![](../../assets/image%20%2856%29.png)  

    * **Step 2: User Defined Categories:**  
        Add any categories you wish to use for organizing your processed documents.  
        ![](../../assets/image%20%2857%29.png) 

    * **Step 3: Analysis:**  
        Upload some documents for analysis, select them and click on the **Analysis** ![](../../assets/image%20%28125%29.png) button to generate the applicable fields for your forms.  
        ![](../../assets/image%20%2858%29.png)  

    * **Step 4: Verification:**  
        Review, configure and verify any generated fields.  
        ![](../../assets/image%20%2859%29.png)

***

### Service Configuration Settings

Most users can proceed with the default settings. Advanced configuration is available for custom workflows.

***

### Add and Process Documents

To upload and process identity documents using the **Amazon Invoice Extraction Service**:

1. **Open Service:**  
   In the **Amazon Invoice Extraction Service**, click the **Upload** ![](../../assets/image%20%2837%29.png) button or drag and drop files over the document grid.  
   ![](../../assets/image%20%2850%29.png)  
2. **Select Category (Optional):**  
   If you know the category for the document, select it. Otherwise, select **No category**.  
3. **Process Documents:**  
   After uploading, select the documents to process and click on the **Process** ![](../../assets/image%20%2812%29%20%281%29%20%281%29.png) button.  

!!! info
    **Tip:** For new services, process a small batch first to verify the results before scaling up.

***

### View Processed Documents

* Select **Outbox** in the usage filter in the **Amazon Invoice Extraction Service**.  
  ![](../../assets/image%20%2851%29.png)
* Open any processed document to view and verify the extracted results.

***

### Troubleshooting Tips

* **Incomplete or Incorrect Data?**
    * Ensure the uploaded invoices are clear and legible. Faded or heavily skewed scans may lead to missing data.
    * Check that the document is a true invoice; receipts and statements may not be fully supported.
* **Line Items Not Extracted?**
    * Make sure your invoices have a standard table or item layout. Very complex or unusual table formats may affect extraction accuracy.
* **Upload or Processing Errors?**
    * Confirm that your files are in supported formats (PDF, image formats).
    * Try re-uploading the document or using a different sample to rule out file-specific issues.
* **Performance Issues?**
    * Processing large batches may take longer. Start with smaller batches to ensure responsiveness.

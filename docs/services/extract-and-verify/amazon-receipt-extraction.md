# Amazon Receipt Extraction

### Overview

The Amazon Receipt Extraction Service in AIForged uses **Amazon Textract**'s pre-trained receipt models to extract key-value pairs and line items from receipts. The service retrieves essential data commonly found on receipts—such as Subtotal, VAT, Total, Date, Receipt Number, Vendor Name, Shipping Address Recipient, and Purchase Orders. Individual line items are also extracted and presented in a structured format.

!!! info
    This service is ideal for automating expense tracking, financial reconciliation, and visualizing receipt data for business intelligence.

***

### Supported Content Types

* PDF
* JPEG
* PNG

!!! info
    If your content is in a different format, use the AIForged PDF Converter to generate a compatible file.

***

### Possible Use Cases

* Automatically extract and organize data from receipts for expense management.
* Visualize and analyze receipt data for financial reporting and audits.

***

### Service Setup

Follow these steps to add and configure the **Amazon Receipt Extraction Service** to your agent:

1. **Open the Agent View**\
   Navigate to the agent where you want to add the service.
2. **Add the Amazon Invoice Extraction Service**\
   Click the **Add Service** ![](../../assets/image%20%2842%29.png) button.
3. **Select Service Type**\
   Choose **Amazon Receipt Extraction Service** from the available service types.\
   ![](../../assets/image%20%2860%29.png)
4. **Configure the Service Wizard**\
   Open the Service Configuration Wizard.\
   ![](../../assets/image%20%2861%29.png)\
   or\
   ![](../../assets/image%20%2862%29.png)
   * **Step 1: General Settings**\
     Configure core settings.\
     &#xNAN;_&#x44;efault settings are sufficient for most use cases._\
     ![](../../assets/image%20%2863%29.png)
   * **Step 2: User Defined Categories**\
     Add any categories you wish to use for organizing your processed documents.\
     ![](../../assets/image%20%2864%29.png)
   * **Step 3: Analysis**\
     Upload some documents for analysis, select them and click on the **Analysis** ![](../../assets/image%20%28125%29.png) button to generate the applicable fields for your forms.\
     ![](../../assets/image%20%2865%29.png)
   * **Step 4: Verification**\
     Review, configure and verify any generated fields.\
     ![](../../assets/image%20%2866%29.png)

***

### Service Configuration Settings

Most users can proceed with the default settings. Advanced configuration is available for custom workflows.

***

### Add and Process Documents

To upload and process identity documents using the **Amazon Receipt Extraction Service**:

1. **Open Service**\
   In the **Amazon Receipt Extraction Service**, click the **Upload** ![](../../assets/image%20%2837%29.png) button or drag and drop files over the document grid.\
   ![](../../assets/image%20%2867%29.png)
2. **Select Category (Optional)**\
   If you know the category for the document, select it. Otherwise, select **No category**.
3. **Process Documents**\
   After uploading, select the documents to process and click on the **Process** ![](../../assets/image%20%2811%29%20%281%29%20%281%29.png) button.

!!! info
    **Tip:** For new services, process a small batch first to verify the results before scaling up.

***

### View Processed Documents

* Select **Outbox** in the usage filter in the **Amazon Receipt Extraction Service**.\
  ![](../../assets/image%20%2851%29.png)
* Open any processed document to view and verify the extracted results.

***

### Troubleshooting Tips

* **Missing or Incorrect Data?**
  * Ensure the uploaded receipts are clear and legible. Blurred or faded images may reduce extraction accuracy.
  * Confirm that the file type is supported (PDF, JPEG, PNG).
  * Some receipt layouts may not be fully supported; check if your receipt matches common formats.
* **Line Items Not Extracted?**
  * Make sure your receipts display line items in a standard table or itemized list format.
  * Handwritten or highly stylized receipts may affect extraction accuracy.
* **Upload or Processing Errors?**
  * Try re-uploading the document or using a different sample to rule out file-specific issues.
  * If errors persist, check your agent's service configuration or contact support for assistance.
* **Performance Issues?**
  * Processing large batches may take longer. Start with smaller batches to ensure service responsiveness.
 IgnoreCase Multiline IgnoreCase Multiline



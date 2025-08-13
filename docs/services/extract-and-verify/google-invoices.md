# Google Invoice Parser

### Overview

The **Google Invoice Parser Service** in AIForged uses pre-trained invoice models from **Google Document AI** to extract **key-value pairs** and line items from invoices. The service returns typical invoice fields—such as **Subtotal, VAT, Total,** and **Date**—as well as detailed line items, which are presented in a structured table format.

No custom training is required; the service utilizes robust, internal pre-built invoice models for fast and accurate extraction from invoice documents.

{% hint style="info" %}
This service is ideal for automating invoice data entry, streamlining financial reconciliation, and improving the accuracy and speed of business workflows that rely on invoice processing.
{% endhint %}

***

### Possible Use Cases

* Extracting invoice-related data for accounting or auditing.
* Capturing individual line items for ERP, payment processing, or expense management.
* Automating invoice intake and validation in digital workflows.

***

### Service Setup

Follow these steps to add and configure the **Google Invoice Parser Service** to your agent:

1. **Open the Agent View**\
   Navigate to the agent where you want to add the service.
2. **Add the Google Invoice Parser Service**\
   Click the **Add Service** ![](<(../../assets/image (15) (1) (1).png>) button in the command bar.\

3. **Select Service Type**\
   Choose **Google Invoice Parser Service** from the available service types.\
   ![](<(../../assets/image (14) (1) (1).png>)
4. **Configure the Service Wizard**\
   Open the Service Configuration Wizard.\
   ![](<(../../assets/image (16) (1) (1).png>)\
   or\
   ![](<(../../assets/image (17) (1) (1).png>)
   1. &#x20;**Step 1: General Settings**\
      Configure the core settings. \
      &#xNAN;_&#x44;efault settings are sufficient for most use cases._\
      ![](<(../../assets/image (18) (1) (1).png>)
   2. **Step 2: User Defined Categories**\
      Add any categories you wish to use for organizing your processed documents.\
      ![](<(../../assets/image (19) (1) (1).png>)
   3. **Step 3: Analysis**\
      Upload some documents for analysis, select them and click on the **Analysis** ![](<(../../assets/image (125).png>) button to generate the applicable fields for your forms.\
      ![](<(../../assets/image (20) (1) (1).png>)
   4. **Step 4: Verification**\
      Review and verify any documents that have been processed.&#x20;

***

### Service Configuration Settings

Most users can proceed with default settings. Advanced configuration is available for custom workflows.

***

### Add and Process Documents

To upload and process documents using the **Google Forms Parser**:

1. **Open Service**\
   In the **Google Forms Parser**, click the **Upload** ![](<(../../assets/image (8) (1) (1).png>) button or drag and drop files over the document grid.\
   ![](<(../../assets/image (9) (1) (1).png>)
2. **Select Category (Optional)**\
   If you know the category for the document, select it. Otherwise, select **No category**.
3. **Process Documents**\
   After uploading, select the documents to process and click on the **Process** ![](<(../../assets/image (10) (1) (1).png>) button.

{% hint style="info" %}
**Tip:** For new services, process a small batch first to verify the results before scaling up.
{% endhint %}

***

### View Processed Documents

* Select **Outbox** in the usage filter in the **Google Forms Parser**.\
  ![](<(../../assets/image (51).png>)
* Open any processed document to view and verify the extracted results.

***

### Troubleshooting Tips

* **Missing or Incorrect Data?**
  * Ensure invoices are clear and legible. Poor scans may reduce extraction accuracy.
  * Confirm that the file type is supported (PDF, JPEG, PNG, TIFF).
  * Some invoice layouts may not be fully supported; verify that your invoices follow standard formats.
* **Line Items Not Extracted?**
  * Ensure your invoices display line items in a standard table or itemized format.
  * Highly stylized, handwritten, or unusual invoice tables may impact extraction.
* **Upload or Processing Errors?**
  * Try re-uploading the document or use a different sample to rule out file-specific issues.
  * If errors persist, review your agent's configuration or contact support.
* **Performance Issues?**
  * Processing large batches may take longer. Start with smaller batches to ensure service responsiveness.

***

### Best Practices

* Use high-quality scans or digital invoices for optimal extraction.
* Regularly review and validate extracted data to improve downstream workflows.
* Organize your documents into categories to keep your processing structured and efficient.


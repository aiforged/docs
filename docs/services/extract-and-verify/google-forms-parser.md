# Google Forms Parser

### Overview

The **Google Forms Parser** service in AIForged extracts text and layout information as **Key-Value Pairs** from a wide range of document types. It supports both direct file uploads and processing of documents available via URL (in JSON format). This service is ideal for digitizing forms, extracting structured data, and automating workflows that rely on Google form-like layouts.

!!! info
    This service streamlines the extraction of structured data from scanned forms and digital documents, enabling fast, accurate automation for business processes and analytics.

***

### Supported Content Types

* PDF
* JPEG
* PNG
* TIFF

!!! info
    If your content is in a different format, use the AIForged PDF Converter to generate a compatible file.

***

### Possible Use Cases

* Digitize and extract key-value data from paper or digital forms.
* Automate business workflows that depend on form submissions.
* Integrate scanned form data into databases, CRM, or analytics tools.
* Pre-process documents for downstream classification or validation.

***

### Service Setup

Follow these steps to add and configure the **Google Forms Parser** to your agent:

1. **Open the Agent View**
   Navigate to the agent where you want to add the service.
2. **Add the Google Forms Parser Service**
   Click the **Add Service** ![](../../assets/image%20%281%29%20%281%29%20%281%29.png) button.
3. **Select Service Type**
   Choose **Google Forms Parser** from the available service types.
   ![](../../assets/image%20%2834%29.png)
4. **Configure the Service Wizard**
   Open the Service Configuration Wizard.
   ![](../../assets/image%20%282%29%20%281%29%20%281%29.png)
   or
   ![](../../assets/image%20%283%29%20%281%29%20%281%29.png)
   * **Step 1: General Settings**
     Configure the service name, description, and other core settings.
     &#xNAN;_&#x44;efault settings are sufficient for most use cases._
     ![](../../assets/image%20%284%29%20%281%29%20%281%29.png)
   * **Step 2: User Defined Categories**
     Add any categories you wish to use for organizing your processed documents.
     ![](../../assets/image%20%285%29%20%281%29%20%281%29.png)
   * **Step 3: Analysis**
     Upload some documents for analysis, select them and click on the **Analysis** ![](../../assets/image%20%28125%29.png) button to generate the applicable fields for your forms.
     ![](../../assets/image%20%286%29%20%281%29%20%281%29.png)
   * **Step 4: Verification**
     Review, configure, and verify any generated fields.
     ![](../../assets/image%20%287%29%20%281%29%20%281%29.png)

***

### Service Configuration Settings

Most users can proceed with default settings. Advanced configuration is available for custom workflows.

***

### Add and Process Documents

To upload and process documents using the **Google Forms Parser**:

1. **Open Service**
   In the **Google Forms Parser**, click the **Upload** ![](../../assets/image%20%288%29%20%281%29%20%281%29.png) button or drag and drop files over the document grid.
   ![](../../assets/image%20%289%29%20%281%29%20%281%29.png)
2. **Select Category (Optional)**
   If you know the category for the document, select it. Otherwise, select **No category**.
3. **Process Documents**
   After uploading, select the documents to process and click on the **Process** ![](../../assets/image%20%2810%29%20%281%29%20%281%29.png) button.

!!! info
    **Tip:** For new services, process a small batch first to verify the results before scaling up.

***

### View Processed Documents

* Select **Outbox** in the usage filter in the **Google Forms Parser**.
  ![](../../assets/image%20%2851%29.png)
* Open any processed document to view and verify the extracted results.

***

### Troubleshooting Tips

* **Missing or Incorrect Data?**
  * Ensure the uploaded forms are clear and legible. Blurred or faded scans may reduce extraction accuracy.
  * Confirm that the file type is supported (PDF, JPEG, PNG, TIFF).
  * Some form layouts may not be fully supported; check if your form matches standard Google Forms layouts.
* **Key-Value Pairs Not Extracted?**
  * Make sure your forms use recognizable labels and standard field positions.
  * Highly stylized or handwritten forms may affect extraction accuracy.
* **Upload or Processing Errors?**
  * Try re-uploading the document or using a different sample to rule out file-specific issues.
  * If errors persist, check your agent's service configuration or contact support for assistance.
* **Performance Issues?**
  * Processing large batches may take longer. Start with smaller batches to ensure service responsiveness.

***

### Best Practices

* Use high-quality, scanned forms with clear fields and labels.
* Regularly review and verify extracted data to fine-tune your categories and settings.
* Organize documents into categories for easier retrieval and downstream processing.
* Test with a variety of real-world form samples to ensure robust extraction.





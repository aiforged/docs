# Amazon Identity Documents Extraction

Overview

The Amazon Identity Documents Service in AIForged leverages pre-trained ID document models from Amazon's AnalyzeID API to extract key-value pairs from a variety of identity documents, such as passports, driver licenses, and other US Government-issued IDs. The service is designed to return standardized, reliable information—such as Name, Surname, ID Number, and Date of Birth—regardless of the document's source or format.

{% hint style="info" %}
**Note:** Key names are standardized within the AnalyzeID response. For example, a driver's license field labeled "LIC#" (license number) and a passport field labeled "Passport No" will both be returned as "Document ID" in the output, alongside the original label. This makes it easy to combine and compare data across different types of identity documents.
{% endhint %}

***

### Possible Use Cases

* Extracting identity data from passports, driver licenses, and other official documents for onboarding or compliance.
* Matching Name and Surname fields across multiple documents to verify an individual's identity.
* Automating data entry or validation for KYC (Know Your Customer) processes.

***

### Service Setup

Follow these steps to add and configure the **Amazon Identity Documents Service** to your agent:

1. **Open the Agent View**\
   Navigate to the agent where you want to add the service.
2. **Add the Amazon Identity Documents Service**\
   Click the **Add Service** ![](../../assets/image%20%2842%29.png) button.
3. **Select Service Type**\
   Choose **Amazon Identity Documents Service** from the available service types.\
   ![](../../assets/image%20%2843%29.png)
4. **Configure the Service Wizard**\
   Open the Service Configuration Wizard.\
   ![](../../assets/image%20%2844%29.png)\
   or\
   ![](../../assets/image%20%2845%29.png)
   * **Step 1: General Settings**\
     Configure core settings.\
     &#xNAN;_&#x44;efault settings are sufficient for most use cases._\
     ![](../../assets/image%20%2846%29.png)
   * **Step 2: User Defined Categories**\
     Add any categories you wish to use for organizing your processed documents.\
     ![](../../assets/image%20%2847%29.png)
   * **Step 3: Analysis**\
     Upload some documents for analysis, select them and click on the **Analysis** ![](../../assets/image%20%28125%29.png) button to generate the applicable fields for your forms.\
     ![](../../assets/image%20%2848%29.png)
   * **Step 4: Verification**\
     Review, configure and verify any generated fields.\
     ![](../../assets/image%20%2849%29.png)

***

### Service Configuration Settings

Most users can proceed with the default settings. Advanced configuration is available for custom workflows.

***

### Add and Process Documents

To upload and process identity documents using the Amazon Identity Documents Service:

1. **Open Service**\
   In the Amazon Identity Documents Service, click the **Upload** ![](../../assets/image%20%2837%29.png) button or drag and drop files over the document grid.\
   ![](../../assets/image%20%2850%29.png)
2. **Select Category (Optional)**\
   If you know the category for the document, select it. Otherwise, select **No category**.
3. **Process Documents**\
   After uploading, select the documents to process and click on the **Process** ![](../../assets/image%20%2813%29%20%281%29%20%281%29.png) button.

{% hint style="info" %}
**Tip:** For new services, process a small batch first to verify the results before scaling up.
{% endhint %}

***

### View Processed Documents

* Select **Outbox** in the usage filter in the Amazon Identity Documents Service.\
  ![](../../assets/image%20%2851%29.png)
* Open any processed document to view and verify the extracted results.

***

### Troubleshooting Tips

* **Unexpected or Missing Fields?**
  * Ensure uploaded documents are clear and legible; poor quality scans may reduce extraction accuracy.
  * Check that the document type is supported (e.g., passport, driver license, US government-issued ID).
  * Review the raw key-value pairs in the output for alternate field names.
* **Standardization Issues?**
  * Remember that the service returns both standardized key names and raw keys. Check both in your results.
  * If your workflow relies on a specific field name, use the standardized key for consistency.
* **Upload or Processing Errors?**
  * Confirm file types are supported (PDF, image formats).
  * Try re-uploading the document or processing a different sample to rule out file-specific issues.
  * If multiple errors occur, check your agent's service configuration or contact support for further assistance.
* **Performance Concerns?**
  * Large batches may take longer to process. Start with smaller batches to ensure service responsiveness.
 IgnoreCase Multiline IgnoreCase Multiline


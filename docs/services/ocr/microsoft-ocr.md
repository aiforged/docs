# Microsoft OCR

## Microsoft OCR

### Overview

The Microsoft OCR Service in AIForged uses Microsoft’s OCR (Azure AI Vision Read) to extract plain text from documents. It returns raw text without preserving layout or structure and stores the output in the document’s Result property for downstream processing, regex, analytics, or integration. Optionally, you can save lines and words for verification.

{% hint style="info" %}
Use this service when you need reliable plain text extraction from images or PDFs for downstream rules, search indexing, or analytics. For structured field and table extraction, consider Microsoft Document Intelligence.
{% endhint %}

***

### Permissions Required

Members must belong to one of the following AIForged user group roles to add and configure this service:

* Owner
* Administrator
* Developer

{% hint style="info" %}
Tip: Role membership is managed in Organisations > Roles. Assign members to roles to grant agent and service administration access.
{% endhint %}

***

### Supported Content Types

* PDF
* JPEG
* PNG
* TIFF

{% hint style="info" %}
If your content is in a different format, use the AIForged PDF Converter to generate a compatible file.
{% endhint %}

***

### Possible Use Cases

* Extract text from scans of receipts, invoices, and contracts.
* Run RegEx patterns on extracted text to detect keywords or structured data.
* Index documents for search and retrieval.
* Prepare training datasets by extracting plain text from mixed document sources.

***

### Service Setup

Follow these steps to add and configure the Microsoft OCR Service to your agent:

1. **Open the Agent View**\
   Navigate to the agent where you want to add the service.
2. **Add the Microsoft OCR Service**\
   Click the **Add Service** ![](<../../.gitbook/assets/image (129).png>) button.
3. **Select Service Type**\
   Choose **Microsoft OCR Service** from the available service types.\
   ![](<../../.gitbook/assets/image (256).png>)
4. **Configure the Service Wizard**
   1. Open the Service Configuration Wizard.
      1.

          <figure><img src="../../assets/image (258).png" alt=""><figcaption></figcaption></figure>
      2.

          <figure><img src="../../assets/image (262).png" alt=""><figcaption></figcaption></figure>
   2. **Step 1: General Settings**\
      Configure core OCR settings such as service name and description.\
      &#xNAN;_&#x44;efault settings are sufficient for most use cases._\
      ![](<../../.gitbook/assets/image (263).png>)
   3. **Step 2: Verification**\
      Verification is typically not required for plain text OCR unless paired with downstream validation.\


***

### Service Configuration Settings

Most users can proceed with default settings. Advanced configuration is available for custom workflows.

| Setting                 | Type     | Required? | Description                                                                   |
| ----------------------- | -------- | --------- | ----------------------------------------------------------------------------- |
| ArchivingStrategy       | Optional | No        | Number of days before documents are deleted.                                  |
| AccessKey               | Optional | No        | Override the Microsoft cloud access key (typically not required in AIForged). |
| BaseURL                 | Optional | No        | Override the Microsoft OCR endpoint (advanced; usually not required).         |
| BatchSize               | Hidden   | -         | Processing batch size.                                                        |
| CheckElectronic         | Optional | No        | If the document is electronic, extract text directly where possible.          |
| DocumentProcessedStatus | Optional | No        | Status applied after successful processing.                                   |
| Enabled                 | Hidden   | -         | Enable or disable the service.                                                |
| ExecuteBeforeProcess    | Optional | No        | If configured as a child service, execute before the parent service.          |
| ExecuteAfterProcess     | Optional | No        | If configured as a child service, execute after the parent service.           |
| IsVerification          | Optional | No        | Save OCR lines and words for human verification.                              |
| Language                | Optional | No        | Provide a language hint to improve recognition accuracy.                      |
| MinSize                 | Optional | No        | Minimum document size threshold to trigger OCR.                               |
| Password                | Optional | No        | Authentication/password handling; can be set per document using Custom Code.  |
| RemoveComments          | Optional | No        | Remove human comments/annotations before processing.                          |

{% hint style="info" %}
If unsure, keep defaults unless you have a specific processing or integration requirement.
{% endhint %}

***

### Known Limitations

* PDF/TIFF handling
  * Very large or long PDF/TIFF files may be processed asynchronously by the underlying provider and can take longer.
  * Password‑protected PDFs cannot be processed directly.
* Image constraints
  * Low-resolution, skewed, or noisy images reduce OCR accuracy.
  * Extremely large image dimensions can slow processing without improving quality.
* Languages and handwriting
  * Printed text is supported for many languages.
  * Handwriting support is available but accuracy varies by script and image quality; test representative samples.
  * Mixed multi-language pages may have variable results.
* Layout
  * This service returns raw text in the Result property (no preserved layout). Enable IsVerification to store lines and words when you need visual verification.

{% hint style="info" %}
Tip: Use the AIForged Custom Code utility as a pre-processor to set the password per document, so that AIForged can unlock documents before processing.
{% endhint %}

{% hint style="info" %}
Tip: For very large PDFs or TIFFs, consider chunking by page range to avoid hitting provider limits and to keep processing responsive. Use the AIForged Document Splitter for this task.
{% endhint %}

***

### Add and Process Documents

To upload and process documents using the Microsoft OCR Service:

1. **Open Service**\
   When you open the Microsoft OCR Service, you will be presented with the documents currently queued or processed in the **Inbox**.
2. **Upload Documents**\
   Click the **Upload** ![](<../../.gitbook/assets/image (13) (1).png>) button or drag and drop files over the document grid.\
   ![](<../../.gitbook/assets/image (264).png>)
3. **Select Category (Optional)**\
   If you know the category for the document, select it. Otherwise, select **No category**.
4. **Process Documents**\
   After uploading, select the documents to process and click **Process Checked**.

{% hint style="info" %}
Tip: For new services, process a small batch first to verify OCR accuracy before scaling up.
{% endhint %}

***

### View Processed Documents

* Use the usage filter to select **Outbox** in the Microsoft OCR Service.\
  ![](<../../.gitbook/assets/image (51).png>)
* Open any processed document to view the extracted text in the **Result** property.

***

### Troubleshooting Tips

* **Text Missing or Incorrect?**
  * Check scan quality and resolution (aim for 300 DPI), deskew images, and reduce noise.
  * Set the Language hint to match the document’s primary language.
  * Ensure the file type is supported (PDF, JPEG, PNG, TIFF).
* **Unexpected Characters or Symbols?**
  * Complex fonts or artifacts may confuse OCR. Increase contrast and remove marks/annotations where possible.
  * Consider using the AIForged PDF Converter to normalize tricky inputs.
* **Slow Performance?**
  * Large files or big batches may take longer—process smaller sets where possible.
  * Split very large PDFs/TIFFs into page ranges with the AIForged Document Splitter.
* **Upload or Processing Errors?**
  * Re-upload a clean copy to rule out file corruption.
  * If the PDF is password protected, use Custom Code pre-processing to provide the password.
  * Review service settings or contact support if errors persist.

***

### Best Practices

* Use high-quality scans or digital originals for best results; aim for 300 DPI with good contrast.
* Provide a Language hint when processing non‑English documents to improve recognition.
* Keep categories organized for easier filtering and downstream rules.
* Start with a representative sample batch to validate accuracy before scaling up.
* For field-level extraction, pair OCR with downstream rules or consider Microsoft Document Intelligence (Custom Layout) for structured output.

***

### Quick Start

Get results in minutes:

1. Add the service\
   Open your agent, click **Add Service**, and select **Microsoft OCR Service**.
2. Upload documents\
   Click **Upload** or drag and drop files onto the grid.
3. Process\
   Select the uploaded documents and click **Process Checked**.
4. Review\
   Switch the usage filter to **Outbox** and open a processed document to view text in the Result property.

{% hint style="info" %}
Tip: Begin with a small, representative batch to validate output and tune settings.
{% endhint %}

***

### FAQ

* **Does this preserve layout?**
  * No. The service returns plain text in the Result property. Enable IsVerification to store lines and words for visual review. For structured extraction, use Microsoft Document Intelligence.
* **Can I process handwriting?**
  * Handwriting is supported but accuracy varies by script and image quality. Test representative samples first.
* **Do I need Microsoft cloud credentials or regional setup?**
  * No. AIForged provides a unified access layer and manages provider accounts and regional routing on your behalf.
* **How do I process password‑protected PDFs?**
  * Use the AIForged Custom Code utility to set the password per document so AIForged can unlock files before processing.
* **What if my PDFs are very large?**
  * Split large PDFs/TIFFs by page range with the AIForged Document Splitter to keep processing responsive and avoid provider limits.


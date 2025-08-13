# Google Handwriting

## Google Handwriting

### Overview

The Google Handwriting Service in AIForged uses Google Cloud’s handwriting recognition to extract handwritten text from images and PDFs. Results are captured as structured elements—Areas, Paragraphs, and Words—for accurate localization, and a consolidated plain-text output is available in the document’s Result property for downstream processing.

{% hint style="info" %}
Use this service when you need to digitize handwritten notes, forms, or annotations and make them searchable or available for downstream rules and analytics.
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

* Extract handwritten notes, annotations, or signatures from forms and scanned pages.
* Digitize handwritten fields on legacy paper documents for search, indexing, and validation.
* Feed extracted handwriting into downstream verification, rules, or analytics pipelines.

***

### Service Setup

Follow these steps to add and configure the Google Handwriting service to your agent:

1. **Open the Agent View**\
   Navigate to the agent where you want to add the service.
2. **Add the Google Handwriting Service**\
   Click the **Add Service** ![](<../../.gitbook/assets/image (129).png>) button.\

3. **Select Service Type**\
   Choose **Google Handwriting Service** from the available service types.\
   ![](<../../.gitbook/assets/image (234).png>)
4. **Configure the Service Wizard**
   1. Open the Service Configuration Wizard.
      1.

          <figure><img src="../../assets/image%20%28255%29.png" alt=""><figcaption></figcaption></figure>
      2. ![](<../../.gitbook/assets/image (251).png>)\

   2. **Step 1: General Settings**\
      Configure the service name, description, and core settings.\
      &#xNAN;_&#x44;efault settings are sufficient for most use cases._\
      ![](<../../.gitbook/assets/image (240).png>)
   3. **Step 2: Verification**\
      Typically no verification is required for handwriting extraction unless you plan a human-in-the-loop review.\


***

### Service Configuration Settings

Most users can proceed with default settings. Advanced configuration is available for custom workflows.

| Setting                 | Type     | Required? | Description                                                                  |
| ----------------------- | -------- | --------- | ---------------------------------------------------------------------------- |
| ArchivingStrategy       | Optional | No        | Days before documents get deleted.                                           |
| AccessKey               | Optional | No        | Override the Google Cloud credentials (not typically needed in AIForged).    |
| BaseURL                 | Optional | No        | Override the Google Cloud endpoint (advanced; usually not required).         |
| BatchSize               | Hidden   | -         | Processing batch size.                                                       |
| DocumentProcessedStatus | Optional | No        | Status used to denote that a document has been processed.                    |
| Enabled                 | Hidden   | -         | Enable or disable the service.                                               |
| ExecuteBeforeProcess    | Optional | No        | If configured as a child service, execute before the parent service.         |
| ExecuteAfterProcess     | Optional | No        | If configured as a child service, execute after the parent service.          |
| IsVerification          | Optional | No        | Save detected lines/words for human verification.                            |
| Language                | Optional | No        | Provide a language hint to improve recognition accuracy.                     |
| MinSize                 | Optional | No        | Minimum document size threshold to trigger OCR.                              |
| Password                | Optional | No        | Authentication/password handling; can be set per document using Custom Code. |
| RemoveComments          | Optional | No        | Remove human comments/annotations before processing.                         |

{% hint style="info" %}
If unsure, keep defaults unless you have a specific processing or integration requirement.
{% endhint %}

***

### Known Limitations

* Handwriting quality sensitivity: cursive or stylized handwriting, faint strokes, and overlapping characters can reduce accuracy.
* Mixed print + handwriting on the same page may lead to variable results; provide a language hint where possible.
* Very small text, heavy skew, shadows, or strong noise can hinder recognition; consider pre-processing (deskew/denoise).
* Large PDFs or high-resolution images take longer to process; consider batching or splitting for throughput.
* Password-protected PDFs cannot be processed unless a password is provided.

{% hint style="info" %}
Tip: Use the AIForged Custom Code utility as a pre-processor to set the password per document, so that AIForged can unlock documents before processing.
{% endhint %}

{% hint style="info" %}
Tip: For very large PDFs or TIFFs, consider chunking by page range to avoid hitting provider limits and to keep processing responsive. Use the AIForged Document Splitter for this task.
{% endhint %}

***

### Add and Process Documents

To upload and process documents using the Google Handwriting service:

1. **Open Service**\
   When you open the Google Handwriting service, you will be presented with the documents currently queued or processed in the Inbox.
2. **Upload Documents**\
   Click the **Upload** ![](<../../.gitbook/assets/image (13) (1).png>) button or drag and drop files over the document grid.\
   ![](<../../.gitbook/assets/image (216).png>)
3. **Select Category (Optional)**\
   If you know the category for the document, select it. Otherwise, leave as **No selection**.
4. **Process Documents**\
   After uploading, select the documents to process and click **Process Checked**.

{% hint style="info" %}
**Tip:** For new services, process a small batch first to verify the results before scaling up.
{% endhint %}

***

### View Processed Documents

* Select **Outbox** in the usage filter in the Google Handwriting service.\
  ![](<../../.gitbook/assets/image (51).png>)
* Open any processed document to view and verify the extracted Areas, Paragraphs, Words, and the consolidated Result text.

***

### Troubleshooting Tips

* **Handwriting not recognized or incomplete?**
  * Improve scan quality (aim for 300 DPI), reduce noise, and deskew images.
  * Provide a Language hint for non-English handwriting.
  * Test with clearer samples to establish baseline accuracy.
* **Unexpected characters or word breaks?**
  * Highly stylized or cursive scripts can cause tokenization issues; try image pre-processing (contrast/denoise).
  * Consider segmenting dense pages into smaller regions before processing.
* **Slow performance on large files?**
  * Split large PDFs/TIFFs into smaller chunks to improve throughput and responsiveness.
* **Upload or processing errors?**
  * Re-upload a clean file to rule out corruption.
  * Unlock password-protected PDFs via Custom Code pre-processing.

***

### Best Practices

* Capture or scan at 300 DPI or higher; ensure good lighting and minimal shadows for photos.
* Use image pre-processing (deskew, denoise, enhance contrast) to improve recognition.
* Provide a Language hint when processing non-English handwriting.
* Keep categories organized for easier filtering and downstream rules.
* Pilot with representative samples before bulk processing.

***

### FAQ

* **Does this preserve layout?**
  * AIForged stores structured elements (Areas, Paragraphs, Words) for localization and provides a consolidated Result text for downstream use.
* **Can I process multi-page PDFs with handwriting?**
  * Yes. For very large documents, split by page ranges using the AIForged Document Splitter to improve responsiveness.
* **Do I need Google Cloud credentials or regional setup?**
  * No. AIForged provides a unified access layer and manages provider accounts and regions on your behalf.
* **How do I handle password-protected PDFs?**
  * Use the AIForged Custom Code utility to set the password per document so AIForged can unlock files before processing.
* **What languages are supported?**
  * Many languages are supported; accuracy varies by script and image quality. Provide a Language hint when possible and test with samples.

 IgnoreCase Multiline IgnoreCase Multiline

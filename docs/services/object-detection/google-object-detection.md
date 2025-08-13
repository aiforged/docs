# Google Object Detection

### Overview

**Google Object Detection** in AIForged leverages Google Vision to detect objects, faces, and landmarks within images and PDFs. The service analyzes images and returns metadata for each detected item—including object tags, facial features, and content moderation labels (such as Adult, Racy, Violence, or Medical, each with a confidence score). It can also assess emotions on detected faces (e.g., joy, sorrow, anger, surprise).

{% hint style="info" %}
Use Google Object Detection to enrich your workflows with deep visual insights—identify people, objects, settings, and potentially sensitive content for downstream automation or compliance.
{% endhint %}

***

### Supported Content Types

* Images (JPEG, PNG, BMP, GIF)
* PDF

{% hint style="info" %}
If you need to process other content types, use the AIForged PDF Converter utility to generate a compatible file.
{% endhint %}

***

### Possible Use Cases

* Detect faces and estimate the age or gender of people in images.
* Analyze emotions and attributes on detected faces.
* Identify the scene or setting (e.g., "Person," "Landscape," "Vehicle").
* Determine if an image contains offensive or restricted content.
* Count similar objects (e.g., cars, bottles).
* Enrich extracted image fields from Document Intelligence and other extraction services with object metadata.

***

### Service Setup

Follow these steps to add and configure the Google Object Detection service to your agent:

1. **Open the Agent View**\
   Navigate to the agent where you want to add the service.
2. **Add the Google Object Detection Service**\
   Click the **Add Service** ![](<../../.gitbook/assets/image (42).png>) button in the command bar.
3. **Select Service Type**\
   Choose **Google Object Detection Service** from the available service types.\
   ![](<../../.gitbook/assets/image (9).png>)
4. **Configure the Service Wizard**
   1. Open the Service Configuration Wizard.
   2. **Step 1: Service Config** \
      Configure the service settings as required.&#x20;
   3. **Step 2: Verification**\
      No verification required.

***

### Example Results

*   **Object Detection Example:**

    The object is identified as a "\*\*Person\*\*" and a list of \*\*Tag\*\* items is returned.
*   **Content Moderation Example:**

    The image is labeled with confidence scores for Adult, Racy, Violence, and Medical content (all "unlikely" in this case).
*   **Face Detection/Emotions Example:**

    The face is detected and emotions such as joy are scored (e.g., "Very Likely" for Joy).

***

### Service Configuration Settings

The **Google Object Detection Service** can be customized for your workflow. The following settings are available:

| Setting                 | Type     | Required? | Description                                                           |
| ----------------------- | -------- | --------- | --------------------------------------------------------------------- |
| ArchivingStrategy       | Optional | No        | Days before documents get deleted.                                    |
| AccessKey               | Optional | No        | Override the Google Cloud API key (not typically needed in AIForged). |
| BaseURL                 | Optional | No        | Override the Google Vision endpoint (advanced; usually not required). |
| BatchSize               | Hidden   | -         | Processing batch size.                                                |
| DocumentProcessedStatus | Optional | No        | Document status used to denote that a document has been processed.    |
| Enabled                 | Hidden   | -         | Enable or disable the service.                                        |
| ExecuteBeforeProcess    | Optional | No        | Run before the parent service (when used as a utility).               |
| ExecuteAfterProcess     | Optional | No        | Run after the parent service (when used as a utility).                |
| Language                | Optional | No        | Language hint (rarely required for object detection).                 |
| Password                | Optional | No        | Used for service authentication (can be set per document).            |
| RemoveComments          | Optional | No        | Remove human comments from documents before processing.               |

{% hint style="info" %}
Tip: Start with the default settings. Only adjust advanced options if needed for custom workflows or integrations.
{% endhint %}

***

### Add and Process Documents

To upload and process documents using the Google Object Detection service:

1. **Open Service**\
   When you open the service, you will see documents currently queued or processed in the **Inbox**.
2. **Upload Documents**\
   Click the **Upload** ![](<../../.gitbook/assets/image (37).png>) button or drag and drop files over the document grid.\
   ![](<../../.gitbook/assets/image (10).png>)
3. **Select Category (Optional)**\
   Select a category if desired; otherwise, select **No category**.
4. **Process Documents**\
   Select the uploaded documents and click **Process Checked**.

{% hint style="info" %}
Tip: For new services, process a small batch first to verify detection results before scaling up.
{% endhint %}

***

### View Processed Documents

* Select **Outbox** in the usage filter in the Google Object Detection Service.\
  ![](<../../.gitbook/assets/image (51).png>)
* Open any processed document to review detected objects, tags, emotions, and content moderation scores.

***

### Troubleshooting Tips

* **Missing detections or low accuracy?**
  * Use high-quality images (good lighting, sharp focus).
  * Add a language hint if processing images with text in non-English languages.
* **Unexpected content moderation results?**
  * Review images flagged as Adult, Racy, Violence, or Medical for accuracy.
  * Test with known clean and flagged examples to understand confidence thresholds.
* **Faces/emotions not detected?**
  * Ensure faces are large enough and clearly visible.
  * Test with a variety of sample images to calibrate expectations.
* **Upload or processing errors?**
  * Re-upload images, confirm supported formats, or try a different sample to rule out file-specific issues.
  * For large PDFs, consider splitting before upload.

***

### Best Practices

* Use high-resolution, well-lit images for best results.
* Organize outputs with categories for streamlined downstream routing.
* Combine with verification or classification steps to maximize workflow value.
* Pilot with a representative set of images before scaling to production.

***

### Quick Start

Get results in minutes:

1. Add the Google Object Detection service to your agent.
2. Upload images or PDFs.
3. Process and review detected tags, faces, emotions, and content moderation scores.
4. Use Outbox filtering to verify and route outputs as needed.

{% hint style="info" %}
Tip: Begin with a small test batch to confirm results, then expand as needed for your workflow.
{% endhint %}

***

### FAQ

* **Does Google Object Detection support multi-page PDFs?**
  * Yes. Images are extracted from each page and processed, but results may vary by page content.
* **Can I use Google Object Detection for compliance or moderation?**
  * Yes. Use Adult, Racy, Violence, and Medical flags to automate content filtering.
* **What objects, faces, or emotions can be detected?**
  * Detection covers a broad range of objects and facial attributes, but accuracy depends on image quality and clarity.
* **Do I need a Google Cloud account or API key?**
  * No. AIForged manages provider connections and authentication for you.
* **How do I improve results for specialized domains (e.g., manufacturing, healthcare)?**
  * Test with domain-specific images and consult AIForged support for advanced tuning or custom workflows.
 IgnoreCase Multiline IgnoreCase Multiline

# Microsoft Object Detection

### Overview

**Microsoft Object Detection** in AIForged leverages Azure Computer Vision to detect objects, faces, and landmarks within images. The service returns a rich set of metadata—including a list of detected object tags, facial features (with age and gender estimation), best-fit captions for the image context, and content moderation results (such as racy/offensive material detection).

You can configure this service as a standalone processor or as a verification service. As a verification service, it can be triggered by the AIForged rules engine to enrich or validate extracted values from another provider (e.g., calling object detection on an extracted image from Microsoft Document Intelligence).

!!! info
    Tip: Use as a verification service to automatically enrich or check image fields from extraction workflows, or as a standalone service for bulk image/object analysis.

***

### Supported Content Types

* Images (JPEG, PNG, BMP, GIF)
* PDF (images will be extracted from pages for processing)

!!! info
    If your content is in a different format, use the AIForged PDF Converter to generate a compatible file before object detection.

***

### Possible Use Cases

* Detect and count faces, estimate age and gender.
* Analyze images for emotions, scene or object tags, and best-fit captions.
* Determine if an image contains racy or offensive content.
* Count or classify similar objects (e.g., counting cars in a parking lot).
* Enrich extracted image fields from Document Intelligence with object or face metadata.

***

### Service Setup

Follow these steps to add and configure the Microsoft Object Detection service to your agent:

1. **Open the Agent View**
   Navigate to the agent where you want to add the service.
2. **Add the Microsoft Object Detection Service**
   Click the **Add Service** ![](../../assets/image%20%283%29.png) button.
3. **Select Service Type**
   Choose **Microsoft Object Detection Service** from the available service types.
   ![](../../assets/image%20%284%29.png)
4. **Configure the Service Wizard**
   1. Open the Service Configuration Wizard.
      1.

          ![](../../assets/image%20%285%29.png)
      2.

          ![](../../assets/image%20%286%29.png)
   2. **Step 1: General Settings** Configure the service settings.
      &#xNAN;_&#x44;efault settings are sufficient for most use cases._
      ![](../../assets/image%20%287%29.png)
   3. **Step 2: Verification** No verification required for basic detection.

***

### Example Results

*   **People Portrait Example:**

    The image is categorized as **"people\_portrait"** with the caption "a woman with blonde hair".
*   **Face Detection/Analysis:**

    Gender and estimated age are returned for detected faces.
*   **Content Moderation:**

    The image is flagged as not containing racy or offensive material.

***

### Service Configuration Settings

The Microsoft Object Detection Service is highly configurable. The following settings are available (your UI may show these grouped by wizard section):

| Setting                 | Type     | Required? | Description                                                                  |
| ----------------------- | -------- | --------- | ---------------------------------------------------------------------------- |
| ArchivingStrategy       | Optional | No        | Days before documents get deleted.                                           |
| AccessKey               | Optional | No        | Override the Access Key to the configured Microsoft cloud service.           |
| BaseURL                 | Optional | No        | Override the URL to the configured Microsoft cloud service.                  |
| BatchSize               | Hidden   | -         | Processing batch size.                                                       |
| DocumentProcessedStatus | Optional | No        | Status applied after object detection.                                       |
| Enabled                 | Hidden   | -         | Enable or disable the service.                                               |
| ExecuteBeforeProcess    | Optional | No        | If set as a child service, run before the parent service.                    |
| ExecuteAfterProcess     | Optional | No        | If set as a child service, run after the parent service.                     |
| Language                | Optional | No        | Language hint (rarely required for object detection).                        |
| Password                | Optional | No        | Used for service authentication. Can be set per document or via Custom Code. |
| RemoveComments          | Optional | No        | Remove human comments from a document before processing.                     |

!!! info
    Most users can proceed with default settings. Adjust only if needed for advanced scenarios or integration requirements.

***

### Add and Process Documents

To upload and process documents using the Microsoft Object Detection Service:

1. **Open Service**
   When you open the Microsoft Object Detection Service, you will be presented with the documents currently queued or processed in the Inbox.
2. **Upload Documents**
   Click the **Upload** ![](../../assets/image%20%2837%29.png) button or drag and drop files over the document grid.  
   ![](../../assets/image%20%288%29.png)
3. **Select Category (Optional)**
   If you know the category for the document, select it. Otherwise, select **No category**.
4. **Process Documents**
   After uploading, select the documents to process and click **Process Checked**.

!!! info
    Tip: For new services, process a small batch first to verify object detection results before scaling up.

***

### View Processed Documents

*   Select **Outbox** in the usage filter in the Microsoft Object Detection Service.&#x20;

    ![](../../assets/image%20%2851%29.png)
* Open any processed document to view and verify the detected objects, faces, tags, and captions.

***

### Troubleshooting Tips

* **Objects or faces not detected?**
  * Ensure images are clear, well-lit, and not too small or low-resolution.
  * Check that the image format is supported (see Supported Content Types).
* **Slow processing?**
  * Large images or PDFs with many pages may take longer to process.
  * Process smaller batches or split large PDFs if needed.
* **Results missing for certain classes?**
  * Not all object types, faces, or captions may be detected in all images—test with varied samples.
* **Upload or processing errors?**
  * Re-upload a clean file to rule out corruption.
  * If using PDFs, ensure images are extractable or convert to image format before upload.

***

### Best Practices

* Use high-quality, well-lit images for best detection results.
* If using as a verification service, configure the rules engine to call Microsoft Object Detection on specific extracted image fields.
* Regularly test with a representative set of images to monitor detection quality and ensure consistent tagging/captioning.
* For content moderation or compliance, review racy/offensive flags and log results for auditing.
* Use categories and Outbox filters to keep workflows organized.

***

### FAQ

* **Can I use Microsoft Object Detection as a verification service?**
  * Yes. Configure the rules engine to trigger object detection on extracted image fields for enrichment or validation.
* **Does the service support multi-page PDFs?**
  * Yes. Images are extracted from each page for processing, but results may vary by page content.
* **What metadata is returned?**
  * Tags, captions, detected faces (with age/gender), and content moderation flags.
* **How do I detect and count specific objects (e.g., cars)?**
  * Check the returned tags for object types; the count of repeated tags gives an object count.
* **What if my images are password-protected PDFs?**
  * Use the AIForged Custom Code utility to set the password per document so AIForged can unlock before processing.

 IgnoreCase Multiline IgnoreCase Multiline






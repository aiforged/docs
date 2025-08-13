# AIForged Image Splitter

### Overview

The AIForged Image Splitter is a utility service that splits multi-page documents into individual page images. For each page, the service creates a separate Outbox document that can be copied or moved to other services either manually or via the Copy/Move utility services. This enables page-level routing, OCR, QA, and targeted downstream workflows.

{% hint style="info" %}
Tip: Use the Image Splitter to generate per-page inputs for downstream services (e.g., OCR per page, page-level classification), or to create page-level artifacts for review and routing.
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

* PDF (including multi-page)
* TIFF (multi-page)
* JPEG
* PNG

{% hint style="info" %}
If your content is in a different format, use the AIForged PDF Converter to generate a compatible input before splitting.
{% endhint %}

***

### Possible Use Cases

* Create per-page images from a multi-page PDF for page-level OCR or validation workflows.
* Generate page thumbnails or visual previews for quick review.
* Prepare inputs for page-level routing, tagging, and rules-based processing.
* Separate very large documents into smaller, manageable page items for parallel downstream processing.

***

### Add as Utility (Pre-/Post-Processor)

Utility services are not configured as standalone services. Attach them to a parent service either from the parent’s service view or from the service flow configurator.

#### Option A: From Parent Service View

1. Open the parent service.
2. Click the Add Service dropdown and select Add Utility Service. \
   ![](<../../.gitbook/assets/image (288).png>)
3. Choose AIForged Image Splitter.
4. In the utility’s settings, specify when it should run:
   * Execute Before Process = Pre-processor
   * Execute After Process = Post-processor

#### Option B: From Service Flow Configurator

1. Open the parent service’s Service Flow Configurator.
2. Expand the Utility Service Types group.&#x20;
3. Drag the utility onto the parent service:
   * Drop to the left for Pre-processor.
   * Drop to the right for Post-processor.&#x20;
4. Save.

{% hint style="info" %}
Utilities run as part of the parent’s lifecycle. Use Execute Before Process or Execute After Process to control the timing. Avoid configuring utility services as standalone services.
{% endhint %}

{% hint style="info" %}
Tip: Attach Image Splitter as a pre-processor to generate page-level items before OCR or classification, or as a post-processor to branch page-level review after core processing.
{% endhint %}

***

### Service Configuration Settings

Most users can proceed with defaults. Common settings include:

* Enabled\
  Turn the service on or off.
* Execute On Trigger\
  Run automatically on key events (e.g., on document upload or update).
* Batch Size\
  Processing batch size per run (Auto Execution).
* Document Processed Status\
  Status applied after the split operation completes (e.g., Processed).
* Page Range (optional, if available)\
  Limit splitting to a specific page range for large documents.
* Output Image Format (optional, if available)\
  Choose the output image format for pages (e.g., JPEG/PNG/TIFF).
* Image Quality/DPI (optional, if available)\
  Set the desired DPI/quality for generated page images.
* Archiving Strategy\
  Days before documents get deleted (lifecycle management).
* Remove Comments\
  Remove human comments/annotations before processing.
* Password\
  Provide a password (via Custom Code per document) to unlock protected PDFs before splitting.

{% hint style="info" %}
Tip: Some options may vary by environment. If you don’t see a setting listed here, proceed with defaults or contact your administrator for guidance.
{% endhint %}

***

### Known Limitations

* Input structure
  * The splitter operates on page-based inputs (PDF/TIFF). Single-page images (JPEG/PNG) will produce one page output.
* Content transformation
  * Vector text layers in PDFs are rasterized into images during splitting; text layout is not preserved in page images.
* Password-protected PDFs
  * Protected PDFs cannot be split unless a password is provided.
* Very large documents
  * High page counts increase processing time and can impact throughput.

{% hint style="info" %}
Tip: Use the AIForged Custom Code utility as a pre-processor to set the password per document, so that AIForged can unlock documents before processing.
{% endhint %}

***

### Add and Process Documents

To split documents using the Image Splitter:

1. Open Service\
   When you open the Image Splitter, you will be presented with the documents currently queued or processed in the **Inbox**.
2. Upload or provide the source document\
   Click **Upload** ![](<../../.gitbook/assets/image (13) (1).png>) or drag and drop files onto the grid (multi-page PDF or multi-page TIFF).
3. Process\
   Select the documents to split and click **Process Checked**.
4. Review per-page outputs\
   Each page will appear as a separate Outbox document, ready for copy/move to downstream services.

{% hint style="info" %}
Tip: For very large documents, start with a smaller batch or page range to validate outputs before processing the entire file.
{% endhint %}

***

### View Processed Documents

* Select **Outbox** in the usage filter in the Image Splitter service.\
  ![](<../../.gitbook/assets/image (51).png>)
* Open any per-page Outbox document to review the page image and associated metadata.

***

### Troubleshooting Tips

* Missing per-page outputs
  * Confirm the source is multi-page (PDF/TIFF) and not a single-page image.
  * Ensure processing completed successfully and that Outbox creation is enabled.
* Poor image quality on pages
  * Use higher-resolution sources (aim for 300 DPI).
  * If available, increase output DPI/quality for the splitter.
* Large documents causing slow processing
  * Split by page range or process in smaller batches to keep the UI responsive.
* Password-protected PDFs
  * Provide the password via Custom Code pre-processing so AIForged can unlock the file before splitting.

***

### Best Practices

* Use high-resolution sources (300 DPI or higher) for reliable page images.
* For very large PDFs, use page ranges or batches to optimize throughput.
* Name and tag outputs consistently to simplify downstream routing (e.g., page numbering conventions).
* Pair the Image Splitter with Copy/Move utilities to automatically route per-page outputs to OCR, classification, or verification services.

***

### Quick Start

Get results in minutes:

1. Add the service\
   Open your agent, click **Add Service**, and select **Image Splitter**.
2. Upload a multi-page document\
   PDF or multi-page TIFF are recommended.
3. Process\
   Select the document and click **Process Checked**.
4. Review & route\
   Open **Outbox** and route per-page outputs to downstream services (Copy/Move utilities, OCR, etc.).

{% hint style="info" %}
Tip: Begin with a representative multi-page document to validate end-to-end flow before scaling up.
{% endhint %}

***

### FAQ

* Do I get an Outbox document per page?
  * Yes. Each page becomes a separate Outbox document for downstream processing.
* Can I choose the output image format?
  * If available in your environment, you can select an output format (e.g., JPEG/PNG/TIFF). Otherwise, the default is used.
* Can I split only a subset of pages?
  * If Page Range is exposed in your environment, you can target specific pages to reduce processing time.
* Does the splitter preserve the original PDF text layer?
  * No. Outputs are page images intended for downstream processing such as OCR.
* How do I handle password-protected PDFs?
  * Use the AIForged Custom Code utility to provide the password per document so AIForged can unlock files before splitting.
 IgnoreCase Multiline IgnoreCase Multiline

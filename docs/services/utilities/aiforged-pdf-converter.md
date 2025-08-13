# AIForged Pdf Converter

### Overview

The AIForged PDF Converter is a utility service that converts incoming files into standardized PDF outputs for consistent downstream processing. Use it to normalize mixed inputs (images, multi‑page TIFFs, and—where enabled—common Office formats) into PDFs, optionally flattening them to image‑only pages for predictable OCR and extraction results.

{% hint style="info" %}
Use the PDF Converter as a pre-processor to ensure every document entering your pipeline is a clean, consistent PDF—ideal for OCR, classification, and verification services.
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

* Images: JPEG, PNG, TIFF (including multi‑page TIFF)
* PDF: for normalization/flattening to image‑only if needed
* Office documents (DOCX, XLSX, PPTX) where enabled in your environment

{% hint style="info" %}
If your content is in a different format, you can route it through the PDF Converter first, then send the normalized PDF to downstream services. Availability of some conversions (e.g., Office formats) may depend on your environment.
{% endhint %}

***

### Possible Use Cases

* Normalize mixed intake (images, TIFFs, PDFs) into a clean, consistent PDF format.
* Flatten complex/electronic PDFs to image‑only for predictable OCR.
* Merge multiple images into a single PDF for easier storage and routing.
* Prepare documents for downstream services that expect PDF inputs.

***

### Add as Utility (Pre-/Post-Processor)

Utility services are not configured as standalone services. Attach them to a parent service either from the parent’s service view or from the service flow configurator.

#### Option A: From Parent Service View

1. Open the parent service.
2. Click the Add Service dropdown and select Utility Service.\
   ![](../../assets/image%20%28288%29.png)&#x20;
3. Choose the utility (e.g., AIForged PDF Converter).
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

***

### Service Configuration Settings

Most users can keep defaults. Common settings include:

* Enabled\
  Turn the service on or off.
* Execute On Trigger\
  Run automatically on relevant events (e.g., document upload/update) when attached to a parent service.
* Execute Before Process / Execute After Process\
  Control whether the conversion runs as a pre‑processor or post‑processor relative to the parent service.
* Document Processed Status\
  Status applied to the item after conversion (e.g., Processed).
* Force PDF Image\
  Flatten PDFs to image‑only pages (removes objects/layers/widgets) for consistent OCR downstream.
* Merge To PDF\
  Merge multiple images into a single PDF.
* Page Range (if available)\
  Convert only a subset of pages in very large inputs.
* Output Quality / DPI (if available)\
  Set the render quality for image‑based PDFs.
* Archiving Strategy\
  Days before documents are deleted (lifecycle management).
* Remove Comments\
  Remove human comments/annotations before downstream processing.
* Password\
  Provide a password (via Custom Code per document) to unlock protected PDFs before conversion.

{% hint style="info" %}
If OCR is required, pair the PDF Converter (pre‑processing) with Digitizer or an OCR service. Use Force PDF Image to standardize tricky PDFs for more reliable OCR.
{% endhint %}

***

### View Converted Outputs

* Converted PDFs appear as part of the parent service’s processing flow.
* After the parent completes, filter by Outbox to review normalized PDFs.\


***

### Known Limitations

* Password‑protected PDFs
  * Cannot be converted unless a password is provided.
* Interactive content and advanced PDF features
  * Interactive forms, embedded media, or complex layers may be flattened or lost when Force PDF Image is enabled.
* Very large or long inputs
  * High page counts and image‑heavy sources increase processing time; consider page ranges or splitting.
* Office format conversion (if applicable)
  * Availability and fidelity may depend on your environment; complex formatting can vary when converted.

{% hint style="info" %}
Use the AIForged Custom Code utility as a pre‑processor to set the password per document, so that AIForged can unlock documents before processing.
{% endhint %}

{% hint style="info" %}
For very large PDFs or TIFFs, consider chunking by page range to keep processing responsive. Use the AIForged Document Splitter for this task.
{% endhint %}

***

### Troubleshooting Tips

* Output looks blank or missing text
  * If the original was already an electronic PDF with a text layer, ensure Force PDF Image is set appropriately (on to flatten, off to preserve).
* Conversion failed on a protected PDF
  * Provide the password via Custom Code pre‑processing.
* Poor image quality after conversion
  * Increase output DPI/quality (if available) or start from higher‑resolution sources (aim for 300 DPI).
* Long processing times on large files
  * Convert by page ranges or split the document first, then process in smaller batches.
* Office files don’t convert as expected
  * Confirm your environment supports Office conversions; if not, export to PDF before ingestion.

***

### Best Practices

* Use PDF Converter as a pre‑processor to deliver consistent, predictable inputs to OCR and extraction services.
* Enable Force PDF Image for complex or artifact‑heavy PDFs to improve OCR consistency.
* Merge related images into a single PDF to keep cases/documents together for downstream routing.
* For large documents, convert in parts (page range) and use Document Splitter to manage throughput.
* Apply clear Document Processed Status values so downstream steps can detect completion reliably.

***

### FAQ

* Does the PDF Converter add a text layer?
  * No. It normalizes to PDF. To add a searchable text layer, pair with the AIForged Digitizer or an OCR service.
* Can I convert only certain pages?
  * Yes, if Page Range is available in your environment, target specific pages to save time.
* Will comments and forms be preserved?
  * If Force PDF Image is enabled, content is flattened to images; interactive elements and comments are not preserved.
* How do I handle password‑protected PDFs?
  * Use the AIForged Custom Code utility to set the password per document so AIForged can unlock files before processing.
* What should I do for extremely large PDFs or TIFFs?
  * Use the AIForged Document Splitter to chunk by page range for responsiveness and reliability.
 IgnoreCase Multiline IgnoreCase Multiline


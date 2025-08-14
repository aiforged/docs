# Tesseract OCR

### Overview

The Tesseract OCR Service in AIForged uses the open‑source Tesseract engine to extract plain text from images and PDFs. It returns raw text (no layout preservation) and stores the output in the document’s Result property for downstream rules, regex, analytics, or integration. Optionally, you can save lines and words for verification.

!!! info
    Use this service when you need fast, cost‑effective plain text extraction from scans or images. For structured fields and tables, consider a Document Intelligence service.

***

### Permissions Required

Members must belong to one of the following AIForged user group roles to add and configure this service:

* Owner
* Administrator
* Developer

!!! info
    Tip: Role membership is managed in Organisations > Roles. Assign members to roles to grant agent and service administration access.

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

* Extract text from scanned documents (receipts, invoices, contracts, letters).
* Run RegEx patterns on extracted text to detect and structure key information.
* Index documents for search and retrieval.
* Prepare datasets by standardizing OCR output for analytics and downstream processing.

***

### Service Setup

Follow these steps to add and configure the Tesseract OCR Service to your agent:

1. Open the Agent View
   Navigate to the agent where you want to add the service.
2. Add the Tesseract OCR Service
   Click the Add Service ![](../../assets/image%20%28129%29.png) button.
3. Select Service Type
   Choose Tesseract OCR Service from the available service types.
   ![](../../assets/image%20%28269%29.png)
4. Configure the Service Wizard
   1. Open the Service Configuration Wizard.
      1.

          ![](../../assets/image%20%28270%29.png)
      2.

          ![](../../assets/image%20%28271%29.png)
   2. Step 1: General Settings
      Configure core OCR settings such as service name and description.
      &#xNAN;_&#x44;efault settings are sufficient for most use cases._
      ![](../../assets/image%20%28272%29.png)
   3. Step 2: Verification
      Verification is typically not required for plain text OCR unless paired with downstream validation.


***

### Service Configuration Settings

Most users can proceed with default settings. Advanced configuration is available for custom workflows.

| Setting                 | Type     | Required? | Description                                                                                       |
| ----------------------- | -------- | --------- | ------------------------------------------------------------------------------------------------- |
| ArchivingStrategy       | Optional | No        | Number of days before documents are automatically deleted.                                        |
| BatchSize               | Hidden   | -         | Processing batch size.                                                                            |
| CheckElectronic         | Optional | No        | If a searchable text layer is detected, use it instead of OCR.                                    |
| DocumentProcessedStatus | Optional | No        | Status applied after successful processing.                                                       |
| Enabled                 | Hidden   | -         | Enable or disable the service.                                                                    |
| ExecuteBeforeProcess    | Optional | No        | If configured as a child service, execute before the parent service.                              |
| ExecuteAfterProcess     | Optional | No        | If configured as a child service, execute after the parent service.                               |
| IsVerification          | Optional | No        | Save OCR lines and words for human verification.                                                  |
| Language                | Optional | No        | Provide a language hint (e.g., eng, deu) to improve accuracy; multiple languages can be combined. |
| MinSize                 | Optional | No        | Minimum document size threshold to trigger OCR.                                                   |
| Password                | Optional | No        | Authentication/password handling; can be set per document using Custom Code.                      |
| RemoveComments          | Optional | No        | Remove human comments/annotations before processing.                                              |

!!! info
    If AccessKey or BaseURL fields appear in your environment, leave them empty. Tesseract in AIForged does not require provider keys or endpoints.

***

### Add and Process Documents

To upload and process documents using the Tesseract OCR Service:

1. Open Service
   When you open the Tesseract OCR Service, you will be presented with the documents currently queued or processed in the Inbox.
2. Upload Documents
   Click the Upload ![](../../assets/image%20%2813%29%20%281%29.png) button or drag and drop files over the document grid.
   ![](../../assets/image%20%28273%29.png)
3. Select Category (Optional)
   If you know the category for the document, select it. Otherwise, leave as No selection.
4. Process Documents
   After uploading, select the documents to process and click Process Checked.

!!! info
    Tip: For new services, process a small batch first to verify OCR results before scaling up.

***

### View Processed Documents

* Use the usage filter to select Outbox in the Tesseract OCR Service.
  ![](../../assets/image%20%2851%29.png)
* Open any processed document to view the extracted text in the Result property.

***

### Troubleshooting Tips

* Text missing or incorrect
  * Improve scan quality and resolution (aim for 300 DPI), deskew pages, and reduce noise.
  * Set the Language setting to match the document’s primary language (e.g., eng, fra).
  * Use the AIForged PDF Converter to normalize unusual inputs.
* Poor results on complex layouts
  * Tesseract produces plain text; complex multi-column layouts may not read in order.
  * If layout structure is critical, consider a Document Intelligence service.
* Slow performance on large files
  * Process in smaller batches and split very large PDFs/TIFFs into page ranges using the AIForged Document Splitter.
* Upload or processing errors
  * Re-upload a clean copy to rule out file corruption.
  * If the PDF is password protected, set the password via Custom Code pre‑processing so AIForged can unlock the file.
  * Review service settings and try again.

***

### Best Practices

* Scan at 300 DPI or higher with good contrast; avoid shadows and skew.
* Always set the correct Language (and additional languages if applicable) to improve recognition.
* Pre-process images when needed: deskew, denoise, and increase contrast before uploading.
* Use categories to keep processing organized and facilitate downstream rules.
* Start with a representative pilot batch to validate accuracy before large-scale runs.

***

### Known Limitations

* Handwriting: Tesseract is optimized for printed text. Handwriting accuracy is generally low; test representative samples before relying on results.
* Layout: Output is plain text; reading order may not reflect complex page layouts (columns, sidebars, rotated blocks).
* Image quality: Very small fonts, heavy noise, blur, or significant skew reduce accuracy. Curved or warped text is challenging.
* Languages: Accuracy depends on the selected language packs; choose the correct language(s) for best results.
* Password‑protected PDFs: Cannot be processed directly.

!!! info
    Tip: Use the AIForged Custom Code utility as a pre‑processor to set the password per document, so that AIForged can unlock documents before processing.

!!! info
    Tip: For very large PDFs or TIFFs, consider chunking by page range to avoid size limits and to keep processing responsive. Use the AIForged Document Splitter for this task.

 IgnoreCase Multiline IgnoreCase Multiline





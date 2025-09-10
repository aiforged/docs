# Microsoft Handwriting

### Overview

The Microsoft Handwriting Service in AIForged uses Microsoft’s OCR (Azure AI Vision Read) to extract handwritten text from documents. Detected handwriting is returned as structured elements by Line, each containing a list of Words, and a consolidated plain-text output is stored in the document’s Result property for downstream rules, analytics, or integration.

!!! info
    Use this service to digitize handwritten notes, annotations, or form entries and make them searchable or available for downstream validation and processing.

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

* Extract handwritten fields from forms and scanned pages for indexing and analytics.
* Digitize notes, annotations, and signatures for search and retrieval.
* Feed handwritten data into human-in-the-loop verification, business rules, or workflow pipelines.

***

### Service Setup

Follow these steps to add and configure the Microsoft Handwriting Service to your agent:

1. **Open the Agent View:**
    Navigate to the agent where you want to add the service.
2. **Add the Microsoft Handwriting Service:**
    Click the **Add Service** ![](../../assets/image%20%28129%29.png) button.
3. **Select Service Type:**
    Choose **Microsoft Handwriting Service** from the available service types.
    ![](../../assets/image%20%28265%29.png)
4. **Configure the Service Wizard**
    - Open the Service Configuration Wizard.
    - ![](../../assets/image%20%28266%29.png)
    - Or
    - ![](../../assets/image%20%28267%29.png)
   2. **Step 1: General Settings:**
         Configure the service name, description, and core settings.
         Default settings are sufficient for most use cases.

   3. **Step 2: Verification:**
         Typically no verification is required for handwriting extraction unless you plan a human-in-the-loop review.


***

### Service Configuration Settings

Most users can proceed with default settings. Advanced configuration is available for custom workflows.

| Setting                 | Type     | Required? | Description                                                                   |
| ----------------------- | -------- | --------- | ----------------------------------------------------------------------------- |
| ArchivingStrategy       | Optional | No        | Number of days before documents are deleted.                                  |
| AccessKey               | Optional | No        | Override the Microsoft cloud access key (typically not required in AIForged). |
| BaseURL                 | Optional | No        | Override the Microsoft OCR endpoint (advanced; usually not required).         |
| BatchSize               | Hidden   | -         | Processing batch size.                                                        |
| DocumentProcessedStatus | Optional | No        | Status applied after successful processing.                                   |
| Enabled                 | Hidden   | -         | Enable or disable the service.                                                |
| ExecuteBeforeProcess    | Optional | No        | If configured as a child service, execute before the parent service.          |
| ExecuteAfterProcess     | Optional | No        | If configured as a child service, execute after the parent service.           |
| IsVerification          | Optional | No        | Save lines and words for human verification.                                  |
| Language                | Optional | No        | Provide a language hint to improve recognition accuracy.                      |
| MinSize                 | Optional | No        | Minimum document size threshold to trigger OCR.                               |
| Password                | Optional | No        | Authentication/password handling; can be set per document using Custom Code.  |
| RemoveComments          | Optional | No        | Remove human comments/annotations before processing.                          |

!!! info
    If unsure, keep defaults unless you have a specific processing or integration requirement.

***

### Known Limitations

* PDF handling
    * Password‑protected PDFs cannot be processed directly.
* Image quality and layout
    * Low-resolution, skewed, or noisy images reduce handwriting recognition accuracy.
    * Highly stylized cursive or overlapping strokes may impact results.
* Languages and scripts
    * Handwriting support exists for many languages, but accuracy varies by script, print quality, and scan quality.
    * Mixed multi-language pages may yield variable results.
* Output structure
    * The consolidated text is available in Result; enable IsVerification if you also need per-line/word visualization.

!!! info
    Tip: Use the AIForged Custom Code utility as a pre-processor to set the password per document, so that AIForged can unlock documents before processing.

!!! info
    Tip: For very large PDFs or TIFFs, consider chunking by page range to keep processing responsive. Use the AIForged Document Splitter for this task.

***

### Add and Process Documents

To upload and process documents using the Microsoft Handwriting Service:

1. **Open Service:**
    When you open the **Microsoft Handwriting Service**, you will be presented with the documents currently queued or processed in the **Inbox**.
2. **Upload Documents:**
    Click the **Upload** ![](../../assets/image%20%2813%29%20%281%29.png) button or drag and drop files over the document grid.
    ![](../../assets/image%20%28268%29.png)
3. **Select Category (Optional):**
    If you know the category for the document, select it. Otherwise, leave as **No selection**.
4. **Process Documents:**
    After uploading, select the documents to process and click **Process Checked**.

!!! info
    Tip: For new services, process a small batch first to verify handwriting extraction before scaling up.

***

### View Processed Documents

* Use the usage filter to select **Outbox** in the Microsoft Handwriting Service.
    ![](../../assets/image%20%2851%29.png)
* Open any processed document to view the extracted text in the **Result** property and, if enabled, the per-line/word verification view.

***

### Troubleshooting Tips

* **Handwriting not recognized or incomplete?**
    * Improve scan quality (aim for 300 DPI), deskew pages, and reduce noise.
    * Provide a Language hint matching the document’s primary language.
* **Unexpected characters or word breaks?**
    * Highly stylized or cursive handwriting can cause tokenization issues; increase contrast and reduce artifacts before uploading.
* **Slow performance on large files?**
    * Split very large PDFs/TIFFs into smaller ranges using the AIForged Document Splitter.
    * Process in smaller batches to keep the UI responsive.
* **Upload or processing errors?**
    * Re-upload a clean copy to rule out file corruption.
    * If the PDF is password-protected, provide the password via Custom Code pre-processing.
    * Review service settings and try again.

***

### Best Practices

* Capture or scan at 300 DPI or higher with good contrast; avoid shadows and skew.
* Provide a Language hint when processing non‑English documents to improve recognition.
* Keep categories organized to simplify filtering and downstream rules.
* Validate results on a representative sample before processing at scale.
* Enable IsVerification if you need to review lines and words visually alongside the Result text.

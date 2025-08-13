# Document Intelligence

### Overview

The Microsoft Document Intelligence Service (formerly Microsoft Form Recognizer) in AIForged uses advanced AI to intelligently extract text, key-value pairs, tables, and layout data from your documents. Leveraging Microsoft’s Custom Layout technology, this service learns the structure of your forms, enabling the extraction of structured data—including complex field relationships—without requiring extensive data science expertise.

{% hint style="info" %}
Document Intelligence includes a built-in classifier. You define classifications (categories) in Step 2 of the service wizard, and these are used throughout the workflow to ensure accurate document routing and extraction.
{% endhint %}

{% hint style="info" %}
While Microsoft Form Recognizer is still available in AIForged, it has been marked for deprecation. It is strongly recommended to use **Document Intelligence** for all new solutions and migrations going forward.
{% endhint %}

***

### Possible Use Cases

* Extracting structured data from complex, custom forms (e.g., invoices, bank statements, proof of payment).
* Digitizing and automating manual data entry from paper or scanned documents.
* Supporting compliance, audits, and analytics by transforming unstructured documents into usable data.
* Integrating extracted data into workflows, databases, or third-party systems.

***

### Supported Content Types

* PDF
* Images (JPEG, PNG, TIFF, etc.)

{% hint style="info" %}
If your content is in a different format, use the AIForged PDF Converter to generate a compatible file.
{% endhint %}

***

### Service Setup

Follow these steps to add and configure the **Microsoft Document Intelligence (Custom Layout)** service to your agent:

1. **Open the Agent View**\
   Navigate to the agent where you want to add the service.
2. **Add the Document Intelligence Service**\
   Click the **Add Service** ![](<(../../assets/image (129).png>) button.
3. **Select Service Type**\
   Choose **Microsoft Document Intelligence** from the available service types.\
   ![](<(../../assets/image (126).png>)
4. **Configure the Service Wizard**\
   Open the Service Configuration Wizard.\
   ![](<(../../assets/image (141).png>)\
   or\
   ![](<(../../assets/image (142).png>)
   * **Step 1: Service**\
     Configure the core settings for your service.\
     &#xNAN;_&#x44;efault settings are sufficient for most use cases._\
     ![](<(../../assets/image (145).png>)
   * **Step 2: Categories**\
     Create document categories for your different types of documents. These are required for training and organization.\
     ![](<(../../assets/image (149).png>)
   * **Step 3: Workflow Reason Dataset**\
     Populate the dataset with reason codes and information used with Human-In-The-Loop Workflow Actions.\
     ![](<(../../assets/image (155).png>)
   * **Step 4: Analysis**\
     Upload documents for pre-training and analysis. Select the correct category for each document when uploading.\
     ![](<(../../assets/image (164).png>)
   * **Step 5: Labelling**\
     Start labelling fields on documents to train the extraction model.\
     ![](<(../../assets/image (166).png>)
   * **Step 6: Training**\
     Train the labelled documents.\
     ![](<(../../assets/image (167).png>)
   * **Step 7: Definition**\
     After successful training, a definition document will be created.\
     ![](<(../../assets/image (171).png>)
   * **Step 8: Verification**\
     Use this step to verify the keys/fields defined or extracted during training.\
     ![](<(../../assets/image (174).png>)

{% hint style="danger" %}
Be sure to assign the correct category to each document during upload in Step 4: Analysis. This is critical for accurate classification and model training.
{% endhint %}

***

### Field Labelling Workflow

Labelling is a crucial step for training the Document Intelligence extraction engine. Here’s how to label fields effectively:

1. **Open the Labelling Step**\
   Go to **Step 5: Labelling** in the wizard.\
   ![](<(../../assets/image (166).png>)
2.  **Select Document Category**\
    Use the filter to select the document category whose documents you want to label.

    > {% hint style="info" %}
    > Only documents that have already been analyzed in Step 4 will be available for labelling.
    > {% endhint %}
3. **Select a Document**\
   Choose a document from the list to begin labelling.\
   ![](<(../../assets/image (176).png>)
4. **Label Fields on the Document**
   * Select an existing label definition from the right panel, or create a new label by clicking the **+** ![](<(../../assets/image (179).png>) button.\
     ![](<(../../assets/image (178).png>)
   * Draw the label on the document by clicking and dragging over the relevant field.\
     ![](<(../../assets/image (182).png>)
   * Once labelled, it will automatically select the next available label definition. Press **Tab** to navigate through available labels.
   * Fields you label are highlighted in magenta; provider-generated fields are shaded green/yellow.\
     ![](<(../../assets/image (183).png>)
   * Label definitions with a green check mark have been successfully labelled on the document.
5. **Labelling Controls**
   * **Start Labelling:** Press **Ctrl+S** or click the **Start Labelling** ![](<(../../assets/image (186).png>) button.
   * **Stop Labelling:** Press **Esc**, **Ctrl+S**, or click the **Stop Labelling** ![](<(../../assets/image (189).png>) button.
   * **Resume Labelling:** While still on the same document, press **Ctrl+S** or click the **Continue Labelling** ![](<(../../assets/image (190).png>) button to continue where you left off.
6. **Copy & Paste Labels**
   * Copy all labels from a completely labelled document by clicking **Copy Labels to Clipboard** ![](<(../../assets/image (191).png>).
   * Paste labels onto a different document using **Paste Labels from Clipboard** ![](<(../../assets/image (193).png>).

<figure><img src="../../assets/image (197).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Well-labelled documents accelerate model training and improve extraction accuracy. Consistent labelling across documents is key!
{% endhint %}

***

### Service Configuration Settings

The **Microsoft Document Intelligence Service** provides flexible settings to tailor the service to your workflow. Common settings include:

| Setting                           | Description                                                                         |
| --------------------------------- | ----------------------------------------------------------------------------------- |
| Enabled                           | Enable or disable this service.                                                     |
| Password                          | For service authentication. Can be set per document or via custom code.             |
| Base URL                          | The URL to your Azure Document Intelligence service.                                |
| Execute On Trigger                | Define when to execute (e.g., on upload, update, or delete).                        |
| ArchivingStrategy                 | Number of days before documents are deleted.                                        |
| BatchSize                         | Number of documents processed per batch (usually hidden/advanced).                  |
| DocumentProcessedStatus           | Status label for processed documents.                                               |
| EnableSelectionMarks              | Save selection marks (checkboxes, etc.) detected by the API.                        |
| EnableTableDetection              | Save tables detected in the document.                                               |
| MatchHeadingLevenshteinConfidence | Use fuzzy matching for table headers, improving extraction from poor-quality scans. |
| MinimumColumnMatchCount           | Minimum column matches required for table mapping.                                  |
| MatchTablesWithSameColumnCount    | Match tables by column count when headers are not repeated.                         |
| RemoveComments                    | Remove human comments from the document.                                            |
| SaveOCRLayout                     | Save OCR layout, including lines and words.                                         |
| WorkflowAlgorithm                 | Assign workflow algorithms for document verification.                               |
| WorkflowDocument                  | Enable document workflow features.                                                  |
| WorkflowShred                     | Enable document shred workflow.                                                     |
| WorkflowGracePeriod               | Grace period before workflow escalation.                                            |

***

To upload and process documents using the **Google Forms Parser**:

1. **Open Service**\
   In the **Microsoft Document Intelligence Service**, click the **Upload** ![](<(../../assets/image (8) (1) (1).png>) button or drag and drop files over the document grid.\
   ![](<(../../assets/image (199).png>)
2. **Select Category (Optional)**\
   If you know the category for the document, select it. Otherwise, select **No category**.
3. **Process Documents**\
   After uploading, select the documents to process and click on the **Process** ![](<(../../assets/image (10) (1) (1).png>) button.

{% hint style="info" %}
**Tip:** For new services, process a small batch first to verify the results before scaling up.
{% endhint %}

***

### View Processed Documents

* Select **Outbox** in the usage filter in the **Microsoft Document Intelligence Service**.\
  ![](<(../../assets/image (51).png>)
* Open any processed document to view and verify the extracted results.

***

### Troubleshooting Tips

* **Missing or Incorrect Data?**
  * Ensure uploaded documents are clear and legible. Poor quality scans or images reduce extraction accuracy.
  * Confirm that the file type is supported (PDF, JPEG, PNG, TIFF, etc.).
  * Complex or highly stylized layouts may require more careful labelling and analysis.
* **Tables or Key-Value Pairs Not Extracted?**
  * Make sure tables and fields are clearly structured in your documents.
  * Use the labelling and analysis steps to improve model accuracy.
* **Upload or Processing Errors?**
  * Try re-uploading the document or using a different sample to rule out file-specific issues.
  * If errors persist, check your service settings or contact support.
* **Performance Issues?**
  * Large document batches may take longer to process. Start with smaller batches to ensure responsiveness.

***

### Best Practices

* Use high-quality scans or digital originals for best extraction results.
* Label and categorize documents accurately to improve model performance.
* Regularly review and update your definition documents as forms or layouts evolve.
* Migrate from Form Recognizer to Document Intelligence for ongoing support and access to the latest features.



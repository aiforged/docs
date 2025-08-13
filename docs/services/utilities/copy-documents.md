# Copy Documents

## Copy Documents Utility

### Overview

The Copy Documents utility in AIForged enables seamless, automated transfer of documents from one service to another within your agent’s workflow. It’s used as a pre-process or post-process utility, most often to "hand off" documents between processing steps (e.g., from OCR to classification). The utility supports filtering by file extension, document status, category, and usage, and can set/reset document metadata as needed.

{% hint style="info" %}
Tip: The Copy Documents utility is the default internal transport method when you configure flows in the service flow configurator. It keeps your pipeline modular and your document routing flexible.
{% endhint %}

***

### Permissions Required

Members must belong to one of the following AIForged user group roles to add and configure this utility:

* Owner
* Administrator
* Developer

{% hint style="info" %}
Tip: Role membership is managed in Organisations > Roles. Assign members to roles to grant agent and service administration access.
{% endhint %}

***

### Supported Content Types

* PDF
* Images (JPEG, PNG, TIFF)
* Office documents (if supported by downstream services)

{% hint style="info" %}
If you need to normalize formats, use the AIForged PDF Converter as a pre-processor before copying.
{% endhint %}

***

### Possible Use Cases

* Automatically move or copy files from an OCR service to a classifier, verifier, or exporter.
* Route only specific file types, categories, or statuses to different downstream services.
* Keep "Inbox" and "Outbox" stages clean and organized by resetting or mapping metadata as part of the copy process.
* Chain together complex multi-step workflows in a modular, maintainable way.

***

### Add as Utility (Pre-/Post-Processor)

Utility services are not configured as standalone services. Attach them to a parent service either from the parent’s service view or from the service flow configurator.

#### Option A: From Parent Service View

1. Open the parent service.
2. Click the Add Service dropdown and select Utility Service. \
   ![](<../../.gitbook/assets/image (288).png>)
3. Choose **Copy Documents**.
4. In the utility’s settings, specify when it should run:
   * Execute Before Process = Pre-processor
   * Execute After Process = Post-processor

#### Option B: From Service Flow Configurator

1. Open the parent service’s Service Flow Configurator.
2. Expand the Utility Service Types group.&#x20;
3. Drag the Copy Documents utility onto the parent service:
   * Drop to the left for Pre-processor.
   * Drop to the right for Post-processor.&#x20;
4. Save.

{% hint style="info" %}
Utilities run as part of the parent’s lifecycle. Use Execute Before Process or Execute After Process to control the timing. Avoid configuring utility services as standalone services.
{% endhint %}

***

### Service Configuration Settings

Most users can keep defaults, but the Copy Documents utility is highly configurable. Key settings include:

#### General

* **Enabled:** Turn the utility on or off.
* **Password:** Used for service authentication or can be set per document via Custom Code.
* **Service:** The target service to which documents will be copied (e.g., your classifier or downstream step).
* **Execute On Trigger:** Run this utility on document upload/update/delete events.

#### Auto Execution

* **Batch Size:** Documents to process per run.
* **Execute After Process:** Run after the parent service processes documents.
* **Execute Before Process:** Run before the parent service processes documents.

#### Processing

* **Document Processed Status:** Status applied to the copied document.
* **Status:** The target document status.
* **Source Status:** Source document status filter.
* **Force Pdf Image:** Convert to image-only PDF before copying (optional).
* **Source Category:** Only copy documents in this category.
* **Source Ignore Categories:** Skip documents in these categories (separate multiple with `;` or `,`).
* **Source Usage:** Only copy documents from this usage folder (e.g., Outbox).
* **Source Extension:** Filter by file extension (supports RegEx).
* **Source Pattern:** Filter by filename pattern (supports RegEx).

#### Advanced

* **Archiving Strategy:** Days before copied documents are deleted.
* **Remove Comments:** Remove human comments from documents before copying.
* **Usage:** The usage folder for the copied document in the target service (e.g., Inbox).
* **Category:** The target category for the copied document.
* **Category Reset:** Clear the target category.
* **Result Reset:** Clear the target result.
* **Comment Reset:** Clear the target comment.
* **Check Before Copy:** Prevents duplicate copying of the same file.

{% hint style="info" %}
Tip: If you’re unsure about a field, start with defaults and adjust after testing your pipeline.
{% endhint %}

***

### View Copied Outputs

* The copied documents will appear in the target service’s input folder (usually Inbox) or Outbox, depending on your configuration.
* Open the destination service to verify that the copied documents and their metadata appear as expected.

***

### Known Limitations

* **Cross-service compatibility:** Ensure the target service supports the file type and metadata of the copied documents.
* **Duplicate handling:** If "Check Before Copy" is disabled or filters overlap, you may create duplicates.
* **Performance:** Copying large batches or very large files may impact throughput—use batch sizing and scheduling to avoid bottlenecks.
* **Metadata mapping:** If categories, statuses, or usages are misconfigured, documents may not route as intended.

{% hint style="info" %}
Tip: Use explicit filters (extensions, status, patterns) and enable Check Before Copy to avoid unwanted duplicates.
{% endhint %}

***

### Troubleshooting Tips

* **Nothing appears in the target service?**
  * Check filters (Source Extension, Source Category, Status) and ensure matching documents exist.
  * Confirm the correct target service is selected and available.
  * Ensure Execute Before/After Process is set as required for your workflow.
* **Duplicates or unexpected copies?**
  * Enable Check Before Copy and review your filters to avoid overlap.
* **Permissions or access errors?**
  * Ensure your user role has permission for both source and target services.
* **Wrong metadata on copies?**
  * Review Category, Usage, and Status mapping in the utility settings.

***

### Best Practices

* Always specify Source Extension and Source Pattern filters to reduce accidental or duplicate copies.
* Use Category and Usage mapping to keep your workflow organized and downstream routing clear.
* Enable Check Before Copy for safety in all production flows.
* Reset or clear result/comment/category fields as needed to avoid inherited metadata confusion.
* Start with a test batch and scale up after validating your configuration.

***

### Quick Start

Get results in minutes:

1. Attach Copy Documents as a Utility to a parent service (Pre- or Post-Processor).
2. Configure:
   * Target Service (destination)
   * Source Extension and/or Pattern
   * Optional: Category, Status, and usage filters
   * Document Processed Status
3. Save and run a small test batch.
4. Review the target service to confirm documents were copied as expected.

{% hint style="info" %}
Tip: Start simple, then add advanced filters and mapping as your workflow grows.
{% endhint %}

***

### FAQ

* **Do I need to configure this as a standalone service?**
  * No. Copy Documents is a utility only—attach it to a parent service as a pre- or post-processor.
* **Can I copy to multiple destinations?**
  * One utility instance copies to one target. For multiple destinations, add additional utilities or use the Service Flow Configurator.
* **How do I prevent duplicates?**
  * Enable Check Before Copy and use clear filters.
* **What if the source folder has mixed file types?**
  * Use Source Extension and Pattern filters to copy only what you want.
* **How do I verify copy results?**
  * Check the destination service’s Inbox/Outbox and confirm copied files and expected metadata.

# Move Documents

### Overview

The **AIForged Move Documents utility** is designed to move documents from one service to another within your agent’s workflow—ensuring that only one copy of a document exists in the system at any given time. This is ideal for processes where you want to prevent duplication and maintain a clean, single-instance flow between services.

{% hint style="info" %}
Unlike the Copy Documents utility, Move Documents removes the document from the source service after moving it to the destination, streamlining your workflow and reducing clutter.
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
If you need to normalize file formats before moving, use the AIForged PDF Converter as a pre-processor utility.
{% endhint %}

***

### Possible Use Cases

* Ensure that each document only exists in one service at a time, eliminating accidental duplicates.
* Move only specific file types, categories, or statuses to the next step in your workflow.
* Enforce strict document lifecycle and compliance by always maintaining a single, authoritative copy.

***

### Add as Utility (Pre-/Post-Processor)

Utility services are not configured as standalone services. Attach them to a parent service either from the parent’s service view or from the service flow configurator.

#### Option A: From Parent Service View

1. Open the parent service.
2. Click the Add Service dropdown and select Utility Service. \
   ![](<(../../assets/image (288).png>)
3. Choose **Move Documents**.
4. In the utility’s settings, specify when it should run:
   * Execute Before Process = Pre-processor
   * Execute After Process = Post-processor

#### Option B: From Service Flow Configurator

1. Open the parent service’s Service Flow Configurator.
2. Expand the Utility Service Types group.&#x20;
3. Drag the Move Documents utility onto the parent service:
   * Drop to the left for Pre-processor.
   * Drop to the right for Post-processor.&#x20;
4. Save.

{% hint style="info" %}
Utilities run as part of the parent’s lifecycle. Use Execute Before Process or Execute After Process to control the timing. Avoid configuring utility services as standalone services.
{% endhint %}

***

### Service Configuration Settings

The Move Documents utility is highly configurable to fit your workflow needs. Below are the main settings, grouped by wizard section:

#### General

* **Enabled:** Enable or disable this utility.
* **Password:** Used for service authentication; can be set per document via Custom Code.
* **Service:** The target service to which documents will be moved.
* **Execute On Trigger:** Run this utility on document upload/update/delete events.

#### Auto Execution

* **Batch Size:** Number of documents to process per run.
* **Execute After Process:** Run after the parent service processes documents.
* **Execute Before Process:** Run before the parent service processes documents.

#### Processing

* **Document Processed Status:** Status applied to the document after moving.
* **Status:** The target document status in the destination service.
* **Source Status:** Move only documents with a specific source status.
* **Force PDF Image:** Convert to image-only PDF before moving (optional).
* **Source Category:** Only move documents in this category.
* **Source Usage:** Only move documents from this usage folder (e.g., Outbox).
* **Source Extension:** Filter by file extension (supports RegEx).
* **Source Pattern:** Filter by filename pattern (supports RegEx).

#### Advanced

* **Archiving Strategy:** Days before moved documents are deleted.
* **Remove Comments:** Remove human comments from documents before moving.
* **Usage:** The target usage folder for the document in the new service (e.g., Inbox).
* **Category:** The target category for the moved document.
* **Category Reset:** Clear the target category after moving.
* **Check Before Move:** Prevents moving a file more than once.

{% hint style="info" %}
Tip: Use Source Extension, Source Pattern, and Source Category filters to precisely control which documents are moved. Enable Check Before Move to avoid accidental duplicate moves.
{% endhint %}

***

### How the Move Differs from Copy

* **Move Documents**: Removes the document from the source after moving to the target; only one copy exists.
* **Copy Documents**: Leaves the original document in the source; multiple copies may exist in different services.

***

### View Moved Outputs

* The moved documents will appear in the destination service’s input folder (usually Inbox) or Outbox, based on your configuration.
* Documents will no longer be available in the source service after a successful move.

***

### Known Limitations

* **Permanent Move:** Once a document is moved, it is removed from the source service. This cannot be undone.
* **Cross-service compatibility:** Ensure the target service supports the file type and metadata.
* **Duplicate handling:** If "Check Before Move" is disabled or filters overlap, you may unintentionally move the same document multiple times.
* **Performance:** Moving large batches or very large files may impact throughput—use batch sizing and scheduling to avoid bottlenecks.

***

### Troubleshooting Tips

* **Document not found in source after moving?**
  * This is expected: Move Documents removes the document from the source after a successful move.
* **Nothing appears in the target service?**
  * Check all filters (status, extension, category, pattern) and the target service selection.
* **File moved multiple times?**
  * Enable "Check Before Move" and ensure filters do not overlap.
* **Permissions or access errors?**
  * Ensure your user role has permission for both source and target services.

***

### Best Practices

* Always use filters (Source Extension, Source Pattern, Category) to control movement and prevent accidental moves.
* Enable "Check Before Move" to avoid moving files more than once.
* Use as a post-processor after processing is complete, or as a pre-processor when beginning a new workflow stage.
* Test the move with a small batch before scaling up in production.

***

### Quick Start

1. Attach Move Documents as a Utility to a parent service (Pre- or Post-Processor).
2. Configure:
   * Target Service (destination)
   * Source Extension and/or Pattern
   * Optional: Category, Status, and usage filters
   * Document Processed Status
3. Save and run a small test batch.
4. Review the target service to confirm documents were moved and are no longer present in the source.

{% hint style="info" %}
Start simple, then refine your filters and mapping as your workflow evolves.
{% endhint %}

***

### FAQ

* **Does Move Documents make a copy?**
  * No. The document is removed from the source after moving to the destination.
* **Can I undo a move?**
  * No. Once a document is moved, it is permanently removed from the source.
* **Can I move only certain file types?**
  * Yes. Use Source Extension and Source Pattern filters.
* **How do I verify moves?**
  * Check the destination service’s Inbox/Outbox; the document will not be in the source.


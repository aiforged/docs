# UsageType

### Overview

The UsageType enum indicates why a document is stored (its intended purpose) within AIForged. Use it to route documents correctly (training, inbox/outbox, datasets, etc.).

Underlying type: int

***

### Quick usage

```csharp
// Set usage when moving/copying a document
module.CopyDocument(doc, targetServiceId, DocumentStatus.Queued, UsageType.Inbox);
await module.SaveChangesAsync();
```

***

### Member Reference

#### Definition

Value: 0

Description: A definition document. Each service uses definition docs for its own configuration or model artifacts.

When to use:

* Storing service-specific definitions or templates.

***

#### Training

Value: 1

Description: A training document uploaded by class.

When to use:

* Curating training sets; labeling and model improvement workflows.

***

#### Inbox

Value: 2

Description: A user-submitted document for classification or extraction.

When to use:

* Entry point for processing pipelines.

***

#### Outbox

Value: 3

Description: The results of classification or extraction.

When to use:

* Publishing processed outputs for downstream consumption.

***

#### Label

Value: 4

Description: A document that contains labeling information.

When to use:

* Ground-truth, annotations, or labeling metadata.

***

#### Dataset

Value: 10

Description: A document used to store dataset information.

When to use:

* Persisting dataset assets or exports for lookup/enrichment.

***

#### System

Value: 90

Description: A system document.

When to use:

* Internal platform artifacts; non-user content.

***

#### Sample

Value: 98

Description: A sample document used for showcasing.

When to use:

* Demos, examples, or preloaded showcase content.

***

#### Preview

Value: 99

Description: Preview image of a document (if applicable).

When to use:

* Thumbnails or UI previews without loading full content.

***

### Best Practices

* Choose Inbox for documents awaiting processing; transition to Outbox after successful processing.
* Keep Training separate from production flows to avoid accidental publication.
* Use Definition, Dataset, and System for non-end-user artifacts; avoid mixing with Inbox/Outbox.
* Set Preview for UI performance; keep original content under Image/related data types in DocumentData.
* Always persist changes after updating Usage (SaveChanges/SaveChangesAsync).

### FAQ

* Q: Can a document change UsageType over time?
  * A: Yes—e.g., Inbox → Outbox during processing; ensure transitions reflect your workflow.
* Q: Is UsageType tied to status?
  * A: They complement each other: UsageType explains purpose; DocumentStatus tracks lifecycle.


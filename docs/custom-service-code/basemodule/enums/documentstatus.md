# DocumentStatus

### Overview

The DocumentStatus enum indicates the current lifecycle state of a document in AIForged. Use it to drive routing, processing, verification, and archiving flows.

Underlying type: int

***

### Quick usage

```csharp
// Check a document's current status
if (doc.Status == DocumentStatus.Queued)
{
    // Route to processing queue
}

// Update status with traceable comment/result
module.SetDocumentStatus(doc, DocumentStatus.Processed, "Auto-processed", "All rules passed");
await module.SaveChangesAsync();
```

***

### Member Reference

#### None

Value: 0

Description: Default status.

When to use:

* Initial or unknown state handling.

***

#### Received

Value: 3

Description: The document was received into a folder and needs to be processed or trained.

When to use:

* Entry point after ingestion, before any analysis.

***

#### Analyzed

Value: 4

Description: The document was analyzed and custom labeling can be done.

When to use:

* After preliminary analysis; ready for labeling or further enrichment.

***

#### Trained

Value: 5

Description: The document was trained.

When to use:

* Mark training artifacts completed for this document.

***

#### Processing

Value: 8

Description: The document is busy being processed.

When to use:

* Mark as in-flight during an automated processing pipeline.

Tip:

* Use to prevent concurrent processing.

***

#### Verification

Value: 9

Description: The document requires human verification (pending).

When to use:

* Queue for HITL review when rules or confidence thresholds are unmet.

***

#### Processed

Value: 10

Description: The document was processed and results are published (all rules passed).

When to use:

* Terminal state for successful processing; safe for downstream consumption.

***

#### Queued

Value: 11

Description: The document is queued for processing.

When to use:

* Awaiting a worker or pipeline slot.

Tip:

* Pair with FIFO or priority queues as applicable.

***

#### Verifying

Value: 12

Description: The document is currently being verified (in-progress HITL).

When to use:

* While an agent/user is actively verifying to prevent duplicate assignment.

***

#### InterimProcessed

Value: 13

Description: The document was processed successfully and is awaiting further processing (e.g., Custom Code, external process).

When to use:

* Staged handoff between internal pipeline steps or external systems.

Tip:

* Useful when final publication depends on external callbacks.

***

#### InsufficientBalance

Value: 81

Description: The project’s balance is too low to perform a transaction; funding is required.

When to use:

* Halt processing and surface actionable alerts to admins/ops.

Tip:

* Add a descriptive comment with the failed transaction context for auditing.

***

#### Error

Value: 90

Description: An error occurred while processing the document.

When to use:

* Capture failure states and trigger retries/escalations as needed.

Tip:

* Include error details in Result/Comment for rapid diagnosis.

***

#### Archive

Value: 98

Description: Flag document for hard delete based on archiving strategy.

When to use:

* Mark for retention workflow; not immediately deleted.

Tip:

* Ensure retention policies and exports complete before moving to Deleted.

***

#### Deleted

Value: 99

Description: Soft delete in the database, pending hard delete.

When to use:

* Hide from active views but keep temporarily for recovery/audit window.

Tip:

* Avoid business logic on Deleted items; treat as non-actionable.

***

### Best Practices

* Use Queued → Processing → Processed as your core happy-path sequence.
* Use Verification/Verifying to gate and track HITL work; don’t skip to Processed until rules pass.
* Always include meaningful comments/results when setting Error or InsufficientBalance for faster triage.
* Prefer InterimProcessed when external systems must act before final Processed.
* Respect retention: Archive before Deleted to align with your compliance policy.

### FAQ

* Q: What’s the difference between Verification (9) and Verifying (12)?
  * A: Verification means verification is required (pending). Verifying means someone is currently working on it (in-progress).
* Q: Should I set Processed directly after analysis?
  * A: Only if all rules and thresholds are satisfied; otherwise route to Verification or InterimProcessed.
* Q: Can I skip Queued and go straight to Processing?
  * A: Yes, but Queued improves observability and scheduling in multi-worker setups.
 IgnoreCase Multiline IgnoreCase Multiline

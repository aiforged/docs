# WorkItemType

### Overview

The WorkItemType enum indicates the kind of entity a work item is linked to. Use it to route, visualize, and report on HITL tasks by their underlying target.

Underlying type: int

***

### Member Reference

#### None

Value: 0

Description: No linked entity specified.

When to use:

* Placeholder or default before the link is established.

***

#### Document

Value: 1

Description: Linked to a document.

When to use:

* Standard HITL tasks that act on an entire document (verify, classify, QA).

***

#### Shred

Value: 2

Description: Linked to a document parameter/field (shred).

When to use:

* Field-level verification or corrections (e.g., a specific label/value on the document).

***

#### DataSet

Value: 3

Description: Linked to a custom dataset.

When to use:

* Review or curate dataset records/values used for lookups and enrichment.

***

#### Support

Value: 4

Description: Linked to a support or operational task.

When to use:

* Non-document operational items (e.g., service configuration follow-ups, support tickets).

***

#### Error

Value: 99

Description: Represents an error-focused task.

When to use:

* Investigation or remediation of processing/verification errors.

***

### Quick usage

```csharp
// Create a verification work item for a document
module.CreateWorkItem(
    userId,
    WorkItemType.Document,
    WorkItemStatus.Created,
    WorkItemAction.Verify,
    WorkItemMethod.Random,
    TimeSpan.FromHours(24),
    serviceId: stpd.Id,
    documentId: doc.Id,
    shredId: null,
    defId: null,
    transactionId: null,
    verificationId: null,
    workItemId: null,
    info: "Please verify totals",
    comment: "Auto-created by rules"
);
await module.SaveChangesAsync();
```

***

### Best Practices

* Choose Document for whole-document tasks; use Shred for precise field-level actions.
* For dataset curation or QA, select DataSet to keep routing and reporting accurate.
* Reserve Support for operational follow-ups that aren’t tied directly to a specific document field.
* Use Error for clear triage workflows; pair with WorkItemStatus.Error and detailed comments for faster resolution.


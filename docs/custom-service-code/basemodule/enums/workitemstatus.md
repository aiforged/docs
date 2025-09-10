# WorkItemStatus

### Overview

The WorkItemStatus enum indicates the current lifecycle state of a Human-in-the-Loop (HITL) work item. Use it to drive routing, SLAs, dashboards, and audit trails for work items across teams.

Underlying type: `int`

***

### Quick usage

```csharp
// Example state progressions
if (wi.Status == WorkItemStatus.Transfer)
{
    wi.Status = WorkItemStatus.Received; // assignee accepts/opens the item
    wi.Open = DateTime.UtcNow;
}

if (actionSucceeded)
{
    // For verification-type tasks, mark as Verified; then close as Completed
    wi.Status = WorkItemStatus.Verified;
    wi.Status = WorkItemStatus.Completed;
    wi.Closed = DateTime.UtcNow;
}
else if (needsEscalation)
{
    wi.Status = WorkItemStatus.EscalateTx;
}

await module.SaveChangesAsync();
```

***

### Member Reference

#### None

Value: `0`

Description:  
No status specified.

When to use:

* Placeholder or initial state prior to workflow assignment.

***

#### Created

Value: `1`

Description:  
The work item has been created and is awaiting pickup/acceptance.

When to use:

* Immediately after creation before an assignee begins work.

***

#### Completed

Value: `2`

Description:  
The work item has been successfully completed and closed.

When to use:

* Terminal state after required actions are finished.

***

#### EscalateTx

Value: `3`

Description:  
Escalation transmitted (sent) to another queue, user, or team.

When to use:

* Outbound escalation scenarios (handoff initiated).

***

#### EscalateRx

Value: `4`

Description:  
Escalation received from another queue, user, or team.

When to use:

* Inbound escalation scenarios (handoff accepted).

***

#### Transfer

Value: `5`

Description:  
The work item is being transferred to a different user or team (non-escalation handover).

When to use:

* Reassignment without escalation semantics.

***

#### Received

Value: `6`

Description:  
The transfer assignee has received the work item (in-progress).

When to use:

* A new work item is created with this status when transferred from another user.

***

#### Verified

Value: `8`

Description:  
The item’s verification action has been completed successfully.

When to use:

* Verification-specific success before or alongside Completed.

!!! tip
    Many teams set Verified, then immediately set Completed to close the item.

***

#### RelatedVerified

Value: `9`

Description:  
Verification completed on related/linked items.

When to use:

* Parent/child or linked workflows where related items must be verified.

***

#### Rejected

Value: `10`

Description:  
The item was reviewed and rejected (did not meet requirements or failed validation).

When to use:

* Use for negative outcomes; follow with escalation or closure per policy.

***

#### Deleted

Value: `90`

Description:  
The work item has been soft-deleted.

When to use:

* Remove from active flows while retaining audit visibility until hard deletion.

***

#### DocumentDeleted

Value: `91`

Description:  
The underlying document was deleted; the work item is no longer actionable.

When to use:

* Propagate document deletion impact to dependent work items.

***

#### Error

Value: `99`

Description:  
An error occurred while processing the work item.

When to use:

* Failure state requiring retry, investigation, or escalation.

***

### Best Practices

* Typical happy path for verification tasks: `Created` → `Verified` → `Completed`.
* Distinguish escalation from transfer: use `EscalateTx`/`EscalateRx` for urgent or policy-driven handoffs; `Transfer` for routine reassignments.
* When marking `Verified`, also transition to Completed to close the loop unless additional actions remain.
* Log transitions to `Error` and `Rejected` with Info/Comment for rapid triage and auditability.
* Respect deletion semantics: `DocumentDeleted` implies the work item cannot proceed; handle gracefully in UIs and automations.
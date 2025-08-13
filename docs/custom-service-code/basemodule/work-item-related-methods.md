# Work Item Related Methods

### Overview

These methods help you select assignees, measure performance, and create Human-in-the-Loop (HITL) work items. All are accessed via the module object in your custom code.

***

### Method Reference

#### PickRandom

Signature: \
`IProjectUser PickRandom(List<IProjectUser> projectUsers, string excludeUserId)`

Description: Picks a random project user from the provided list, excluding the specified user ID if provided.

Usage:

```csharp
var verifiers = module.GetUsers(projectId, serviceId, groupId: null, type: null, roles: null, permissions: null);
var assignee = module.PickRandom(verifiers, excludeUserId: currentUserId);
if (assignee != null)
{
    logger.LogInformation("Picked random verifier: {userId}", assignee.UserId);
}
```

When to use:

* Simple, fair distribution when no performance routing is required.
* As a fallback when KPI or throughput data is unavailable.

Tip:

* Always guard against a null result if the filtered list is empty.

***

#### GetUserKpi

Signature: \
`object GetUserKpi(WorkItemType type, DateTime fromDate, DateTime toDate, string excludeUserId, WorkItemStatus status, WorkItemAction action)`\
`object GetUserKpi(int projectId, int groupId, WorkItemType type, DateTime fromDate, DateTime toDate, string excludeUserId, WorkItemStatus status, WorkItemAction action)`

Description: Returns KPI metrics for users over a time range, optionally scoped to a project/group, excluding a specific user.

Usage:

```csharp
var kpi = module.GetUserKpi(
    WorkItemType.Document,
    fromDate: DateTime.UtcNow.AddDays(-7),
    toDate: DateTime.UtcNow,
    excludeUserId: currentUserId,
    status: WorkItemStatus.Completed,
    action: WorkItemAction.Verify
);

// Example handling (shape may vary by deployment)
logger.LogInformation("User KPI: {summary}", kpi?.ToString());
```

When to use:

* Build data-driven assignment, leaderboards, or monitoring dashboards.

Tip:

* Align the time window and status/action filters with your SLA and routing rules.

***

#### GetHighThroughputUserId

Signature: \
`string GetHighThroughputUserId(DateTime fromDate, DateTime toDate, string excludeUserId, WorkItemType type, WorkItemAction action, WorkItemStatus status)`\
`string GetHighThroughputUserId(int projectId, int groupId, DateTime fromDate, DateTime toDate, string excludeUserId, WorkItemType type, WorkItemAction action, WorkItemStatus status)`\
`string GetHighThroughputUserId(string excludeUserId, WorkItemType type, WorkItemAction action, WorkItemStatus? status = null)`\
`string GetHighThroughputUserId(int projectId, int groupId, string excludeUserId, WorkItemType type, WorkItemAction action, WorkItemStatus? status = null)`

Description: Returns the user ID with the highest throughput for the given filters, optionally scoped to a project/group and/or date range.

Usage:

```csharp
var topUserId = module.GetHighThroughputUserId(
    DateTime.UtcNow.AddDays(-14),
    DateTime.UtcNow,
    excludeUserId: currentUserId,
    type: WorkItemType.Document,
    action: WorkItemAction.Verify,
    status: WorkItemStatus.Completed
);

if (!string.IsNullOrEmpty(topUserId))
{
    logger.LogInformation("High-throughput user: {userId}", topUserId);
}
```

When to use:

* Performance-based routing to power users handling higher volume efficiently.

Tip:

* Exclude the current user to reduce bias in self-assignment scenarios.

***

#### GetIdleUserId

Signature: \
`string GetIdleUserId(WorkItemType type, WorkItemAction action, DateTime fromDate, DateTime toDate, string excludeUserId, WorkItemStatus? status = null)`\
`string GetIdleUserId(int projectId, int groupId, WorkItemType type, WorkItemAction action, DateTime fromDate, DateTime toDate, string excludeUserId, WorkItemStatus? status = null)`\
`string GetIdleUserId(WorkItemType type, string excludeUserId, WorkItemAction action, WorkItemStatus? status = null)`\
`string GetIdleUserId(int projectId, int groupId, WorkItemType type, string excludeUserId, WorkItemAction action, WorkItemStatus? status = null)`

Description: Returns the user ID of an idle user based on recent activity and filters, optionally scoped to a project/group and/or date range.

Usage:

```csharp
var idleUserId = module.GetIdleUserId(
    WorkItemType.Document,
    WorkItemAction.Verify,
    fromDate: DateTime.UtcNow.AddHours(-8),
    toDate: DateTime.UtcNow,
    excludeUserId: currentUserId,
    status: WorkItemStatus.Created
);

if (!string.IsNullOrEmpty(idleUserId))
{
    logger.LogInformation("Idle user candidate: {userId}", idleUserId);
}
```

When to use:

* Balance workload by assigning to users with minimal recent activity.

Tip:

* Tune your time window to match expected shift patterns or business hours.

***

#### CreateWorkItem

Signature: \
`string CreateWorkItem(IProjectUser pu, WorkItemType type, WorkItemStatus status, WorkItemAction action, WorkItemMethod method, TimeSpan graceperiod, int? serviceId, int? documentId, int? shredId, int? defId, int? transactionId, int? verificationId, int? workItemId, string info, string comment, WorkItemReason? reason = null, int? reasonLookup = null, int? reasonRecord = null, string reasonCode = null, string reasonDescription = null, string reasonComment = null)`

Description: Creates a new work item for the specified user and context; returns the assigned user ID.

Usage:

```csharp
// Choose an assignee (example using idle routing)
var idleUserId = module.GetIdleUserId(WorkItemType.Document, currentUserId, WorkItemAction.Verify, status: null);
var candidates = module.GetUsers(projectId, serviceId, groupId: null, type: null, roles: null, permissions: null);
var assignee = candidates?.FirstOrDefault(u => u.UserId == idleUserId) ?? module.PickRandom(candidates, currentUserId);

if (assignee != null)
{
    var assignedUserId = module.CreateWorkItem(
        assignee,
        WorkItemType.Document,
        WorkItemStatus.Created,
        WorkItemAction.Verify,
        WorkItemMethod.Manual,
        graceperiod: TimeSpan.FromHours(24),
        serviceId: stpd.Id,
        documentId: doc.Id,
        shredId: null,
        defId: null,
        transactionId: null,
        verificationId: null,
        workItemId: null,
        info: "Document requires HITL verification.",
        comment: "Auto-routed by custom code",
        reason: null,
        reasonLookup: null,
        reasonRecord: null,
        reasonCode: null,
        reasonDescription: null,
        reasonComment: null
    );

    await module.SaveChangesAsync();
    logger.LogInformation("Created work item for {userId} on document {docId}", assignedUserId, doc.Id);
}
```

When to use:

* To create and route HITL tasks with clear SLA (grace period), context, and audit details.

Tip:

* Provide informative info/comment and reason fields to improve agent usability and auditability.

***

### Best Practices

* Use throughput- and idle-based assignment for balanced performance and fairness.
* Always exclude the current user where relevant to avoid self-assignment bias.
* Scope KPI/throughput/idle queries by project/group when multi-tenant or multi-team routing is needed.
* Set a meaningful grace period aligned to SLAs; monitor aging items for auto-escalation.
* Persist changes with SaveChanges/SaveChangesAsync after creating work items.
* Log assignment decisions (who, why, based on what metric) for audit trails.

### FAQ

* Q: Should I prefer GetHighThroughputUserId or GetIdleUserId for routing?
  * A: Use HighThroughput for speed/volume optimization; use Idle for fairness and reducing bottlenecks—many teams blend both.
* Q: How do I ensure only eligible users are considered?
  * A: Pre-filter with GetUsers by role/permissions/group, then apply throughput/idle selection.
* Q: What if no eligible user is found?
  * A: Fall back to PickRandom from a broader pool, or queue for auto-assignment when a user becomes available.

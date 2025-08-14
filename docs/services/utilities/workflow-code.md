# Workflow Code

### Overview

The Workflow Code Utility in AIForged extends Custom Code scripting with additional methods tailored for advanced workflow automation and Human-in-the-Loop (HITL) scenarios. Use it to dynamically assign, prioritize, or create verification work items, balance workloads, and build KPI-driven routing for users and roles.

!!! info
    Tip: Use Workflow Code Utility for smart, data-driven distribution of verification tasks and to automate escalations or prioritization based on user activity and performance.

***

### Permissions Required

Members must belong to one of the following AIForged user group roles to add and configure this utility:

* Owner
* Administrator
* Developer

!!! info
    Tip: Role membership is managed in Organisations > Roles. Assign members to roles to grant agent and service administration access.

***

### Supported Content Types

* Any document or work item type handled by the parent service or HITL workflow.

***

### Possible Use Cases

* Automatically assign verification tasks to the most available or high-throughput users.
* Implement custom load balancing, escalation, or rotation for HITL work items.
* Drive workflow logic based on user performance, KPIs, or idle time.
* Automate work item creation based on verification outcomes or agent events.

***

### Add as Utility (Pre-/Post-Processor)

Utility services are not configured as standalone services. Attach them to a parent service either from the parent’s service view or from the service flow configurator.

#### Option A: From Parent Service View

1. Open the parent service.
2. Click the Add Service dropdown and select Utility Service.&#x20;
3. Choose **Workflow Code**.
4. In the utility’s settings, specify when it should run:
   * Execute Before Process = Pre-processor
   * Execute After Process = Post-processor
5. Save.

#### Option B: From Service Flow Configurator

1. Open the parent service’s Service Flow Configurator.
2. Expand the Utility Service Types group.&#x20;
3. Drag the Workflow Code utility onto the parent service:
   * Drop to the left for Pre-processor.
   * Drop to the right for Post-processor.&#x20;
4. Save.

!!! info
    Utilities run as part of the parent’s lifecycle. Use Execute Before Process or Execute After Process to control the timing. Avoid configuring utility services as standalone services.

***

### Service Configuration Settings

* **Language:** Choose from C#, Visual Basic, F#, IronPython, or SemanticKernel (natural language logic).
* **Code Editor:** Write and save workflow automation scripts.
* **Assemblies:** Add references for advanced .NET libraries if needed.
* **Input Objects:** Access all BaseModule APIs plus extended workflow/HITL methods.
* **Logging:** Use the provided logger for auditing and troubleshooting.
* **Error Handling:** Always use try/catch and log exceptions.

***

### Special Workflow & HITL Methods

Below are the core methods added or extended by the Workflow Code Utility. Use these to implement advanced user assignment and KPI-based routing in your HITL processes.

| Method Signature                                                                                                                                                                        | Description                                                                                         | Returns                          |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | -------------------------------- |
| **PickRandom**(List projectUsers, string excludeUserId)                                                                                                                                 | Gets a random user for verification work items, excluding the specified user if provided.           | The project user.                |
| **GetUserKpi**(WorkItemType type, DateTime fromDate, DateTime toDate, string excludeUserId, WorkItemStatus status, WorkItemAction action)                                               | Gets the KPI for a user over a given period and work item criteria.                                 | The KPI for a user.              |
| **GetUserKpi**(int projectId, int groupId, WorkItemType type, DateTime fromDate, DateTime toDate, string excludeUserId, WorkItemStatus status, WorkItemAction action)                   | Gets the KPI for a user in a specific agent/group context.                                          | The KPI for a user.              |
| **GetHighThroughputUserId**(...)                                                                                                                                                        | Gets the user(s) with the highest throughput for verification work items, based on various filters. | The user ID.                     |
| **GetIdleUserId**(...)                                                                                                                                                                  | Gets the user(s) with the least recent activity (idle) for assignment.                              | The user ID.                     |
| **CreateWorkItem**(IProjectUser pu, WorkItemType type, WorkItemStatus status, WorkItemAction action, WorkItemMethod method, TimeSpan graceperiod, int? serviceId, int? documentId, ...) | Creates a new work item for the specified user, with detailed context and workflow metadata.        | The work item object or user ID. |

_See your in-app API reference for full method signatures and overloads._

***

### Real-World Workflow Examples

#### 1. Random Verifier Assignment

```csharp
// Assume 'verifiers' is a List<IProjectUser> representing eligible HITL users
var verifier = module.PickRandom(verifiers, null);
if (verifier != null)
{
    var wi = module.CreateWorkItem(
        verifier.UserId, 
        WorkItemType.Document, 
        WorkItemStatus.Created, 
        WorkItemAction.Verify, 
        WorkItemMethod.Random, 
        TimeSpan.FromHours(24), 
        parentservice.Id, 
        doc.Id,
        null, null, null, null, null,
        "Verify this document.", doc.Comment
    );
    module.SaveChanges();
}
```

#### 2. KPI-Based Assignment

```csharp
// Assign to the user with highest throughput in past 7 days
var userId = module.GetHighThroughputUserId(
    DateTime.Now.AddDays(-7), DateTime.Now, null,
    WorkItemType.Document, WorkItemAction.Verify, WorkItemStatus.Created);

if (!string.IsNullOrEmpty(userId))
{
    var user = /* lookup user by userId */;
    // ...create work item as above...
}
```

#### 3. Idle User Fallback

```csharp
// If no high-throughput user, assign to the idle user
var idleUserId = module.GetIdleUserId(
    WorkItemType.Document, WorkItemAction.Verify, DateTime.Now.AddDays(-30), DateTime.Now, null);

if (!string.IsNullOrEmpty(idleUserId))
{
    var user = /* lookup user by idleUserId */;
    // ...create work item as above...
}
```

#### 4. Escalation Rule

```csharp
// Escalate to admin if verification not completed within SLA
if (kpi.AverageCompletionTime > TimeSpan.FromHours(24))
{
    var admin = /* lookup admin user */;
    module.CreateWorkItem(
        admin.UserId,
        WorkItemType.Document,
        WorkItemStatus.Escalated,
        WorkItemAction.Review,
        WorkItemMethod.Manual,
        TimeSpan.FromHours(12),
        parentservice.Id,
        doc.Id,
        // ...other fields...
        info: "Escalation: Verification overdue.",
        comment: doc.Comment
    );
    module.SaveChanges();
}
```

!!! info
    Tip: Use SaveChanges() after each assignment or escalation to ensure work items are committed promptly.

***

### Quick Start

Get started with smart work item assignment:

1. Attach the Workflow Code utility as a pre- or post-processor to your parent service (typically a verification or HITL stage).
2. Open the code editor and use workflow methods such as PickRandom, GetIdleUserId, or CreateWorkItem to implement your routing logic.
3. Save and test with a batch of work items.
4. Use logging to review the assignment decisions and adjust logic as needed.

!!! info
    Tip: Combine KPI-based user selection with fallback logic (e.g., random or idle user assignment) for robust, fair workload distribution.

***

### Known Limitations

* KPI and throughput calculations depend on accurate work item status tracking and historical data—ensure your workflow consistently updates statuses.
* Overloading a single user with too many assignments may reduce performance; use GetIdleUserId or other balancing strategies to distribute work.
* Custom code runs within the same security and resource sandbox as other utilities—avoid blocking or heavy computations.
* Always handle exceptions and log errors to avoid missed assignments or processing bottlenecks.

***

### Troubleshooting Tips

* **Work items not being assigned?**
  * Check your code logic and ensure user lists are populated and not filtered out by exclusion parameters.
  * Review logs for errors or unexpected conditions.
* **Assignment seems unbalanced?**
  * Use GetUserKpi or GetHighThroughputUserId to monitor actual workload distribution and tune your rules.
* **Errors or exceptions in assignment?**
  * Wrap your assignment logic in try/catch and log all exceptions and edge cases.

***

### Best Practices

* Regularly review work item statistics and user KPIs to ensure fair and efficient distribution.
* Combine multiple assignment strategies (random, idle, KPI-based) for optimal results.
* Use clear logging and comments in your scripts to aid future maintenance.
* Test your workflow code with representative batches and edge cases before production rollout.

***

### FAQ

* **Can I use Workflow Code Utility for non-HITL scenarios?**
  * Yes, but its greatest value is for advanced routing and assignment in verification/HITL-heavy workflows.
* **Can I assign work items to a specific user group?**
  * Yes, filter the user list by group or role before using PickRandom or assignment methods.
* **How do I avoid assigning work items to users who are on leave or inactive?**
  * Exclude user IDs using the `excludeUserId` parameter, or filter out users based on status from your user list.
* **Can I automate escalations or hand-offs?**
  * Yes, use CreateWorkItem with custom parameters and statuses to escalate tasks when needed.
* **How do I track assignment performance?**
  * Use GetUserKpi and GetHighThroughputUserId to monitor per-user throughput and adjust rules accordingly.



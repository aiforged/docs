# WorkItemMethod

### Overview

The WorkItemMethod enum determines how a work item is assigned to a user at creation time. Choose a method that aligns with your routing goals (fairness, performance, ownership, or explicit targeting).

Underlying type: `int`

***

### Member Reference

#### Random

Value: `0`

Description:  
Assign to a randomly selected eligible user.

When to use:

* Simple baseline distribution or fallback when no performance/idle signal is available.

***

#### HighThroughput

Value: `1`

Description:  
Assign to the user with the highest recent throughput under your selected filters.

When to use:

* Performance-first routing to maximize speed and volume.

***

#### Idle

Value: `2`

Description:  
Assign to a user with low or no recent activity.

When to use:

* Fairness-first routing to balance workload and reduce bottlenecks.

***

#### ProjectOwner

Value: `3`

Description:  
Assign to the owner of the agent associated with the work item.

When to use:

* Escalations, ownership reviews, or small teams where the owner triages tasks.

***

#### DocumentOwner

Value: `4`

Description:  
Assign to the owner of the document associated with the work item.

When to use:

* Creator accountability, domain expertise reviews, or document-specific workflows.

***

#### User

Value: `5`

Description:  
Assign to a specific, explicitly provided user.

When to use:

* Direct hand-offs, escalations to a named specialist, or manual overrides.

***

### Best Practices

* Align the method with your SLA: `HighThroughput` for speed, Idle for balance, ownership methods for accountability.
* Ensure target users exist and are enabled before assignment (especially `ProjectOwner`, `DocumentOwner`, and `User`).
* Exclude self-assignment when appropriate to avoid loops and maintain objectivity.
* Pair the assignment method with an appropriate grace period and clear Info/Comment to improve agent clarity and auditability.
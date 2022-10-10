---
description: <AIForged.API.WorkItem>
---

# Create Work Item

## About

Creates a work item of a document

### Display Name

Create Work Item

### Input

**Comment -** \<String> The work item message

**Context** - Requires a context for the connection to AIForged. Includes connection configuration information, user information and authentication information. This is a regular VB or C# expression.

**Document Id -** \<Int32> A List of unique document ID's to create a work item from

**Grace Period -** \<Timespan> A minimum amount of time before the work item is escalated

**Method -** \<AiForged.API.WorkItemMethod> The work item method

**Roles -** \<String> The user role that work will be assigned to&#x20;

**To Group Id -** \<Int32> The unique identifier of the group where this item should be assign to

**To User Id -** \<Int32> The unique identifier of the user where this item should be assign to

### Misc

**Private -** If not selected, the values of variables and arguments are at Verbose level.

**Result - <**Returns AIForged.API.WorkItem**>**&#x20;

## Activity Preview

### Activity View

![](<../../.gitbook/assets/image (1).png>)

### Activity Property View

![](../../.gitbook/assets/image.png)

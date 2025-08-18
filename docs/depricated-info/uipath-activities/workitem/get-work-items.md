# Get Work Items

## About

Creates a work item of a document

### Display Name

Create Work Item

### Input

**Comment -** \<String> The work item message

**Context** - Requires a context for the connection to AIForged. Includes connection configuration information, user information, and authentication information. This is a regular VB or C# expression.

**Document Id -** \<Int32> A List of unique document IDs to create a work item from

**End Date -** \<DateTime> Filter up to end date

**Page No -** \<Int32> FIlter by page number (only applicable when page size is set)

**Page Size -** \<Int32> The maximum number of results to be returned on a page (Enter page No, to display all results)

**ProjectId** - \<Int32>The unique identifier that was automatically assigned by AiForged to identify the specific project

**Shred Id -** \<Int32> Filter by a unique shred's ID

**Sort Direction -** \<AIForged.API.SortDirection> Sort Results in a specific direction

**Sort Field -** \<AIForged.API.SortField> Sort Result by specific field

**Start Date -** \<DateTime> Filter from a starting date

**Work Item Action -** \<AIForged.API.WorkItemAction> Filter by a work item action that the user should perform

**Work Item Status** - \<AIForged.API.WorkItemStatus>Filter by the work item status

**Work Item Type -** \<AIForged.API.WorkItemType>Filter By work item's type

### Misc

**Private -** If not selected, the values of variables and arguments are at Verbose level.

**Result**

##

## Activity Preview

### Activity View

![](../../../assets/image%20%2895%29%20%281%29%20%281%29.png)
### Activity Property View

![](../../../assets/image%20%2818%29%20%287%29.png)



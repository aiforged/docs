# SortDirection

### Overview

The SortDirection enum specifies the order (direction) in which query results should be returned.

Underlying type: `int`

***

### Quick usage

```csharp
// Example with a custom dataset
dataset.SortFieldDefId = customerNameFieldId;
dataset.SortDirection = dal.SortDirection.Ascending; // 0
dataset.PageNo = 1;
dataset.PageSize = 100;
```

***

### Member Reference

#### Ascending

Value: `0`

Description:  
Order values from low to high (A→Z, 0→9, earliest→latest).

When to use:

* Default ordering for names, IDs, and chronological sequences.

***

#### Descending

Value: `1`

Description:  
Order values from high to low (Z→A, 9→0, latest→earliest).

When to use:

* Show most recent or highest values first (e.g., latest records, top amounts).

***

### Best Practices

* Always set the sort field (e.g., `SortFieldDefId`) alongside `SortDirection` for deterministic results.
* Pair sorting with paging (`PageNo`, `PageSize`) to keep responses performant.
* Be mindful of string vs numeric sorting; ensure the field’s ValueType matches your intent.
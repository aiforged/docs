# .NET SDK — Client Reference: ParamDefClient

## Overview

Manage Parameter Definitions in AIForged. Use ParamDefClient to create, read, update, delete, elevate, and query hierarchies of Parameter Definitions (the definition objects for document parameters used to configure rules, validations, transformations, etc.).

!!! info "Scope - Operations include:"
    - Fetching specific definitions or their parent service.
    - Retrieving a full hierarchy for a service with optional filters.
    - Managing definition settings (create, get latest, get all, save).
    - Soft-deleting one or multiple definitions and elevating a definition to a parent level.
    - Obtaining usage counts for reporting and impact analysis.

## Prerequisites

1. Install the SDK.

    ```bash
    dotnet add package AIForged.SDK
    ```

1. Initialize SDK context and authenticate via API key.

    ```csharp
    using AIForged.API;

    var baseUrl = Environment.GetEnvironmentVariable("AIFORGED_BASE_URL") ?? "https://portal.aiforged.com";
    var apiKey  = Environment.GetEnvironmentVariable("AIFORGED_API_KEY")  ?? throw new Exception("AIFORGED_API_KEY not set.");

    var cfg = new Config { BaseUrl = baseUrl, Timeout = TimeSpan.FromMinutes(5) };
    await cfg.Init();
    cfg.HttpClient.DefaultRequestHeaders.Add("X-Api-Key", apiKey);

    var ctx = new Context(cfg);
    var paramDefs = ctx.ParamDefClient;
    ```

!!! note "Timestamps"
    All timestamps in AIForged (e.g., DTC, DTM) are UTC.

## Methods

### Get parameter definition by ID

```csharp
Task<PortalResponse<ParameterDefViewModel>> GetAsync(int? id);
Task<PortalResponse<ParameterDefViewModel>> GetAsync(int? id, CancellationToken cancellationToken);
```

```csharp
var resp = await ctx.ParamDefClient.GetAsync(1234);
var def  = resp.Result;
```

### Get parent service of a parameter definition

```csharp
Task<PortalResponse<ParameterDefViewModel>> GetParentServiceAsync(int? id);
Task<PortalResponse<ParameterDefViewModel>> GetParentServiceAsync(int? id, CancellationToken cancellationToken);
```

```csharp
var parentService = (await ctx.ParamDefClient.GetParentServiceAsync(def.Id)).Result;
```

### Get hierarchy of fields for a service (by project + service)

```csharp
Task<PortalResponse<ParameterDefViewModel>> GetHierachyAsync(
    int? projectId,
    int? stpdId,
    bool? includeCount,
    bool? includeSettings,
    bool? includeChildren,
    List<ParameterDefinitionCategory?> categories,
    List<GroupingType?> groupings,
    List<ValueType?> vts
);

Task<PortalResponse<ParameterDefViewModel>> GetHierachyAsync(
    int? projectId,
    int? stpdId,
    bool? includeCount,
    bool? includeSettings,
    bool? includeChildren,
    List<ParameterDefinitionCategory?> categories,
    List<GroupingType?> groupings,
    List<ValueType?> vts,
    CancellationToken cancellationToken
);
```

```csharp
var hierarchy = await ctx.ParamDefClient.GetHierachyAsync(
    projectId: 1001,
    stpdId: 2001,
    includeCount: true,
    includeSettings: true,
    includeChildren: true,
    categories: new List<ParameterDefinitionCategory?> { ParameterDefinitionCategory.Results, ParameterDefinitionCategory.Extraction },
    groupings: new List<GroupingType?> { GroupingType.Field, GroupingType.Table },
    vts: new List<ValueType?> { ValueType.String, ValueType.Number }
);
var root = hierarchy.Result;
```

!!! tip "Server-side filtering"
    Use the categories, groupings, and vts lists to limit the returned hierarchy to relevant nodes.

### Get usage count for a definition

```csharp
Task<PortalResponse<int>> GetUsageCountAsync(int? projectId, int? pdId);
Task<PortalResponse<int>> GetUsageCountAsync(int? projectId, int? pdId, CancellationToken cancellationToken);
```

```csharp
var usageCount = (await ctx.ParamDefClient.GetUsageCountAsync(projectId: 1001, pdId: def.Id)).Result;
```

### Create a new parameter definition

```csharp
Task<PortalResponse<ParameterDefViewModel>> CreateAsync(ParameterDefViewModel paramdef);
Task<PortalResponse<ParameterDefViewModel>> CreateAsync(ParameterDefViewModel paramdef, CancellationToken cancellationToken);
```

```csharp
var newDef = new ParameterDefViewModel
{
    ProjectId = 1001,
    ServiceTypeId = 2001,
    ParentId = null,
    Name = "InvoiceTotal",
    Label = "Invoice Total",
    Category = ParameterDefinitionCategory.Results,
    Grouping = GroupingType.Field,
    ValueType = ValueType.Currency,
    IsEnabled = true
};
var created = (await ctx.ParamDefClient.CreateAsync(newDef)).Result;
```

### Update a parameter definition

```csharp
Task<PortalResponse<ParameterDefViewModel>> UpdateAsync(ParameterDefViewModel paramdef);
Task<PortalResponse<ParameterDefViewModel>> UpdateAsync(ParameterDefViewModel paramdef, CancellationToken cancellationToken);
```

```csharp
created.Label = "Invoice Total Amount";
var updated = (await ctx.ParamDefClient.UpdateAsync(created)).Result;
```

### Delete a parameter definition (soft delete)

```csharp
Task<PortalResponse<ParameterDefViewModel>> DeleteAsync(int? paramdefid);
Task<PortalResponse<ParameterDefViewModel>> DeleteAsync(int? paramdefid, CancellationToken cancellationToken);
```

```csharp
var deleted = (await ctx.ParamDefClient.DeleteAsync(paramdefid: created.Id)).Result;
```

!!! warning "Soft delete"
    DeleteAsync performs a soft delete. Plan dependency cleanup and UI updates accordingly.

### Delete multiple definitions

```csharp
Task<PortalResponse<ObservableCollection<ParameterDefViewModel>>> DeleteMultiAsync(List<int> paramdefids);
Task<PortalResponse<ObservableCollection<ParameterDefViewModel>>> DeleteMultiAsync(List<int> paramdefids, CancellationToken cancellationToken);
```

```csharp
var removed = (await ctx.ParamDefClient.DeleteMultiAsync(new List<int> { 101, 102, 103 })).Result;
```

### Definition settings: get, get latest, get all

```csharp
Task<PortalResponse<ParameterDefSettingViewModel>> GetSettingAsync(int? id);
Task<PortalResponse<ParameterDefSettingViewModel>> GetSettingAsync(int? id, CancellationToken cancellationToken);

Task<PortalResponse<ParameterDefSettingViewModel>> GetLastSettingAsync(int? pdId, SettingType? type);
Task<PortalResponse<ParameterDefSettingViewModel>> GetLastSettingAsync(int? pdId, SettingType? type, CancellationToken cancellationToken);

Task<PortalResponse<ObservableCollection<ParameterDefSettingViewModel>>> GetSettingsAsync(int? pdId, SettingType? type);
Task<PortalResponse<ObservableCollection<ParameterDefSettingViewModel>>> GetSettingsAsync(int? pdId, SettingType? type, CancellationToken cancellationToken);
```

```csharp
var latestRule = (await ctx.ParamDefClient.GetLastSettingAsync(pdId: updated.Id, type: SettingType.Rule)).Result;
var allRuntime = (await ctx.ParamDefClient.GetSettingsAsync(pdId: updated.Id, type: SettingType.Runtime)).Result;
```

### Definition settings: save and create

```csharp
Task<PortalResponse<ParameterDefSettingViewModel>> SaveSettingAsync(string userId, ParameterDefSettingViewModel setting);
Task<PortalResponse<ParameterDefSettingViewModel>> SaveSettingAsync(string userId, ParameterDefSettingViewModel setting, CancellationToken cancellationToken);

Task<PortalResponse<ParameterDefSettingViewModel>> CreateSettingAsync(string userId, ParameterDefSettingViewModel setting);
Task<PortalResponse<ParameterDefSettingViewModel>> CreateSettingAsync(string userId, ParameterDefSettingViewModel setting, CancellationToken cancellationToken);
```

```csharp
var setting = new ParameterDefSettingViewModel
{
    ParameterDefId = updated.Id,
    Type = SettingType.Rule,
    Status = SettingStatus.Active,
    Comment = "Min and max value bounds",
    MinValue = "0",
    MaxValue = "100000",
    ValidateValuesAfter = true,
    AbortOnValidationError = true
};
var saved = (await ctx.ParamDefClient.CreateSettingAsync(userId: "user-123", setting: setting)).Result;
```

!!! tip "Latest vs. all settings"
    - Use GetLastSettingAsync for current/active configuration snapshots by type.
    - Use GetSettingsAsync for full history and auditing.

### Elevate a definition to parent level

```csharp
Task<PortalResponse<ParameterDefViewModel>> ElevateAsync(int? id);
Task<PortalResponse<ParameterDefViewModel>> ElevateAsync(int? id, CancellationToken cancellationToken);
```

```csharp
var elevated = (await ctx.ParamDefClient.ElevateAsync(updated.Id)).Result;
```

## Models

### ParameterDefViewModel

| Property | Type | Validation |
| --- | --- | --- |
| Id | int |  |
| ProjectId | int |  |
| ServiceTypeId | int |  |
| ServiceId | int? |  |
| ClassId | int? |  |
| ParentId | int? |  |
| Name | string |  |
| Label | string |  |
| Tags | string |  |
| Description | string |  |
| DTC | DateTime? |  |
| DTM | DateTime? |  |
| Status | ParameterDefinitionStatus |  |
| Category | ParameterDefinitionCategory? |  |
| Grouping | GroupingType? |  |
| ValueType | ValueType |  |
| ValueTypeName | string |  |
| DefaultValue | string |  |
| Required | RequiredOption |  |
| Index | int? |  |
| Info | string |  |
| Reference | string |  |
| Rating | float? |  |
| Availability | Availability? |  |
| Children | ObservableCollection<ParameterDefViewModel> |  |
| Settings | ObservableCollection<ParameterDefSettingViewModel> |  |
| TotalCharge | decimal? |  |
| UserCount | int |  |
| ParameterCount | int |  |
| DocumentCount | int |  |
| Validation | string |  |
| IsEnabled | bool |  |

### ParameterDefSettingViewModel

| Property | Type | Validation |
| --- | --- | --- |
| Id | int |  |
| ParameterDefId | int |  |
| Type | SettingType |  |
| Status | SettingStatus |  |
| DTC | DateTime |  |
| DTM | DateTime |  |
| Comment | string |  |
| Info | string |  |
| Data | string |  |
| MinValue | string |  |
| MaxValue | string |  |
| Confidence | float? |  |
| MinConfidence | float? |  |
| MaxConfidence | float? |  |
| IsCaseSensative | bool |  |
| Invert | bool |  |
| OneLine | bool |  |
| OneWord | bool |  |
| IsHandwriting | bool |  |
| Orientation | Orientation? |  |
| Marking | MarkingType? |  |
| Cells | int? |  |
| ClearBefore | OptionStatusFlags |  |
| ClearAfter | OptionStatusFlags |  |
| CleanupValuesBefore | bool |  |
| CleanupValuesAfter | bool |  |
| ValidateValuesBefore | bool |  |
| ValidateValuesAfter | bool |  |
| AbortOnValidationError | bool |  |
| IsReplacementCaseSensative | bool |  |
| CompileResults | string |  |
| MaxRetry | int |  |
| Timeout | TimeSpan? |  |
| UserId | string |  |

## Enums

### ParameterDefinitionStatus

| Value | Numeric Value |
| --- | --- |
| Default | 0 |
| Deleted | 99 |

### ParameterDefinitionCategory

| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Setting | 1 |
| Service | 2 |
| Statistics | 3 |
| Results | 4 |
| Dependency | 5 |
| Verification | 6 |
| DataSet | 7 |
| PreProcessor | 20 |
| Processor | 21 |
| PostProcessor | 22 |
| Extraction | 40 |

### GroupingType

| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Page | 1 |
| Cluster | 2 |
| Table | 3 |
| Row | 4 |
| Column | 5 |
| Paragraph | 7 |
| Line | 8 |
| Word | 9 |
| Array | 10 |
| Form | 11 |
| Field | 12 |
| Anchor | 13 |
| Unknown | 99 |

### ValueType

| Value | Numeric Value |
| --- | --- |
| None | 0 |
| String | 1 |
| Number | 2 |
| Currency | 3 |
| Boolean | 4 |
| DateTime | 5 |
| TimeSpan | 6 |
| Email | 7 |
| Enum | 8 |
| Picture | 9 |
| Password | 10 |
| SecureString | 11 |
| Address | 12 |
| IDNo | 13 |
| Country | 14 |
| Code | 15 |
| TelephoneNo | 17 |
| GPS | 18 |
| ServiceType | 19 |
| Service | 20 |
| Project | 21 |
| Data | 90 |
| DataSet | 91 |
| System | 98 |
| Unknown | 99 |

### RequiredOption (flags)

| Value | Numeric Value |
| --- | --- |
| Required | 1 |
| Optional | 2 |
| UseDefault | 4 |
| UseBestFit | 8 |
| Hidden | 16 |
| Utility | 32 |
| VerificationService | 64 |
| Trained | 128 |
| Conditional | 256 |
| DataSet | 512 |

### Availability

| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Private | 1 |
| Public | 2 |
| Marketplace | 3 |
| Inherit | 4 |
| Internal | 5 |
| Training | 6 |
| DataSet | 7 |
| Hidden | 9 |
| Readonly | 10 |
| Deleted | 99 |

### SettingType

| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Setting | 1 |
| Rule | 2 |
| Dependency | 3 |
| Template | 9 |
| Runtime | 10 |

### SettingStatus

| Value | Numeric Value |
| --- | --- |
| Active | 0 |
| Disabled | 1 |
| Deleted | 99 |

### Orientation

| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Horizontal | 1 |
| Vertical | 2 |
| VerticalReverse | 3 |

### MarkingType

| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Simple | 1 |
| Undelined | 2 |
| SimpleComb | 3 |
| TextInFrame | 4 |
| CombInFrame | 5 |
| PartitionedFrame | 6 |
| CharBox | 7 |
| GreyBox | 8 |

### OptionStatusFlags (flags)

| Value | Numeric Value |
| --- | --- |
| Required | 1 |
| Suspicious | 2 |
| DefaultUsed | 4 |
| Verified | 8 |
| Bypassed | 16 |
| Error | 32 |
| Done | 64 |
| Success | 128 |
| RangeProblem | 256 |
| IsValid | 512 |
| Warnings | 1024 |

## Examples

### Create, update, and fetch hierarchy

```csharp
// Create
var def = (await ctx.ParamDefClient.CreateAsync(new ParameterDefViewModel
{
    ProjectId = 1001,
    ServiceTypeId = 2001,
    ParentId = null,
    Name = "InvoiceNumber",
    Label = "Invoice Number",
    Category = ParameterDefinitionCategory.Extraction,
    Grouping = GroupingType.Field,
    ValueType = ValueType.String,
    IsEnabled = true
})).Result;

// Update
def.Tags = "invoices,identifier";
def.Validation = "regex:^[A-Z0-9-]{6,20}$";
def = (await ctx.ParamDefClient.UpdateAsync(def)).Result;

// Hierarchy
var tree = (await ctx.ParamDefClient.GetHierachyAsync(
    projectId: 1001,
    stpdId: 2001,
    includeCount: true,
    includeSettings: true,
    includeChildren: true,
    categories: new List<ParameterDefinitionCategory?> { ParameterDefinitionCategory.Extraction },
    groupings: new List<GroupingType?> { GroupingType.Field },
    vts: new List<ValueType?> { ValueType.String }
)).Result;
```

### Add a rule setting and get latest

```csharp
// Add a rule setting
var rule = new ParameterDefSettingViewModel
{
    ParameterDefId = def.Id,
    Type = SettingType.Rule,
    Status = SettingStatus.Active,
    Comment = "Require uppercase invoice IDs",
    ValidateValuesAfter = true,
    AbortOnValidationError = true
};
rule = (await ctx.ParamDefClient.CreateSettingAsync("user-123", rule)).Result;

// Get latest rule for this definition
var latest = (await ctx.ParamDefClient.GetLastSettingAsync(def.Id, SettingType.Rule)).Result;
```

## Troubleshooting

- 1. Access errors:
    - Ensure the API key is included in the X-Api-Key header and the BaseUrl is correct.
- 2. Empty hierarchies:
    - Relax filters (categories, groupings, vts) and verify stpdId/projectId are valid.
- 3. Settings not found:
    - Check pdId and ensure the expected SettingType has been created for that definition.
- 4. Soft delete side-effects:
    - Review dependencies (children, settings, usage) before deleting definitions.

# Module Data Types

### Overview

These data types are the building blocks returned to and consumed by Module methods. Use them to navigate documents, parameters (fields/labels), verifications, datasets, users, and work items in your custom code.

***

### Type Reference

#### IApplicationUser

Signature: IApplicationUser

Description: Represents an AIForged application user.

Key members (commonly used):

* Id : string
* UserName : string
* Email : string
* PhoneNumber : string
* FriendlyName : string (readonly)
* JobTitle : string
* FullName : string
* Configuration : string
* IsEnabled : bool
* IsLockedOut : bool (readonly)

Usage:

```csharp
var user = module.GetUserAsync("user-guid");
if (user?.IsEnabled == true)
{
    logger.LogInformation("User: {name}", user.FriendlyName ?? user.UserName);
}
```

When to use:

* When working with user identity outside of project-role context.

Tip:

* Use project-scoped user retrieval (e.g., GetUsers) when you need roles/permissions.

***

#### IClasses

Signature: IClasses

Description: Represents a document category (class) within a project.

Key members (commonly used):

* UserId : string
* ProjectId : int
* Description : string
* Comment : string
* DTC / DTM : DateTime
* Type : ClassType?
* Related : int?
* Id/Name via IEntityIdName

Usage:

```csharp
var cls = module.GetClass(1234);
logger.LogInformation("Class: {id}", cls?.ProjectId);
```

When to use:

* For classification-driven routing or rules per document category.

Tip:

* Retrieve classes by ID for reliability; names can evolve.

***

#### ICustomDataSet

Signature: ICustomDataSet

Description: Represents a custom dataset (schema + records) for lookups and enrichment.

Key members (commonly used):

* Data : List
* Definitions : List
* ProjectId : int
* ServiceId : int (StpdId is obsolete)
* KeyDef / KeyDefId
* IncludeData / IncludeVerifications : bool
* SearchField / SearchValue
* Paging/sorting: PageNo, PageSize, SortFieldDefId, SortDirection

Notable methods:

* CreateRecord(key), AddRecord(rec/key), DeleteRecord(key|id|rec)
* FindField(id|name), FindRecord(key|id|rec), FindRecord(fieldId, value)
* GetBestOption(value, getValue|fieldId|fieldDef)
* SetValue(rec, fieldId|name, value), SetValues(...)

Usage:

```csharp
var field = dataset.FindField("CustomerID");
var best = dataset.GetBestOption("acme ltd", fieldId: field.Id, ignoreCase: true);
```

When to use:

* Master/reference data lookups, deduplication, and enrichment.

Tip:

* Cache dataset and field lookups within a run for performance.

***

#### ICustomDataSetRecord

Signature: ICustomDataSetRecord

Description: Represents a single row in a custom dataset.

Key members (commonly used):

* KeyId : int
* KeyValue : string
* KeyDefId : int
* Values : List
* Availability : Availability?

Notable methods:

* GetValue(fieldId|fieldDef), SetValue(fieldId|fieldDef, value)
* FindValue(fieldId|fieldDef, value), AddValue(fieldId, value), Delete()

Usage:

```csharp
var rec = module.GetDataSetRecord(dataset, fieldId, key, true);
var cell = rec?.GetValue(fieldId);
```

When to use:

* Read/update a single dataset entry.

Tip:

* Use meaningful keys (e.g., business ID or GUID) for traceability.

***

#### ICustomDataSetValue

Signature: ICustomDataSetValue

Description: Represents a cell value within a dataset record.

Key members (commonly used):

* DefId : int
* Value : string
* Confidence : float?
* Status : VerificationStatus?
* Type : VerificationType?
* Provider : string
* Result : string
* VerificationId : int?
* Index / ParentId : int?
* DT : DateTime?
* Availability : Availability?

Usage:

```csharp
foreach (var v in record.Values)
    logger.LogInformation("Field {def} -> {val}", v.DefId, v.Value);
```

When to use:

* Inspect value provenance and confidence for compliance decisions.

Tip:

* Confidence and Status are useful for QA and auto-accept thresholds.

***

#### IDocument

Signature: IDocument

Description: Represents a document (file/image) and its workflow state.

Key members (commonly used):

* Id (via IEntityId), ProjectId (via IEntityProjectId)
* Filename / FileType / ContentType
* ServiceId : int
* ClassId : int?
* Status : DocumentStatus
* Usage : UsageType
* DTC / DTM : DateTime
* DocumentId : Guid?
* ExternalId : string
* MasterId : int?
* Result / ResultId / ResultIndex
* Comment : string
* Availability : Availability?
* Class : IClasses, Project : IProject

Usage:

```csharp
var master = module.GetDocumentMaster(doc);
module.SetDocumentStatus(doc, DocumentStatus.Processed, "Auto", "OK");
await module.SaveChangesAsync();
```

When to use:

* Any file-centric operation, including status transitions.

Tip:

* Always persist after state changes.

***

#### IDocumentData

Signature: IDocumentData

Description: Represents a data blob or metadata entry tied to a document (e.g., page image, OCR text).

Key members (commonly used):

* Type : DocumentDataType?
* Data : byte\[]
* Preview : byte\[]
* Text : string
* Info : string
* ContentType : string
* Index : int?
* Width / Height / Resolution : double?
* ResultId : string
* Availability : Availability?

Usage:

```csharp
var pages = module.GetDocumentData(doc, null);
var page1 = pages?.FirstOrDefault(p => p.Index == 0);
```

When to use:

* When you need bytes/text/content metadata for downstream processing.

Tip:

* Filter by type to reduce memory and processing overhead.

***

#### IDocumentParameter

Signature: IDocumentParameter

Description: Represents a field/label value on a document (supports parent-child and verifications).

Key members (commonly used):

* ParamDefId : int?
* ParentId : int?
* SourceId : int?
* Value : string
* Data : byte\[]
* Index : int?
* ColIndex/ColSpan/RowIndex/RowSpan : int?
* Availability : Availability?
* ParamDef : IParameterDef
* Children : List
* Verifications : List
* LastVerification : IVerification

Usage:

```csharp
var par = module.FindParameter(doc.Id, paramDefId, includeVerification: true);
if (par != null) { /* read/write par.Value */ }
```

When to use:

* Read/write field values; inspect verification history at field level.

Tip:

* Use GetParameters for repeated/indexed fields (tables/arrays).

***

#### IParameterDef

Signature: IParameterDef

Description: Represents a parameter (field/label/setting) definition and metadata.

Key members (commonly used):

* ServiceTypeId : int
* ServiceId : int?
* ClassId : int?
* ParentId : int?
* Label : string
* Description : string
* DTC / DTM : DateTime?
* Tags : string
* Status : ParameterDefinitionStatus
* Category : ParameterDefinitionCategory?
* Grouping : GroupingType?
* ValueType : DAL.ValueType
* ValueTypeName : string
* DefaultValue : string
* Required : RequiredOption
* Index : int?
* Info : string
* Reference : string
* Availability : Availability?
* Parent : IParameterDef

Usage:

```csharp
var def = module.FindParameterDef("InvoiceNumber", stpd.Id, null, null, null, null, null);
```

When to use:

* Resolve definitions before interacting with document parameters.

Tip:

* Cache definition IDs for frequently accessed fields.

***

#### IProject

Signature: IProject

Description: Represents a project/agent context.

Key members (commonly used):

* Id/Name via IEntityId and IEntityIdName
* UserId : string
* Status : ProjectStatus
* Description / Comment : string
* dtc / dtm : DateTime

Usage:

```csharp
var projectClasses = module.GetClasses(projectId);
```

When to use:

* For project-scoped queries and routing.

Tip:

* Always pass projectId where method overloads allow scoping.

***

#### IVerification

Signature: IVerification

Description: Represents a verification entry associated with a document parameter.

Key members (commonly used):

* ParameterId : int
* UserId : string
* Value : string
* DT : DateTime
* Confidence : float?
* SymbolsConfidence : string
* Type : VerificationType
* Status : VerificationStatus
* Result : string
* Info : string
* Box : string
* Data : byte\[]
* ServiceId / ServiceDocId : int?
* Provider : string
* SettingId / WorkItem / TransactionId : int?
* ReferenceDocId / ReferenceParamId / ReferenceDefId : int?

Usage:

```csharp
var v = module.FindVerification(parameter);
module.AddVerification(v, VerificationStatus.Verified, "Normalized", "By Custom Code");
await module.SaveChangesAsync();
```

When to use:

* Record decisions, system checks, and user actions for audit trails.

Tip:

* Filter verification history for targeted diagnostics and analytics.

***

#### IWorkItem

Signature: IWorkItem

Description: Represents a Human-in-the-Loop task to be actioned.

Key members (commonly used):

* ProjectId : int?
* UserId : string
* ServiceId / DocumentId / ShredId / DefId / VerificationId / TransactionId : int?
* WorkItemId : int? (parent)
* Type : WorkItemType
* Action : WorkItemAction
* Status : WorkItemStatus
* Method : WorkItemMethod?
* Info / Comment : string
* DTC / DTM / DueDate : DateTime
* Open / Closed : DateTime?
* Duration : TimeSpan?

Usage:

```csharp
// Create work item after selecting an assignee (userId)
```

When to use:

* Assign and track HITL activities with clear SLAs.

Tip:

* Log “who/why/when” for compliance and reporting.

***

### Best Practices

* Resolve parameter definitions by ID wherever possible; use names with filters only when necessary.
* Treat IDocumentParameter as the canonical interface for reading/writing document fields.
* Cache heavy lookups (datasets, definitions, users) inside a single run to reduce overhead.
* Always null-check objects returned by lookups and persist after state changes.

***

Important note and request for confirmation

* You mentioned IProjectUser no longer exists. Thank you for the heads-up. Several earlier method signatures (e.g., CreateWorkItem and PickRandom) referenced IProjectUser. What is the correct replacement type you want documented for assignee/selection—should we use a userId string, IApplicationUser, or a new interface (e.g., IProjectMember)? Once you confirm, I will:
  * Update those method pages to the correct signatures and usage.
  * Adjust this data types page accordingly (removing IProjectUser completely or adding the new type).


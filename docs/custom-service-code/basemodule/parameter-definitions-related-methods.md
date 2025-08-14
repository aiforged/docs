# Parameter Definitions Related Methods

### Overview

These methods let you find and work with Parameter Definitions (also known as field/label definitions) and service settings. Use them to locate definitions by ID or name, disambiguate by scope (parent, class, service), and retrieve settings for the current service context. All methods are accessed via the `module` object.

***

### Method Reference

#### FindParameterDef (by ID)

**Signature:**\
`FindParameterDef(int id) : IParameterDef`

**Description:**\
Returns a parameter definition (field/label/setting) by its unique ID.

**Usage:**

```csharp
var pd = module.FindParameterDef(12345);
if (pd != null)
{
    logger.LogInformation("ParamDef: {name} (Id: {id})", pd.Name, pd.Id);
}
```

**When to use:**\
When you already know the exact parameter definition ID and need to inspect or reuse it.

***

#### FindParameterDef (by name with optional filters)

**Signature:**\
`FindParameterDef(string name, int? parentId = null, int? classId = null, List<ParameterDefinitionCategory?> categories = null, List<GroupingType?> grouping = null, List<DAL.ValueType?> vtypes = null) : IParameterDef`

**Description:**\
Finds a parameter definition by name, with optional filters for parent, class, categories, grouping, and value types to disambiguate similarly named fields.

**Usage:**

```csharp
var pd = module.FindParameterDef(
    "InvoiceNumber",
    parentId: null,
    classId: null,
    categories: new List<ParameterDefinitionCategory?> { ParameterDefinitionCategory.Results },
    grouping: new List<GroupingType?> { GroupingType.Field },
    vtypes: new List<DAL.ValueType?> { DAL.ValueType.String }
);
```

**When to use:**\
When definitions share names across contexts and you need precision using filters.

***

#### FindParameterDef (by name within a service)

**Signature:**\
`FindParameterDef(string name, int stpdId, int? parentId = null, int? classId = null, List<ParameterDefinitionCategory?> categories = null, List<GroupingType?> grouping = null, List<DAL.ValueType?> vtypes = null) : IParameterDef`

**Description:**\
Finds a parameter definition by name scoped to a specific service definition (stpdId), with optional filters.

**Usage:**

```csharp
var pd = module.FindParameterDef(
    "Amount",
    stpdId: 1010,
    parentId: null,
    classId: null,
    categories: null,
    grouping: null,
    vtypes: new List<DAL.ValueType?> { DAL.ValueType.Currency }
);
```

**When to use:**\
When the same field exists in multiple services and you need the one for a specific service.

***

#### FindSetting (by name)

**Signature:**\
`FindSetting(string name) : IParameterDef`

**Description:**\
Finds a service setting by name in the current context.

**Usage:**

```csharp
var archiving = module.FindSetting("ArchivingStrategy");
if (archiving != null)
{
    logger.LogInformation("Found setting: {name}", archiving.Name);
}
```

**When to use:**\
To retrieve metadata for a specific service setting by name.

***

#### FindSetting (by service definition + parent)

**Signature:**\
`FindSetting(IParameterDef stpd, string name, int? parentId) : IParameterDef`

**Description:**\
Finds a setting by name within a specific service definition (stpd) and optional parent container.

**Usage:**

```csharp
var setting = module.FindSetting(serviceDef, "BaseURL", parentId: null);
```

**When to use:**\
When you need a setting in a particular service or nested container.

***

#### CopyDocument

**Signature:**\
`CopyDocument(IDocument doc, int stpdId, DocumentStatus status, UsageType usage, int? categoryId = null, bool? resetCategory = null) : IDocument`

**Description:**\
Copies a document into another service (target stpdId) with optional changes to status, usage, and category.

**Usage:**

```csharp
var copied = module.CopyDocument(doc, targetServiceId, DocumentStatus.Queued, UsageType.Inbox, categoryId: null, resetCategory: null);
module.SaveChanges();
```

**When to use:**\
For parallel processing or routing while keeping the original in place.

***

#### MoveDocument

**Signature:**\
`MoveDocument(IDocument doc, int stpdId, DocumentStatus status, UsageType usage, int? categoryId = null, bool? resetCategory = null) : IDocument`

**Description:**\
Moves a document to another service and removes it from the source.

**Usage:**

```csharp
var moved = module.MoveDocument(doc, targetServiceId, DocumentStatus.Queued, UsageType.Inbox, categoryId: null, resetCategory: null);
module.SaveChanges();
```

**When to use:**\
To maintain a single canonical copy of a document as it advances through the workflow.

***

#### CloneDocumentForTraining

**Signature:**\
`CloneDocumentForTraining(IDocument doc) : IDocument`

**Description:**\
Clones a document into a service’s training box.

**Usage:**

```csharp
var trainingDoc = module.CloneDocumentForTraining(doc);
logger.LogInformation("Cloned for training: {id}", trainingDoc.Id);
```

**When to use:**\
To expand or curate training datasets without affecting production items.

***

#### CheckIfDocumentAlreadyInTrainingBox

**Signature:**\
`CheckIfDocumentAlreadyInTrainingBox(IDocument doc) : bool`

**Description:**\
Checks whether a document has already been added to the training box.

**Usage:**

```csharp
if (!module.CheckIfDocumentAlreadyInTrainingBox(doc))
{
    var trainingDoc = module.CloneDocumentForTraining(doc);
    logger.LogInformation("Added to training: {id}", trainingDoc.Id);
}
```

**When to use:**\
To prevent duplicate training entries and keep training sets clean.

***

### Best Practices

* Prefer ID-based lookups (paramDefId, stpdId) for reliability and forward compatibility.
* Use filters (categories, grouping, value types) when resolving by name to avoid ambiguity.
* After copy/move/clone/status changes, call `module.SaveChanges()` to persist updates.
* Combine definition lookups with parameter/document methods to build robust flows.


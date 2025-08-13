# Parameters Related Methods

These methods let you find and work with Parameter Definitions (fields/labels) and service settings. Use them to locate definitions by ID or name, narrow by scope (parent, class, service), and retrieve settings for the current context. All are accessed via the module object in your custom code.

***

### Method Reference

#### FindParameterDef (by ID)

Signature: \
`FindParameterDef(int id) : IParameterDef`

Description: Returns a parameter definition (field/label/setting) by its unique ID.

Usage:

```csharp
var pd = module.FindParameterDef(12345);
if (pd != null)
{
    logger.LogInformation("ParamDef: {name} (Id: {id})", pd.Name, pd.Id);
}
```

When to use:

* When you already know the exact parameter definition ID and want to fetch or reuse it.

Tip:

* Always null-check the result before accessing properties.

***

#### FindParameterDef (by name with optional filters)

Signature: \
`FindParameterDef( string name, int? parentId = null, int? classId = null, List<ParameterDefinitionCategory?> categories = null, List<GroupingType?> grouping = null, List<ValueType?> vtypes = null ) : IParameterDef`

Description: Finds a parameter definition by name with optional filters (parent, class, category, grouping, value types) to disambiguate similarly named fields.

Usage:

```csharp
var pd = module.FindParameterDef(
    "InvoiceNumber",
    parentId: null,
    classId: null,
    categories: new List<ParameterDefinitionCategory?> { ParameterDefinitionCategory.Field },
    grouping: new List<GroupingType?> { GroupingType.Field },
    vtypes: new List<ValueType?> { ValueType.String }
);

if (pd != null)
{
    logger.LogInformation("Found definition: {id} {name}", pd.Id, pd.Name);
}
```

When to use:

* When multiple fields share a name across layouts/classes and you need precision using filters.

Tip:

* Prefer filtering by categories, grouping, and value type to reduce false matches.

***

#### FindParameterDef (by name within a service)

Signature: \
`FindParameterDef( string name, int stpdId, int? parentId = null, int? classId = null, List<ParameterDefinitionCategory?> categories = null, List<GroupingType?> grouping = null, List<ValueType?> vtypes = null ) : IParameterDef`

Description: Finds a parameter definition by name scoped to a specific service definition (stpdId), with optional filters.

Usage:

```csharp
var amountDef = module.FindParameterDef(
    "TotalAmount",
    stpdId: 5678,  // target service definition
    parentId: null,
    classId: null,
    categories: new List<ParameterDefinitionCategory?> { ParameterDefinitionCategory.Field },
    grouping: null,
    vtypes: new List<ValueType?> { ValueType.Currency }
);

if (amountDef != null)
{
    logger.LogInformation("Service-scoped field found: {id}", amountDef.Id);
}
```

When to use:

* When the same field name exists in multiple services and you must target a specific service.

Tip:

* Cache definition IDs you use frequently to avoid repeated lookups during batch processing.

***

#### FindSetting (by name)

Signature: \
`FindSetting(string name) : IParameterDef`

Description: Finds a service setting by name in the current context.

Usage:

```csharp
var archiving = module.FindSetting("ArchivingStrategy");
if (archiving != null)
{
    logger.LogInformation("Setting found: {name}", archiving.Name);
}
```

When to use:

* To retrieve a service-level configuration setting for downstream logic.

Tip:

* Settings are also parameter definitions; handle them similarly to fields (null-checks and ID reuse).

***

#### FindSetting (by service definition + parent)

Signature: \
`FindSetting(IParameterDef stpd, string name, int? parentId) : IParameterDef`

Description: Finds a setting by name within a specific service definition (stpd) and optional parent container.

Usage:

```csharp
var setting = module.FindSetting(serviceDef, "BaseURL", parentId: null);
if (setting != null)
{
    logger.LogInformation("Nested setting: {name}", setting.Name);
}
```

When to use:

* When settings are organized in nested containers or sub-services.

Tip:

* Use parentId to disambiguate settings with the same name in different containers.

***

#### CopyDocument

Signature: \
`CopyDocument(IDocument doc, int stpdId, DocumentStatus status, UsageType usage, int? categoryId = null, bool? resetCategory = null) : IDocument`

Description: Copies a document to another service, optionally setting status/usage and adjusting category.

Usage:

```csharp
var copied = module.CopyDocument(doc, targetServiceId, DocumentStatus.Queued, UsageType.Inbox, categoryId: null, resetCategory: null);
module.SaveChanges();
```

When to use:

* For parallel processing or routing while preserving the original in the source service.

Tip:

* Explicitly set the target Usage and Status to keep downstream flows clear and deterministic.

***

#### MoveDocument

Signature: \
`MoveDocument(IDocument doc, int stpdId, DocumentStatus status, UsageType usage, int? categoryId = null, bool? resetCategory = null) : IDocument`

Description: Moves a document to another service and removes it from the source.

Usage:

```csharp
var moved = module.MoveDocument(doc, targetServiceId, DocumentStatus.Queued, UsageType.Inbox, categoryId: null, resetCategory: null);
module.SaveChanges();
```

When to use:

* When you want a single canonical copy of the document as it progresses through the workflow.

Tip:

* Use “Check Before Move/Copy” logic elsewhere to avoid inadvertent duplicates.

***

#### CloneDocumentForTraining

Signature: \
`CloneDocumentForTraining(IDocument doc) : IDocument`

Description: Clones a document into a service’s training box.

Usage:

```csharp
var trainingDoc = module.CloneDocumentForTraining(doc);
logger.LogInformation("Cloned for training: {id}", trainingDoc.Id);
```

When to use:

* To expand or curate training datasets without altering production items.

Tip:

* Pair with CheckIfDocumentAlreadyInTrainingBox to avoid duplicate training samples.

***

#### CheckIfDocumentAlreadyInTrainingBox

Signature: \
`CheckIfDocumentAlreadyInTrainingBox(IDocument doc) : bool`s

Description: Checks whether a document has already been added to a service’s training box.

Usage:

```csharp
if (!module.CheckIfDocumentAlreadyInTrainingBox(doc))
{
    var trainingDoc = module.CloneDocumentForTraining(doc);
    logger.LogInformation("Added to training: {id}", trainingDoc.Id);
}
```

When to use:

* To prevent duplicate training records and keep datasets clean.

Tip:

* For large-scale training operations, log misses/hits for auditability and dataset hygiene.

***

### Best Practices

* Prefer ID-based lookups (definition IDs, stpdId) for reliability and future-proofing.
* Filter FindParameterDef by category/grouping/value type to avoid ambiguous matches.
* Save changes after copy/move/clone/status operations (module.SaveChanges()).
* Cache frequently used definition IDs in long-running or batch operations for performance.
* Combine definition lookups with parameter/document methods to build robust, context-aware flows.

### FAQ

* Q: What’s the difference between FindParameterDef and FindSetting?
  * A: FindParameterDef locates any field/label/setting definition; FindSetting is optimized for retrieving service-level settings.
* Q: How do I target the correct field when names collide?
  * A: Use the service-scoped overload with stpdId and add filters (category/grouping/value type), or store and reuse IDs.
* Q: Why are Copy/Move/Clone methods listed here?
  * A: They’re commonly executed soon after resolving definitions/settings when orchestrating cross-service flows; including them here reflects typical usage patterns
 IgnoreCase Multiline IgnoreCase Multiline

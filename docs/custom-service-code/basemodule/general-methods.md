# General Methods

### Overview

The methods in this section form the core toolbox for interacting with agent classes, users, parent services, and system integration endpoints (such as webhooks and Microsoft Graph) in AIForged custom code. All are accessed through the `module` object.

***

### Method Reference

#### GetClass

**Signature:**\
`GetClass(int classId) : IClasses`

**Description:**\
Returns the class (document category) object with the specified ID.

**Usage:**

```csharp
var invoiceClass = module.GetClass(1234);
if (invoiceClass != null)
{
    logger.LogInformation("Class name: {name}", invoiceClass.Name);
}
```

**When to use:**\
To fetch metadata or workflow rules for a specific class/category.

\


***

#### GetClasses

**Signature:**\
`GetClasses(IProject project) : List<IClasses>`\
`GetClasses(int projectId) : List<IClasses>`

**Description:**\
Returns all classes (categories) defined for a given agent.

**Usage:**

```csharp
var classes = module.GetClasses(stpd.ProjectId);
foreach (var cls in classes)
{
    logger.LogInformation("Found class: {id} - {name}", cls.Id, cls.Name);
}
```

***

#### GetDocumentMaster

**Signature:**\
`GetDocumentMaster(IDocument doc) : IDocument`

**Description:**\
Returns the master document for the given (child) document.

**Usage:**

```csharp
var masterDoc = module.GetDocumentMaster(doc);
if (masterDoc != null)
{
    logger.LogInformation("Master doc ID: {id}", masterDoc.Id);
}
```

**Tip:** Use for workflows where actions must be performed on parent/master documents.

***

#### FindClassByName

**Signature:**\
`FindClassByName(int projectId, string name, DictionaryLookupMethod? lookup = null, float minConfidence = 0.80F) : IClasses`

**Description:**\
Searches for a class by name. Supports fuzzy, exact, or regex matching by specifying the `lookup` method.

**Usage:**

```csharp
var cls = module.FindClassByName(projectId, "Invoices", DictionaryLookupMethod.LevenshteinDistance, 0.85F);
if (cls != null)
{
    logger.LogInformation("Matched class: {name}", cls.Name);
}
```

**When to use:**\
When you need to map or classify documents dynamically by name or partial match.

***

#### GetParentService

**Signature:**\
`GetParentService() : IParameterDef`\
`GetParentService(int id) : IParameterDef`

**Description:**\
Returns the parent service parameter definition for the current service (or for the specified service ID).

**Usage:**

```csharp
var parent = module.GetParentService();
logger.LogInformation("Parent service name: {name}", parent.Name);
```

**Tip:** Use in nested utilities or when context is needed for cross-service actions.

***

#### ParseDecimal

**Signature:**\
`ParseDecimal(string str, out decimal amount) : bool`

**Description:**\
Attempts to parse a string to a decimal value.

**Usage:**

```csharp
decimal value;
if (module.ParseDecimal("123.45", out value))
{
    logger.LogInformation("Parsed decimal: {value}", value);
}
else
{
    logger.LogWarning("Failed to parse decimal value.");
}
```

**When to use:**\
For safe conversion of extracted field values to decimals (currency, amounts, etc.).

***

#### GetUserAsync / GetUsersAsync

**Signatures:**\
`GetUserAsync(string userId) : IApplicationUser`\
`GetUsersAsync(IEnumerable userIds) : List<IApplicationUser>`\
`GetUserAsync(IProjectUser pu) : IApplicationUser`\
`GetUsersAsync(IEnumerable pudata) : List<IApplicationUser>`

**Description:**\
Fetches application user(s) by user ID(s) or project user(s).

**Usage:**

```csharp
var user = module.GetUserAsync("user-guid-here");
logger.LogInformation("User email: {email}", user?.Email);

var users = module.GetUsersAsync(new List<string> { "user1", "user2" });
```

**When to use:**\
For routing work items, logging, notifications, or access control.

***

#### GetUsers (Role/Permission Filtering)

**Signature:**\
`GetUsers(LinkType? type = null, List<Role> roles = null, string permissions = null) : List<IProjectUser>`\
...plus overloads for filtering by service, agent, group, etc.

**Description:**\
Returns a list of project users filtered by link type, roles, or permissions.

**Usage:**

```csharp
var verifiers = module.GetUsers(null, new List<Role> { Role.Verify }, null);
foreach (var verifier in verifiers)
{
    logger.LogInformation("Verifier: {id}", verifier.UserId);
}
```

**When to use:**\
For dynamic assignment, escalation, or permission checks.

***

#### GetMicrosoftGraphClient

**Signature:**\
`GetMicrosoftGraphClient() : object`

**Description:**\
Returns the Microsoft Graph client object for advanced integrations (used by services like OneDrive Scraper).

**Usage:**

```csharp
var graphClient = module.GetMicrosoftGraphClient();
// Use client per MS Graph SDK documentation.
```

***

#### CallWebHookAsync

**Signature:**\
`CallWebHookAsync(IDocument srcdoc, IDocument masterdoc = null, IDocumentParameter par = null, IParameterDef def = null, IVerification verification = null, IWorkItem wi = null, int? webHookServiceId = null) : object`

**Description:**\
Calls a webhook (external API) using the current document and workflow context. Returns the webhook call result.

**Usage:**

```csharp
await module.CallWebHookAsync(doc, webHookServiceId: 10101);
```

**When to use:**\
To trigger external notifications, integrations, or audit events.

***

#### SaveChanges / SaveChangesAsync

**Signatures:**\
`SaveChanges() : int`\
`SaveChangesAsync() : Task<int>`

**Description:**\
Commits any pending changes to the database made by your custom code.

**Usage:**

```csharp
// After modifying documents, parameters, etc.
await module.SaveChangesAsync();
```

**Tip:** Always call after updates to ensure data integrity.

***

### Best Practices

* Prefer using IDs for lookups and filters for reliability and forward compatibility.
* Log key actions, lookups, and exceptions for traceability.
* Always use try/catch when integrating with external systems.
* Combine general methods with parameter/document/verification/HITL methods to build robust flows.

***

### FAQ

**Q: Can I fetch both classes and users in the same script?**\
A: Yes, you can chain and mix any general methods as needed.

**Q: What’s the difference between GetUserAsync and GetUsers?**\
A: GetUserAsync returns application user objects by their GUID. GetUsers returns project user objects with role and permission context.

**Q: Do I need to call SaveChanges after every method?**\
A: Only after you modify documents, parameters, or datasets. Read-only operations do not require a save.


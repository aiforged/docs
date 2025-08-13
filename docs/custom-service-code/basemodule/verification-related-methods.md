# Verification Related Methods

### Overview

These methods let you determine if verification is required, count verification items, retrieve parameters that require verification, find verification items, and add new verification entries. All are accessed via the module object in your custom code.

***

### Method Reference

#### RequireVerification

Signature: \
`RequireVerification(IDocument doc) : bool`\
`RequireVerification(int docId) : bool`

Description: Returns true if the document requires human or rules-based verification; otherwise false.

Usage:

```csharp
bool needsVerification = module.RequireVerification(doc);
if (needsVerification)
{
    logger.LogInformation("Document {id} requires verification", doc.Id);
}
```

When to use:

* Before routing a document to HITL or taking automated post-processing actions.
* To gate transitions to Processed/Published states.

***

#### GetVerificationsCount

Signature: \
`GetVerificationsCount(IDocument doc) : int`\
`GetVerificationsCount(int docId) : int`

Description: Returns the number of verification items currently required on the specified document.

Usage:

```csharp
int count = module.GetVerificationsCount(doc);
logger.LogInformation("Document {id} has {count} pending verifications", doc.Id, count);
```

When to use:

* To measure verification workload, or determine escalation/auto-approve thresholds.

Tip:

* Pair with RequireVerification to short-circuit logic when count is zero.

***

#### GetVerificationParameters

Signature: \
`GetVerificationParameters(IDocument doc) : List`

Description: Returns the list of document parameters (fields) that require verification.

Usage:

```csharp
var paramsNeedingVerification = module.GetVerificationParameters(doc);
foreach (var p in paramsNeedingVerification)
{
    logger.LogInformation("Parameter {pdId} requires verification (paramId {id})", p.ParameterDefId, p.Id);
}
```

When to use:

* To iterate over all fields needing HITL review or targeted rule checks.

Tip:

* Combine with FindVerification/FindVerifications to inspect history and reasons.

***

#### FindVerification (overloads)

Signature: \
`FindVerification(IDocument doc, IParameterDef pd, int? index = null) : (IVerification verification, IDocumentParameter parameter)`\
`FindVerification(IDocument doc, int pdId, int? index = null) : (IVerification verification, IDocumentParameter parameter)`\
`FindVerification(int docId, int pdId, int? index = null) : (IVerification verification, IDocumentParameter parameter)`\
`FindVerification(IDocumentParameter parameter) : IVerification`\
`FindVerification(int? parameterId) : IVerification`

Description: Returns a verification item for the specified parameter, with overloads for document/definition context or direct parameter/ID access. Some overloads also return the corresponding parameter.

Usage:

```csharp
// By document + parameter definition (object)
var (ver, par) = module.FindVerification(doc, paramDef, index: null);
if (ver != null) logger.LogInformation("Found verification for pdId {id}", paramDef.Id);

// By document + parameter definition ID
var found = module.FindVerification(doc, paramDef.Id, index: 0);
if (found.verification != null) { /* handle */ }

// By parameter object
var v = module.FindVerification(parameter);
```

When to use:

* To fetch the current or specific-index verification item tied to a field.
* To inspect verification metadata (status, provider, result, info, timestamps).

Tip:

* Use index for array/table fields to target a specific row/instance.

***

#### FindVerifications (overloads)

Signature: \
`FindVerifications(IDocumentParameter parameter) : IEnumerable`\
`FindVerifications(int? parameterId) : IEnumerable`\
`FindVerifications(int? parameterId, VerificationType? type, VerificationStatus? status, string provider = null, string valuefilter = null, string infofilter = null, DateTime? fromDate = null, DateTime? toDate = null) : IEnumerable`

Description: Returns one or more verification items associated with a parameter, optionally filtered by type, status, provider, value/info filters, and date range.

Usage:

```csharp
// All verifications for a parameter
var all = module.FindVerifications(parameter);

// Filtered: only items added by a service with 'Success' status
var filtered = module.FindVerifications(
    parameter.Id, 
    VerificationType.Service, 
    VerificationStatus.Success, 
    provider: null, 
    valuefilter: null, 
    infofilter: null, 
    fromDate: null, 
    toDate: null
);
```

When to use:

* To analyze the verification history of a field or drive conditional workflows.

Tip:

* Use filters to isolate the latest successful or failing checks for targeted actions.

***

#### FindVerification (filtered single)

Signature: \
`FindVerification(int? parameterId, VerificationType? type, VerificationStatus? status, string provider = null, string valuefilter = null, string infofilter = null, DateTime? fromDate = null, DateTime? toDate = null) : IVerification`

Description: Returns a single verification item matching the specified filters for the given parameter.

Usage:

```csharp
var latestSuccess = module.FindVerification(
    parameter.Id,
    VerificationType.System,
    VerificationStatus.Success
);
```

When to use:

* When you need the first/best single match (e.g., the latest success or an error to display).

Tip:

* If you need all matches, use FindVerifications instead.

***

#### AddVerification

Signature: \
`AddVerification(IVerification v, string result, string info = null) : IVerification`\
`AddVerification(IVerification v, VerificationStatus status, string result, string info = null) : IVerification`

Description: Adds a verification entry (result/info and optional status) to a parameter’s verification trail.

Usage:

```csharp
// Assume 'verification' refers to the parameter's verification context you retrieved earlier
var added = module.AddVerification(verification, VerificationStatus.Verified, "Value normalized", "Normalized by Custom Code");
// Persist if your flow requires immediate durability
module.SaveChanges();
```

When to use:

* To record rule-engine outcomes, custom-code validations, or HITL decisions for auditability.

Tip:

* In field-level custom code, use the injected 'verification' variable directly with AddVerification.

***

### Best Practices

* Use RequireVerification and GetVerificationsCount early to avoid unnecessary work on already verified docs.
* Iterate GetVerificationParameters to drive HITL task creation, filtered by business rules.
* Prefer FindVerifications with filters for robust history analysis; use FindVerification for quick single lookups.
* Always log verification additions and key decisions to maintain an audit trail.
* Save changes after adding verification items when subsequent logic depends on persistence.

### FAQ

* Q: What’s the difference between RequireVerification and GetVerificationsCount?
  * A: RequireVerification is a boolean gate; GetVerificationsCount tells you how many items are pending.
* Q: How do I target a specific instance in a repeated/array field?
  * A: Use FindVerification overloads with the index parameter when resolving by document + parameter definition.
* Q: Should I add verification entries in batch or one-by-one?
  * A: Functionally either works; for performance, batch your SaveChanges calls where safe.
* Q: In field-level custom code, can I use the provided verification variable directly?
  * A: Yes—return new AIForged.Services.ProcessResult(verification) and use AddVerification on that context.
 IgnoreCase Multiline IgnoreCase Multiline

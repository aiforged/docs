# Document Related Methods

### Overview

These methods give you fine-grained control over documents in your AIForged agent. Use them for retrieving, copying, moving, updating status, and managing training data. All are accessed via the `module` object in your custom code.

***

### Method Reference

#### GetChildDocuments

**Signature:**\
`GetChildDocuments(IDocument doc, UsageType? usage, List<DocumentStatus> statuses) : List<IDocument>`\
`GetChildDocuments(IDocument doc, int stpdId, UsageType? usage, List<DocumentStatus> statuses) : List<IDocument>`

**Description:**\
Returns all child documents for the given parent document, optionally filtered by usage type (e.g., Inbox, Outbox) and status.

**Usage:**

```csharp
var children = module.GetChildDocuments(parentDoc, UsageType.Outbox, new List<DocumentStatus> { DocumentStatus.Processed });
foreach (var child in children)
{
    logger.LogInformation("Child document: {id}", child.Id);
}
```

**When to use:**\
To traverse document hierarchies or process related documents together.

***

#### GetDocumentData

**Signature:**\
`GetDocumentData(IDocument doc, List<DocumentDataType?> types) : List<IDocumentData>`

**Description:**\
Retrieves associated data for a document (e.g., image blobs, result files, training data).

**Usage:**

```csharp
var images = module.GetDocumentData(doc, new List<DocumentDataType?> { DocumentDataType.Image });
if (images != null && images.Any())
{
    var firstImage = images.First();
    // Access firstImage.Data as needed
}
```

**When to use:**\
To read document images, results, or other binary data for downstream processing or validation.

***

#### GetDocumentMaster

**Signature:**\
`GetDocumentMaster(IDocument doc) : IDocument`

**Description:**\
Returns the master (parent) document for a child document.

**Usage:**

```csharp
var masterDoc = module.GetDocumentMaster(doc);
if (masterDoc != null)
{
    logger.LogInformation("Master doc ID: {id}", masterDoc.Id);
}
```

**Tip:** Use when you need to escalate, audit, or coordinate actions between parent and child documents.

***

#### SetDocumentStatus

**Signature:**\
`SetDocumentStatus(IDocument doc, DocumentStatus status, string comment, string result, bool appendComment = true, bool appendResult = true, bool setMasterAlso = true) : IDocument`

**Description:**\
Updates the status of a document and adds a comment/result. Optionally updates the master document as well.

**Usage:**

```csharp
module.SetDocumentStatus(doc, DocumentStatus.Processed, "Auto-processed via custom code", "Extraction complete");
module.SaveChanges();
```

**When to use:**\
To advance workflow, track progress, or trigger downstream actions.

***

#### CopyDocument

**Signature:**\
`CopyDocument(IDocument doc, int stpdId, DocumentStatus status, UsageType usage, int? categoryId = null, bool? resetCategory = null) : IDocument`

**Description:**\
Creates a copy of the document in another service, with optional updates to status, usage, or category.

**Usage:**

```csharp
var copiedDoc = module.CopyDocument(doc, targetServiceId, DocumentStatus.Queued, UsageType.Inbox, null);
module.SaveChanges();
```

**Tip:** Use for parallel processing, multi-service routing, or archival.

***

#### MoveDocument

**Signature:**\
`MoveDocument(IDocument doc, int stpdId, DocumentStatus status, UsageType usage, int? categoryId = null, bool? resetCategory = null) : IDocument`

**Description:**\
Moves the document to another service, removing it from the source.

**Usage:**

```csharp
var movedDoc = module.MoveDocument(doc, targetServiceId, DocumentStatus.Queued, UsageType.Inbox, null);
module.SaveChanges();
```

**When to use:**\
To enforce single-instance workflow or transfer ownership between services.

***

#### CloneDocumentForTraining

**Signature:**\
`CloneDocumentForTraining(IDocument doc) : IDocument`

**Description:**\
Clones the document into the training box of a service for model retraining or augmentation.

**Usage:**

```csharp
var trainingDoc = module.CloneDocumentForTraining(doc);
logger.LogInformation("Cloned for training: {id}", trainingDoc.Id);
```

**When to use:**\
To expand your training set without disrupting production flows.

***

#### CheckIfDocumentAlreadyInTrainingBox

**Signature:**\
`CheckIfDocumentAlreadyInTrainingBox(IDocument doc) : bool`

**Description:**\
Checks if the document is already present in the training box.

**Usage:**

```csharp
bool inTraining = module.CheckIfDocumentAlreadyInTrainingBox(doc);
if (inTraining)
    logger.LogInformation("Document already in training box");
else
    logger.LogInformation("Document can be added to training box");
```

**Tip:** Use to prevent duplicate training data and maintain dataset quality.

***

### Best Practices

* Always call `SaveChanges()` after modifying document state.
* Use status and usage fields to drive workflow and reporting.
* Handle nulls and exceptions for robust, production-ready scripts.
* Use document hierarchy methods to build advanced, multi-level automations.

***

### FAQ

**Q: Can I process multiple child documents at once?**\
A: Yes, use `GetChildDocuments` to retrieve all related documents and loop as needed.

**Q: What’s the difference between Copy and Move?**\
A: Copy preserves the original in both services; Move transfers ownership and removes from source.

**Q: How do I prevent duplicate training data?**\
A: Use `CheckIfDocumentAlreadyInTrainingBox` before cloning.
 IgnoreCase Multiline IgnoreCase Multiline

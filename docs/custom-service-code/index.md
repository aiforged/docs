# ✨ Custom Code

Custom Code in AIForged allows you to script custom logic, validations, data enrichment, and advanced automation directly into your workflow—unlocking endless flexibility for your agents. Write code in your favorite language (C#, Visual Basic, F#, IronPython, or even natural language with SemanticKernel) to add business rules, call APIs, transform fields, or orchestrate document routing, all from within the platform.

!!! info
    Tip: Use Custom Code utilities to validate or enrich extracted fields, deduplicate documents, call external APIs, or implement bespoke business rules—without waiting for core platform changes!

***

### How It Works

Custom Code utilities are not standalone services.\
**Always attach them as a pre- or post-processor to a parent service**—either from the parent’s service view or the Service Flow Configurator.

**To add a Custom Code utility:**

* **From Parent Service View:**
  1. Open your parent service.
  2. Click the **Add Service** dropdown and select **Utility Service**.&#x20;
  3. Select **Custom Code**.
  4. Set whether to run as a pre- or post-processor (using Execute Before/After Process).
* **From Service Flow Configurator:**
  1. Open the parent service’s Service Flow Configurator.
  2. Expand the Utility Service Types group.&#x20;
  3. Drag **Custom Code** onto the parent:
     * Drop to the left for Pre-processor.
     * Drop to the right for Post-processor.&#x20;
  4. Save.

!!! info
    Custom Code runs as part of the parent service’s lifecycle—never configure it as a standalone service!

***

### Quick Start

Get up and running in five steps:

1. **Attach the Custom Code utility**
   Add it to a parent service as a pre- or post-processor via the service view or Service Flow Configurator.
2. **Open the code editor**
   Click into the Custom Code utility’s editor in your workflow UI.
3. **Choose your language**
   Select C#, Visual Basic, F#, IronPython, or SemanticKernel (natural language).
4. **Write & save your code**
   Script your logic, add any needed Imports/Assemblies, and click Save to compile.
5. **Test and monitor**
   Run a test batch, review logs for debugging, and iterate on your logic.

!!! info
    Tip: Use logger.LogInformation for debugging, and always wrap error-prone code in try/catch blocks.

***

### Common Patterns in AIForged Custom Code

* **Field/Parameter Validation:**
  Normalize, validate, or reformat extracted values (dates, phone numbers, currency).
* **Deduplication:**
  Compute an MD5 hash of each document and check against a custom dataset to prevent duplicate processing.
* **Field/Label Enrichment:**
  Call external APIs or look up values in custom datasets to enrich extracted data.
* **Conditional Routing:**
  Move or copy documents to different services based on extracted field values or statuses.
* **Work Item Triggering:**
  Create HITL work items or escalate to specific users when business logic flags an issue.
* **Status Management:**
  Programmatically update document status or add comments/results after custom checks.
* **Custom Notifications:**
  Use Webhook utilities or Custom Code to send notifications or external events on status changes.

!!! info
    For each pattern, leverage the BaseModule APIs and reference parameters and definitions by their IDs for robustness. Modularize logic for reusability.

***

### Supported Coding Languages

* **C#**
* **Visual Basic**
* **F#**
* **IronPython**
* **SemanticKernel** (write business rules in plain language, interpreted by AI)

!!! info
    Select your preferred language from the dropdown in the code editor. Use SemanticKernel for natural language logic and rapid prototyping.

***

### Typical Use Cases

* Validate or transform extracted fields (normalize dates, phone numbers, currency, etc.)
* Deduplicate documents using custom logic (e.g., MD5 hash check)
* Call external APIs to enrich or verify data
* Implement advanced routing, custom status transitions, or error handling
* Inject bespoke business rules, scoring, or workflow triggers
* Perform cross-service lookups, dataset enrichment, or notification/alerting

***

### Best Practices

* Start simple: focus on a single validation, enrichment, or routing rule, then build up.
* Use descriptive logging and robust error handling for easy debugging and future audits.
* Reference parameter/field definitions by ID for reliability.
* Save and test scripts incrementally; monitor logs for issues.
* Modularize and document your logic for easier maintenance.

***

### FAQ

* **Can I make HTTP/API calls?**
  Yes! Use standard .NET HTTP clients or IronPython (or SemanticKernel for natural language triggers).
* **Can I access and modify document fields?**
  Absolutely. Use the BaseModule API to read, update, and verify parameters/fields/labels.
* **Is there a limit to what I can script?**
  Custom Code runs in a secure .NET sandbox; avoid long-running/blocking code and always include error handling.
* **How do I debug my code?**
  Use `logger.LogInformation` and check logs via the AIForged UI.

***

### Example Code Blocks

#### 1. MD5-Based Deduplication (Batch/Utility Script Level)

```csharp
// Check for duplicate documents using a custom dataset and flag as error if duplicate found.
if (docs == null || docs.Count == 0) {
    return new AIForged.Services.ProcessResult(docs);
}

ICustomDataSet dataset = module.GetDataSetByDef(stpd, /*DatasetId*/, false, false, null, null, null, null);
var fieldDocId = dataset.FindField(/*DocumentIdFieldId*/);
var fieldMD5Hash = dataset.FindField(/*MD5HashFieldId*/);

foreach (var doc in docs)
{
    var data = module.GetDocumentData(doc, null);
    if (data == null || data.Count == 0) continue;

    // Compute MD5
    byte[] hash;
    using (var md5 = System.Security.Cryptography.MD5.Create()) {
        md5.TransformFinalBlock(data[0].Data, 0, data[0].Data.Length);
        hash = md5.Hash;
    }
    string hashString = BitConverter.ToString(hash).Replace("-", "");

    var matches = module.GetDataSetRecords(dataset, fieldMD5Hash, hashString, false);
    if (matches != null && matches.Count > 0) {
        var previousDocId = matches[0].GetValue(fieldDocId).Value;
        module.SetDocumentStatus(doc, DocumentStatus.Error, $"Duplicate of {previousDocId}", null, true, false, true);
        continue;
    }

    var newRecord = dataset.CreateRecord(Guid.NewGuid().ToString());
    newRecord.SetValue(fieldDocId.Id, doc.Id.ToString());
    newRecord.SetValue(fieldMD5Hash.Id, hashString);
    await module.SaveDataSetRecord(dataset, newRecord);
}
await module.SaveChanges();
return new AIForged.Services.ProcessResult(docs);
```

#### 2. Field-Level Validation and Transformation (Parameter/Field Custom Code)

```csharp
// Example: Normalize a numeric field value and add a verification entry
if (verification != null && decimal.TryParse(verification.Value, out var amount)) {
    var normalized = amount.ToString("F2", CultureInfo.InvariantCulture);
    verification.Value = normalized;
}
return new AIForged.Services.ProcessResult(verification);
```

#### 3. API Enrichment (Utility Script Level)

<pre class="language-csharp"><code class="lang-csharp">
foreach (var doc in docs)
{
    var http = new HttpClient();
<strong>    var payload = new { docId = doc.Id, filename = doc.Filename };
</strong>    var content = new StringContent(JsonSerializer.Serialize(payload), System.Text.Encoding.UTF8, "application/json");
    var response = await http.PostAsync("https://external.api/enrich", content);
    
    if (response.IsSuccessStatusCode)
    {
        var enrich = await response.Content.ReadFromJsonAsync&#x3C;Dictionary&#x3C;string, string>>();
        if (enrich != null &#x26;&#x26; enrich.TryGetValue("enriched", out var enrichedValue))
        {
            doc.Result = enrichedValue;
            await module.SaveChanges();
        }
    }
}

return new AIForged.Services.ProcessResult(docs);
</code></pre>

#### 4. Conditional HITL Work Item Assignment (Batch/Utility Script Level)

```csharp
if (doc.Status == DocumentStatus.Verification)
{
    var verifier = module.PickRandom(verifiers, null); // verifiers = List<IProjectUser>
    if (verifier != null)
    {
        module.CreateWorkItem(
            verifier.UserId, WorkItemType.Document, WorkItemStatus.Created,
            WorkItemAction.Verify, WorkItemMethod.Manual, TimeSpan.FromHours(24),
            parentservice.Id, doc.Id, null, null, null, null, null,
            "HITL required: document awaiting verification.", doc.Comment
        );
        module.SaveChanges();
    }
}
```

#### 5. General Logging and Error Handling Pattern

```csharp
try
{
    // Your custom logic
    logger.LogInformation("{stage} Custom Code completed for Document {id}", stpd.Name, doc.Id);
}
catch (Exception ex)
{
    logger.LogError(ex, "{stage} Custom Code failed for Document {id}", stpd.Name, doc.Id);
    module.SetDocumentStatus(doc, DocumentStatus.Error, ex.Message, null, true, false, true);
}
```

### How to Return Results in Custom Code

*   **Batch/Utility Script Level:**
    Always end with:

    ```csharp
    return new AIForged.Services.ProcessResult(docs);
    ```

    (docs is the processed result documents collection.)
*   **Field/Label/Parameter Definition Level:**
    Always end with:

    ```csharp
    return new AIForged.Services.ProcessResult(verification);
    ```

    (verification contains the latest extracted and processed value information for that field.)

### Dataset Lookup Examples

#### 1. Look Up a Single Value in a Custom Dataset (Exact Match)

```csharp
var dataset = module.GetDataSetByDef(stpd, /* DatasetId */, false, false, null, null, null, null);
var vatParamDef = module.FindParameterDef("VatNumberField", ...); // Get the parameter definition
var vatParams = module.GetParameters(doc, vatParamDef.Id);
string inputVat = vatParams?.FirstOrDefault()?.Value ?? "";

var vatField = dataset.FindField(/* VatFieldId */);
var companyField = dataset.FindField(/* CompanyNameFieldId */);

var record = module.GetDataSetRecord(dataset, vatField.Id, inputVat, true);
if (record != null)
{
    var companyName = record.GetValue(companyField).Value;
    // Set or update the target parameter/field as needed
    var companyParamDef = module.FindParameterDef("CompanyNameField", ...);
    var companyParam = module.GetParameters(doc, companyParamDef.Id).FirstOrDefault();
    if (companyParam != null)
    {
        companyParam.Value = companyName;
    }
    else
    {
        module.CreateParameter(doc, companyParamDef, companyName);
    }
    await module.SaveChanges();
    logger.LogInformation("Dataset lookup success: VAT={vat} mapped to {company}", inputVat, companyName);
}
else
{
    logger.LogWarning("VAT {vat} not found in dataset", inputVat);
}
```

***

#### 2. Lookup with Regex Match (Fuzzy Search)

```csharp
// Try to find a record where the input matches a dataset field with regex
var dataset = module.GetDataSetByDef(stpd, /* DatasetId */, false, false, null, null, null, null);
var emailField = dataset.FindField(/* EmailFieldId */);
string pattern = @"^support@.*\.com$";

var record = module.LookupDataSetRecord(dataset, emailField.Id, pattern, true, false);
if (record != null)
{
    logger.LogInformation("Found matching email: {email}", record.GetValue(emailField).Value);
}
```

***

#### 3. Lookup by Field Name (String) Rather Than Field ID

```csharp
// Useful if your dataset field names are not changing
var dataset = module.GetDataSetByDef(stpd, /* DatasetId */, false, false, null, null, null, null);
var record = module.LookupDataSetRecord(dataset, "CustomerID", "12345", false, true);
if (record != null)
{
    var status = record.GetValue("Status").Value;
    doc.SetValue("CustomerStatus", status);
    module.SaveChanges();
}
```

***

#### 4. Multi-Field Search (Composite Key)

```csharp
// Search a dataset for a record matching multiple fields (AND)
var dataset = module.GetDataSetByDef(stpd, /* DatasetId */, false, false, null, null, null, null);
var searchFields = new List<(int, string)>
{
    (dataset.FindField(/* VatFieldId */).Id, doc.GetValue("VatNumberField").Value),
    (dataset.FindField(/* CountryFieldId */).Id, doc.GetValue("CountryField").Value)
};

var matches = module.SearchDataSetRecords(dataset, searchFields, false, true);
if (matches != null && matches.Any())
{
    var record = matches.First();
    logger.LogInformation("Composite dataset hit: {info}", record.GetValue("SomeField").Value);
}
```

***

#### 5. Get All Possible Values for a Dataset Field

```csharp
// Get all possible supplier codes from a dataset
var dataset = module.GetDataSetByDef(stpd, /* DatasetId */, false, false, null, null, null, null);
var supplierField = dataset.FindField(/* SupplierCodeFieldId */);
var values = module.GetDataSetFieldValues(dataset, supplierField);

foreach (var val in values)
{
    logger.LogInformation("Supplier code: {val}", val.Value);
}
```

***

### Best Practices for Dataset Lookups

* Always check for null before accessing dataset records or field values.
* Prefer searching by field ID for robustness; use field names if dataset structure is stable.
* For performance, cache dataset references if making repeated lookups within the same batch.
* Use regex or fuzzy search only when you can’t use exact matching—fuzzy methods are more resource intensive.
* Always log both hits and misses for traceability and debugging.

***

### Adding Records to a Custom Dataset

#### 1. Add a New Record to a Custom Dataset

```csharp
// Get a reference to your custom dataset
ICustomDataSet dataset = module.GetDataSetByDef(stpd, /* DatasetId */, false, false, null, null, null, null);

// Find the dataset fields (by field IDs)
var fieldCustomerId = dataset.FindField(/* CustomerIdFieldId */);
var fieldEmail = dataset.FindField(/* EmailFieldId */);

// Create a new record with a unique key (can use Guid or a business key)
var newRecord = dataset.CreateRecord(Guid.NewGuid().ToString());

// Set values for fields in the new record
newRecord.SetValue(fieldCustomerId.Id, "123456");
newRecord.SetValue(fieldEmail.Id, "john.doe@example.com");

// Save the new record to the dataset
await module.SaveDataSetRecord(dataset, newRecord);

// (Optional) Log the result
logger.LogInformation("Added new customer record to dataset: {customerId}", "123456");
```

***

#### 2. Upsert (Update or Insert) a Record by Business Key

```csharp
// Find existing record by business key (e.g., CustomerId)
var existing = module.GetDataSetRecord(dataset, fieldCustomerId.Id, "123456", true);

if (existing != null)
{
    // Update the email
    existing.SetValue(fieldEmail.Id, "new.email@example.com");
    await module.SaveDataSetRecord(dataset, existing);
    logger.LogInformation("Updated email for customer 123456");
}
else
{
    // Insert new record
    var newRecord = dataset.CreateRecord(Guid.NewGuid().ToString());
    newRecord.SetValue(fieldCustomerId.Id, "123456");
    newRecord.SetValue(fieldEmail.Id, "new.email@example.com");
    await module.SaveDataSetRecord(dataset, newRecord);
    logger.LogInformation("Added new customer 123456 to dataset");
}
```

***

#### 3. Add a Record for Each Document in a Batch

```csharp
foreach (var doc in docs)
{
    var newRecord = dataset.CreateRecord(Guid.NewGuid().ToString());
    newRecord.SetValue(fieldDocId.Id, doc.Id.ToString());
    newRecord.SetValue(fieldMD5Hash.Id, "SOME_MD5_HASH_HERE");
    await module.SaveDataSetRecord(dataset, newRecord);
}
await module.SaveChanges();
```

***

#### 4. Best Practices

* Always check if a record already exists (if applicable) before inserting, to avoid unintended duplicates.
* Use unique, meaningful keys for records (e.g., Guid, business ID, document ID).
* Use `await module.SaveDataSetRecord(dataset, record);` for each new or updated record.
* For performance, group related changes and call `await module.SaveChanges();` after a batch if your logic allows.
 IgnoreCase Multiline IgnoreCase Multiline



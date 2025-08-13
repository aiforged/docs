# Custom Code

### Overview

The Custom Code utility in AIForged empowers you to script custom logic directly in your agent workflows. It lets you validate, enrich, transform, or route extracted data from Document Intelligence or any other service. With full access to the runtime context and the BaseModule API, you can reference documents, parameters (fields/labels), verifications, datasets, and more. Use it to call external APIs, enforce business rules, or perform any advanced operation that’s beyond standard service settings.

!!! info
    Tip: Start with a focused task—such as validating field formats or flagging duplicates—and expand your Custom Code as your workflow evolves.

***

### Permissions Required

Members must belong to one of the following AIForged user group roles to add and configure this utility:

* Owner
* Administrator
* Developer

!!! info
    Tip: Role membership is managed in Organisations > Roles. Assign members to roles to grant agent and service administration access.

***

### Supported Content Types

* Any document or data type handled by the parent service. Custom Code runs in context—accessing all relevant documents, fields, and extracted data.

!!! info
    If you need to normalize input formats, use the PDF Converter or other pre-processing utilities upstream of your Custom Code.

***

### Possible Use Cases

* Validate and clean up extracted fields (e.g., normalize phone numbers, check dates, format currency).
* Enrich extracted data by calling external APIs or referencing custom datasets.
* Prevent duplicate document processing (e.g., via MD5 hash checks).
* Implement conditional routing, custom status transitions, or advanced error handling.
* Trigger work items or notifications based on custom validation results.

***

### Add as Utility (Pre-/Post-Processor)

Utility services are not configured as standalone services. Attach them to a parent service either from the parent’s service view or from the service flow configurator.

#### Option A: From Parent Service View

1. Open the parent service.
2. Click the Add Service dropdown and select Utility Service.&#x20;
3. Choose **Custom Code**.
4. In the utility’s settings, specify when it should run:
   * Execute Before Process = Pre-processor
   * Execute After Process = Post-processor
5. Save.

#### Option B: From Service Flow Configurator

1. Open the parent service’s Service Flow Configurator.
2. Expand the Utility Service Types group.&#x20;
3. Drag the Custom Code utility onto the parent service:
   * Drop to the left for Pre-processor.
   * Drop to the right for Post-processor.&#x20;
4. Save.

!!! info
    Utilities run as part of the parent’s lifecycle. Use Execute Before Process or Execute After Process to control the timing. Avoid configuring utility services as standalone services.

***

### Service Configuration Settings

* **Language:** Usually C# (other .NET languages are supported where available).
* **Code Editor:** Write and save scripts inline via the code editor.
* **Assemblies:** Add references if your code needs extra .NET libraries (e.g., for hashing or advanced math).
* **Input Objects:** Your code runs with full access to BaseModule APIs (`module`), the current document(s), parameters, verifications, datasets, and service context.
* **Logging:** Use the provided logger to output debug or info messages.
* **Error Handling:** Always use try/catch and log exceptions.

!!! info
    For field/parameter logic, you can access and modify values, add verifications, or trigger workflow actions. For document-level logic, you can process document batches, create work items, or update statuses.

***

### Supported Coding Languages

AIForged Custom Code utilities let you script in a range of popular languages, ensuring flexibility for both traditional developers and business users:

* **C#**\
  The default language, offering powerful .NET capabilities for validations, transformations, and integrations.
* **Visual Basic**\
  Use familiar VB.NET syntax for business logic and field enrichment.
* **F#**\
  Functional programming for advanced data processing or compact rules.
* **IronPython**\
  Write logic in Python syntax, ideal for data wrangling and users from a Python background.
* **SemanticKernel (Natural Language)**\
  Write your code logic in plain English (or other supported natural languages). The AI model interprets your intent and executes the logic, making automation accessible to non-programmers and enabling rapid prototyping.

!!! info
    Tip: Start with C# for maximum compatibility and support, or try SemanticKernel for rapid prototyping and business-rule scripting in natural language.

**How to choose the language:**

* Select your preferred language from the Language dropdown in the Custom Code utility’s code editor before writing or pasting your script.
* If using SemanticKernel, describe your logic in plain language (e.g., “If the invoice total is over 10,000, set the status to ‘Needs Approval’ and flag for HITL”).

***

### Sample Usage: Duplicate Document Check

This example shows how you can use Custom Code (in a utility service attached to an email attachment processor) to prevent duplicate documents by comparing MD5 hashes and storing them in a custom dataset.

```csharp
// 1. Log the start of custom code execution
logger.LogInformation("{stpd} Start", stpd.Name);

// 2. Check if there are documents to process
if (docs == null) return new AIForged.Services.ProcessResult(docs);

// 3. Retrieve the custom dataset used to track document hashes
ICustomDataSet dataset = module.GetDataSetByDef(stpd, /* DataSetId */, false, false, null, null, null, null);
ParameterDefViewModel fieldDocId = dataset.FindField(/* DocumentIdFieldId */);
ParameterDefViewModel fieldMD5Hash = dataset.FindField(/* MD5HashFieldId */);

foreach (IDocument childDoc in docs)
{
    try
    {
        // Get the document data bytes
        var docData = module.GetDocumentData(childDoc, null);
        if (docData == null) continue;

        // Calculate MD5 hash
        byte[] docHash;
        using (var md5 = System.Security.Cryptography.MD5.Create())
        {
            md5.TransformFinalBlock(docData.FirstOrDefault().Data, 0, docData.FirstOrDefault().Data.Length);
            docHash = md5.Hash;
        }
        var hashString = BitConverter.ToString(docHash).Replace("-", "");

        // Check for duplicates in the custom dataset
        var checkHashes = module.GetDataSetRecords(dataset, fieldMD5Hash, hashString, false);
        if (checkHashes != null && checkHashes.Count() > 0)
        {
            module.SetDocumentStatus(childDoc, DocumentStatus.Error, "Duplicate detected.", null, true, false, true);
            continue;
        }

        // Store the new hash for future checks
        var newHashRecord = dataset.CreateRecord(Guid.NewGuid().ToString());
        newHashRecord.SetValue(fieldDocId.Id, childDoc.Id.ToString());
        newHashRecord.SetValue(fieldMD5Hash.Id, hashString);
        await module.SaveDataSetRecord(dataset, newHashRecord);
    }
    catch (Exception ex)
    {
        logger.LogInformation("Error processing document: {0}", ex.ToString());
    }
}
```

!!! info
    For the MD5 Hash calculation to work, add `System.Security.Cryptography.Algorithms` to your list of assemblies in the code editor.

***

### Quick Start

1. Attach the Custom Code utility to a parent service as a pre- or post-processor.
2. Open the code editor and write your logic using C# and the BaseModule APIs.
3. (Optional) Reference additional assemblies if needed.
4. Save your script and test with representative documents.
5. Monitor logs and outputs to validate behavior.

!!! info
    Tip: Start simple (e.g., field normalization or one-off API call), then iterate as your workflow matures.

***

### Known Limitations

* Custom Code runs in a sandboxed .NET environment—certain advanced libraries or OS calls may not be available.
* Excessive or poorly-optimized code can impact service throughput; always test for performance.
* Long-running or blocking operations (such as external API calls) should use async patterns and include timeouts.
* Errors in code may halt processing; always use robust error handling and logging.
* Custom Code can only modify objects accessible within the BaseModule API.

***

### Troubleshooting Tips

* **Code errors or exceptions?**
  * Use try/catch in your code and review logs for detailed error messages.
  * Start from a minimal script, then add complexity gradually.
* **Unexpected results or missing changes?**
  * Check that you’re saving changes with `module.SaveChanges()` where appropriate.
  * Confirm you’re referencing the correct parameters, datasets, or field IDs.
* **Performance issues?**
  * Batch-process documents where possible.
  * Avoid unnecessary API calls or loops; optimize your logic.
* **External API calls not working?**
  * Check network access, authentication, and timeouts.
  * Log API responses and errors for diagnostics.

***

### Best Practices

* Use descriptive logging to aid troubleshooting and audit trails.
* Always validate input data before acting on it in code.
* Prefer referencing parameter/field definitions by ID for reliability.
* Use custom datasets for history, deduplication, or enrichment needs.
* Modularize your code—break logic into reusable functions if the editor supports it.
* Save and test your scripts incrementally.

***

### FAQ

* **Can I call external APIs from Custom Code?**
  * Yes—use standard .NET HTTP client patterns, but always handle timeouts and errors robustly.
* **Can I modify document statuses or parameters?**
  * Yes, use the BaseModule APIs to update document statuses, add verifications, or change parameter values.
* **Can I access data from other services?**
  * Yes, as long as it is accessible via the BaseModule APIs and context of the current workflow.
* **How do I debug my code?**
  * Use the logger to write debug or info messages. Review logs in the AIForged UI.
* **How do I update a field only when a condition is met?**
  * Use standard C# if/else logic in your script, referencing the parameter or value as needed.
* **What happens if my code throws an exception?**
  * The error is logged and processing may halt for the current document. Always use error handling to avoid workflow interruptions.
 IgnoreCase Multiline IgnoreCase Multiline


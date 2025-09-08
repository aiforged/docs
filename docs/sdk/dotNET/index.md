# .NET SDK (index)

Welcome! This page is a friendly, practical starting point for developers and implementers integrating with AIForged using our .NET SDK. We’ll explain the core building blocks, help you authenticate quickly with an API key, and walk through the most common tasks with clear, copy‑pasteable code.

NuGet: [AIForged.SDK](https://www.nuget.org/packages/AIForged.SDK)

---

## What you get in the SDK

- Strongly-typed API clients for each AIForged area (Documents, Parameters, Datasets, Services, Work Items, etc.).
- A convenience Context that wires those clients together on a single, shared HttpClient.
- Simple API key authentication via the X-Api-Key header.
- Async-first methods, consistent response envelopes, and predictable exceptions.

Key types you’ll use:

- Config — bootstraps BaseUrl, HttpClient, timeouts, proxies, and holds auth state.
- Context — a façade exposing typed clients:
    - AccountClient, DocumentClient, ParametersClient, DataSetClient, ServicesClient, WorkItemClient, ProjectClient, SystemClient, and more.

!!! tip "Mental model"
    Think of Config as “connection + policies,” and Context as “gateways to features.” Configure once, reuse across your app lifetime.

---

## Install

```bash
dotnet add package AIForged.SDK
```

---

## Configure via environment variables (recommended)

Set these once and run the same code across dev/staging/prod.

- AIFORGED_BASE_URL — e.g., https://portal.aiforged.com
- AIFORGED_API_KEY — your API key
- AIFORGED_PROJECT_ID — optional default project (int)
- AIFORGED_SERVICE_ID — optional default service (int)
- AIFORGED_GROUP_ID — optional default group (int) for HITL routing

PowerShell:
```powershell
$env:AIFORGED_BASE_URL="https://portal.aiforged.com"
$env:AIFORGED_API_KEY="•••"
$env:AIFORGED_PROJECT_ID="123"
$env:AIFORGED_SERVICE_ID="456"
$env:AIFORGED_GROUP_ID="789"
```

Bash/zsh:
```bash
export AIFORGED_BASE_URL="https://portal.aiforged.com"
export AIFORGED_API_KEY="•••"
export AIFORGED_PROJECT_ID="123"
export AIFORGED_SERVICE_ID="456"
export AIFORGED_GROUP_ID="789"
```

Optional (local dev) — .NET user secrets:
```bash
dotnet user-secrets set "AIFORGED_BASE_URL" "https://portal.aiforged.com"
dotnet user-secrets set "AIFORGED_API_KEY"  "•••"
```

!!! warning "Security"
    - Treat your API key like a password. Don’t commit it to source control.
    - Prefer environment variables or a secrets manager (Key Vault, AWS Secrets Manager).
    - Never log the API key; redact secrets in telemetry.

---

## First run: initialize, authenticate (API key), verify

```csharp
using AIForged.API;

// Read environment variables
string baseUrl   = Environment.GetEnvironmentVariable("AIFORGED_BASE_URL")!;
string apiKey    = Environment.GetEnvironmentVariable("AIFORGED_API_KEY")!;
int?   projectId = int.TryParse(Environment.GetEnvironmentVariable("AIFORGED_PROJECT_ID"), out var p) ? p : null;
int?   serviceId = int.TryParse(Environment.GetEnvironmentVariable("AIFORGED_SERVICE_ID"), out var s) ? s : null;

// 1) Configure core HTTP pipeline
var cfg = new Config
{
    BaseUrl = baseUrl,
    Timeout = TimeSpan.FromMinutes(5) // adjust for large files if needed
};
await cfg.Init(); // wires HttpClient/handler

// 2) Add API key for every request
cfg.HttpClient.DefaultRequestHeaders.Add("X-Api-Key", apiKey);

// 3) Build the Context (typed API clients share the same HttpClient)
var ctx = new Context(cfg);

// 4) Quick connectivity check: read the current user
var me = await ctx.GetCurrentUserAsync();
Console.WriteLine($"Connected as: {me?.Email ?? me?.UserName} ({me?.Id})");
```

!!! info "Other auth options"
    The SDK also supports token flows via Duende IdentityServer (password/refresh). For most integrations, API keys are simpler and recommended.

---

## How things fit together (for implementers)

- Context is safe to reuse; create it once at startup and register it in DI for your app lifetime.
- All typed clients (e.g., ctx.DocumentClient) are thin wrappers around AIForged APIs with async methods that return Result payloads.
- Large operations (uploads, processing) are asynchronous on the server. You can:
    - Poll document status, or
    - Subscribe to webhooks/events (advanced topic), or
    - Use real‑time helpers on .NET 9 (SignalR) if enabled in your environment.

!!! note "HttpClient reuse"
    The SDK internally uses a shared HttpClient from Config. Avoid newing HttpClient per call—this prevents socket exhaustion and improves performance.

---

## Common workflow 1: search documents, view results

```csharp
// Find documents for the last 7 days in your inbox (adjust as needed)
var docsResp = await ctx.DocumentClient.GetExtendedAsync(
    userId: ctx.CurrentUser.Id,
    projectId: projectId,
    stpdId: serviceId,
    usage: UsageType.Inbox,
    statuses: new() { DocumentStatus.Received, DocumentStatus.Processed },
    classname: null, filename: null, filetype: null,
    start: DateTime.UtcNow.AddDays(-7), end: DateTime.UtcNow,
    masterid: null, includeparamdefcategories: null,
    pageNo: null, pageSize: null,
    sortField: null, sortDirection: null,
    comment: null, result: null, resultId: null, resultIndex: null,
    externalId: null, docGuid: null, classId: null, id: null
);

var docs = docsResp?.Result ?? new();
Console.WriteLine($"Found {docs.Count} documents.");

if (docs.Count > 0)
{
    // Extract field results for the first document
    var extraction = await ctx.ParametersClient.ExtractAsync(docs[0].Id);
    foreach (var row in extraction?.Result ?? Enumerable.Empty<DocumentExtraction>())
        Console.WriteLine($"{row.Name}: {row.Value} (conf {row.Confidence})");
}
```

What’s happening:

- GetExtendedAsync performs a structured search with many optional filters.
- ExtractAsync returns a transposed view of your document’s fields and values.

---

## Common workflow 2: upload and process

```csharp
var filePath = "invoice.pdf";
var bytes = await File.ReadAllBytesAsync(filePath);
using var ms = new MemoryStream(bytes);
var file = new FileParameter(ms, Path.GetFileName(filePath), "application/pdf");

// Upload into Inbox with “Received” status
var uploadResp = await ctx.DocumentClient.UploadFileAsync(
    stpdId: serviceId,
    userId: ctx.CurrentUser.Id,
    projectId: projectId,
    classId: null,
    status: DocumentStatus.Received,
    usage: UsageType.Inbox,
    masterid: null,
    comment: "SDK upload",
    externalId: "EXT-123",
    result: null, resultId: null, resultIndex: null,
    guid: Guid.NewGuid(),
    data: file
);

var doc = uploadResp?.Result?.FirstOrDefault();
Console.WriteLine($"Uploaded doc id: {doc?.Id}");

// Trigger processing for uploaded doc
if (doc?.Id != null)
{
    await ctx.ServicesClient.ProcessAsync(
        userId: ctx.CurrentUser.Id,
        projectId: projectId,
        stpdId: serviceId,
        docIds: new() { doc.Id }
    );
    Console.WriteLine("Processing started.");
}
```

Polling for completion (simple, jittered backoff):
```csharp
async Task<DocumentViewModel?> WaitUntilProcessedAsync(int docId, TimeSpan timeout)
{
    var sw = System.Diagnostics.Stopwatch.StartNew();
    var delay = TimeSpan.FromSeconds(2);

    while (sw.Elapsed < timeout)
    {
        var resp = await ctx.DocumentClient.GetDocumentAsync(docId);
        var d = resp?.Result;
        if (d == null) return null;

        if (d.Status is DocumentStatus.Processed or DocumentStatus.InterimProcessed or DocumentStatus.Verification or DocumentStatus.Error)
            return d;

        await Task.Delay(delay);
        // Exponential backoff (cap at ~30s)
        var next = Math.Min(delay.TotalSeconds * 1.5, 30);
        delay = TimeSpan.FromSeconds(next);
    }
    return null;
}
```

!!! tip "Production patterns"
    For higher throughput and better UX, subscribe to webhooks/events instead of polling. We’ll cover this in the Webhooks how‑to.

---

## Common workflow 3: Human‑in‑the‑Loop (HITL) — create a Work Item

Route a document to a group for manual verification:

```csharp
int? groupId = int.TryParse(Environment.GetEnvironmentVariable("AIFORGED_GROUP_ID"), out var g) ? g : null;

await ctx.WorkItemClient.CreateAsync(
    docId: /* your doc id */,
    shredId: null,
    comment: "Low confidence or policy check failed — please verify",
    method: WorkItemMethod.Random,         // or Manual, Idle, etc.
    action: WorkItemAction.Verify,
    graceperiod: TimeSpan.FromHours(24),   // escalate after a day
    toGroupId: groupId,
    toUserId: null,                        // let method decide assignee
    reason: null,
    reasonLookup: null,
    reasonRecord: null,
    reasonCode: null,
    reasonDescription: null,
    reasonComment: null,
    roles: new() { "verifydoc" }           // optional, depends on your setup
);
```

!!! example "When to create a Work Item"
    - Confidence below your threshold
    - Regex/shape checks fail
    - Cross‑field inconsistencies (line items vs totals)
    - External validation service returns ambiguous results

---

## Common workflow 4: Deep search by field value

Find documents containing a specific extracted value (e.g., an invoice number):

```csharp
var searchValue = "INV-2025-0001";

var deepResp = await ctx.ParametersClient.DeepSearchAsync(
    ctx.CurrentUser.Id,
    projectId,
    serviceId,
    value: searchValue,
    pdId: null,
    docId: null,
    docUsage: UsageType.Inbox,
    docStatus: DocumentStatus.Processed,
    docFrom: DateTime.UtcNow.AddMonths(-3),
    docTo: DateTime.UtcNow,
    classId: null
);

var resultDocs = new List<DocumentViewModel>();
foreach (var docId in deepResp?.Result?.Select(r => r.DocumentId).Distinct() ?? Enumerable.Empty<int>())
{
    var r = await ctx.DocumentClient.GetDocumentAsync(docId);
    if (r?.Result != null) resultDocs.Add(r.Result);
}

Console.WriteLine($"Found {resultDocs.Count} docs with value {searchValue}.");
```

---

## Datasets in a nutshell (allow‑lists, catalogs, lookups)

- A Custom Dataset is a named, typed table you can create and query (e.g., vendor catalogs, policy codes).
- Typical tasks:
    - Create a dataset by name in a service
    - Add/update/delete dataset records
    - Search by key or Get by ID

Minimal examples:

Create dataset by name:
```csharp
var dataSet = await ctx.DataSetClient.GetByNameAsync(
    projectId, serviceId, dataSetName: "Allowed Vendors",
    includeData: false, pageNo: null, pageSize: null,
    sortFieldDefId: null, sortDirection: null,
    searchField: null, searchFilter: null
);
if (dataSet?.Result == null)
{
    var created = await ctx.DataSetClient.CreateAsync(projectId, serviceId, "Allowed Vendors");
    Console.WriteLine($"Created dataset: {created.Result?.Name} (Id={created.Result?.Id})");
}
```

Add a record:
```csharp
var record = new CustomDataSetRecord
{
    // Set Key and FieldValues according to your dataset definition
    KeyId = null,
    FieldValues = new Dictionary<int, string>
    {
        // [defFieldId] = "value"
    }
};
await ctx.DataSetClient.CreateRecordAsync(/*docId*/ null, /*defId*/ /*dataset def id*/, record);
```

Find by key value:
```csharp
var rec = await ctx.DataSetClient.GetRecordByKeyValueAsync(
    docId: null, defId: /*dataset def id*/, keyValue: "VENDOR-001", includeVerifications: false
);
Console.WriteLine($"Found record keyId: {rec?.Result?.KeyId}");
```

!!! tip "Design tip"
    Keep one “system of record” for reference data. Use Custom Datasets as a local, fast cache for validation and lookups used during extraction/verification.

---

## Robust error handling

Most server-side issues throw `AIForged.API.SwaggerException`. Handle them centrally and add smart retries for transient failures.

```csharp
using AIForged.API;
using System.Net;
using System.Net.Http;

try
{
    var me = await ctx.GetCurrentUserAsync();
}
catch (SwaggerException ex)
{
    Console.Error.WriteLine($"API error {(int)ex.StatusCode} {ex.StatusCode}: {ex.Message}");
    Console.Error.WriteLine($"Response body: {ex.Response}");

    // Handle by status
    if (ex.StatusCode == HttpStatusCode.Unauthorized || ex.StatusCode == HttpStatusCode.Forbidden)
    {
        Console.Error.WriteLine("Check X-Api-Key and access to the target project/service.");
    }
    else if ((int)ex.StatusCode == 429 || (int)ex.StatusCode >= 500)
    {
        Console.Error.WriteLine("Transient issue or rate limiting. Consider retrying with backoff.");
    }
}
catch (HttpRequestException ex)
{
    Console.Error.WriteLine($"Network/TLS/Proxy error: {ex.Message}");
}
catch (Exception ex)
{
    Console.Error.WriteLine($"Unexpected: {ex}");
}
```

Basic retry with exponential backoff:
```csharp
async Task<T> RetryAsync<T>(Func<Task<T>> op, int maxAttempts = 3)
{
    var delay = TimeSpan.FromSeconds(1);
    for (int attempt = 1; attempt <= maxAttempts; attempt++)
    {
        try { return await op(); }
        catch (SwaggerException ex) when ((int)ex.StatusCode == 429 || (int)ex.StatusCode >= 500)
        {
            if (attempt == maxAttempts) throw;
            await Task.Delay(delay + TimeSpan.FromMilliseconds(Random.Shared.Next(0, 250)));
            delay = TimeSpan.FromSeconds(Math.Min(delay.TotalSeconds * 2, 30));
        }
    }
    // Unreachable, but compiler-friendly:
    throw new InvalidOperationException("Retry failed unexpectedly.");
}
```

---

## Configuration tips and best practices

- Timeouts: Increase `Config.Timeout` for large PDFs/images or long-running requests.
- Proxies: Use `Config.ProxyServer`, `Config.ProxyUser`, `Config.ProxyPassword` if your network requires it.
- IDs: ProjectId, ServiceId, GroupId are standard ints; keep them in config/env for clarity.
- Http headers: You can add custom headers to `cfg.HttpClient.DefaultRequestHeaders` if your environment requires tracing IDs, etc.
- DI: Register a single Context/Config in dependency injection and reuse (singleton or scoped per tenant).

!!! note "Threading"
    The SDK is async-first. Use async/await end-to-end to avoid thread starvation in web apps and services.

---

## Troubleshooting guide

- 401/403 Unauthorized/Forbidden
    - Verify BaseUrl, API key value, and that the key has access to the project/service.
    - Make sure header is exactly `X-Api-Key`.

- 404 Not Found
    - Check IDs (project, service, document) and environment. Staging vs production mix-ups are common.

- 413/415 Payload too large/Unsupported media type
    - Ensure you use `FileParameter` with the correct content type.
    - Adjust server and client limits for large files.

- Timeouts
    - Increase `Config.Timeout`.
    - Add retries with backoff for 5xx/429.
    - Prefer webhooks or real-time feeds over tight polling loops.

- Rate limits (429)
    - Back off and honor Retry-After if present.
    - Batch calls where possible.

---

## Real-time helpers (optional, .NET 9+)

If your environment enables real-time feeds, Context includes SignalR helpers (subscribe to logs/progress, trigger operations). This is advanced usage—see the Real-time how‑to for examples like:

- Subscribing to service process events
- Live log streaming during processing
- Coordinating request/response via hub callbacks

---

## Production checklist

- Read AIFORGED_BASE_URL and AIFORGED_API_KEY from a secure store.
- Create a single Context per process (or per tenant) and reuse it.
- Add structured logging (ILogger) with correlation IDs.
- Implement retries with backoff for transient errors (429/5xx).
- Consider webhooks/queues for async document workflows.
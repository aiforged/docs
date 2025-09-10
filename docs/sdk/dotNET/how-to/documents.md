# .NET SDK — How‑to: Documents

This guide gets you productive fast with documents in AIForged:

- Structured search with practical filters
- Upload variants (single, multi/parallel)
- Common statuses and usages
- Updating status and externalId
- A resilient polling pattern for async processing

Production API base URL: https://portal.aiforged.com  
NuGet: [AIForged.SDK](https://www.nuget.org/packages/AIForged.SDK)

---

## Prerequisites

- .NET 6+ and the SDK installed:
  ```bash
  dotnet add package AIForged.SDK
  ```
- Environment variables (recommended)
    - AIFORGED_BASE_URL = https://portal.aiforged.com
    - AIFORGED_API_KEY = •••
    - AIFORGED_PROJECT_ID = (int)
    - AIFORGED_SERVICE_ID = (int)

- Context initialization (API key)
  ```csharp
  using AIForged.API;

  var baseUrl  = Environment.GetEnvironmentVariable("AIFORGED_BASE_URL") ?? "https://portal.aiforged.com";
  var apiKey   = Environment.GetEnvironmentVariable("AIFORGED_API_KEY")  ?? throw new Exception("AIFORGED_API_KEY not set.");
  int? projectId = int.TryParse(Environment.GetEnvironmentVariable("AIFORGED_PROJECT_ID"), out var p) ? p : null;
  int? serviceId = int.TryParse(Environment.GetEnvironmentVariable("AIFORGED_SERVICE_ID"), out var s) ? s : null;

  var cfg = new Config { BaseUrl = baseUrl, Timeout = TimeSpan.FromMinutes(5) };
  await cfg.Init();
  cfg.HttpClient.DefaultRequestHeaders.Add("X-Api-Key", apiKey);

  var ctx = new Context(cfg);
  var me  = await ctx.GetCurrentUserAsync();
  ```

---

## 1) Structured search with practical filters

The workhorse is GetExtendedAsync. You can filter by time windows, usage, statuses, file names/types, externalId, classes, and more.

Basic: “docs in my Inbox from the last 7 days that are Received or Processed”
```csharp
var resp = await ctx.DocumentClient.GetExtendedAsync(
    userId: ctx.CurrentUser.Id,
    projectId: projectId,
    stpdId: serviceId,
    usage: UsageType.Inbox,
    statuses: new() { DocumentStatus.Received, DocumentStatus.Processed },
    classname: null,
    filename: null,
    filetype: null,
    start: DateTime.UtcNow.AddDays(-7),
    end: DateTime.UtcNow,
    masterid: null,
    includeparamdefcategories: null,
    pageNo: null,
    pageSize: null,
    sortField: null,
    sortDirection: null,
    comment: null,
    result: null,
    resultId: null,
    resultIndex: null,
    externalId: null,
    docGuid: null,
    classId: null,
    id: null
);
var docs = resp?.Result ?? new();
```

Common filter variations:

- Filter by filename pattern:
  ```csharp
  filename: "INV_*.pdf"
  ```
- Specific externalId:
  ```csharp
  externalId: "ERP-123456"
  ```
- Limit to a class (category):
  ```csharp
  classId: 42
  ```
- Outbox only, and sort newest first:
  ```csharp
  usage: UsageType.Outbox,
  sortField: SortField.DTC,             // created date
  sortDirection: SortDirection.Desc
  ```

Paging pattern (count + pages):
```csharp
var totalCount = await ctx.DocumentClient.GetExtendedCountAsync(
    userId: ctx.CurrentUser.Id, projectId: projectId, stpdId: serviceId,
    usage: UsageType.Inbox, statuses: new() { DocumentStatus.Received },
    classname: null, filename: null, filetype: null,
    start: DateTime.UtcNow.AddDays(-30), end: DateTime.UtcNow,
    masterid: null, comment: null, result: null, resultId: null, resultIndex: null,
    externalId: null, docGuid: null, classId: null, id: null
);

int pageSize = 50;
int pages = (int)Math.Ceiling((totalCount?.Result ?? 0) / (double)pageSize);

for (int page = 1; page <= pages; page++)
{
    var pageResp = await ctx.DocumentClient.GetExtendedAsync(
        userId: ctx.CurrentUser.Id, projectId: projectId, stpdId: serviceId,
        usage: UsageType.Inbox, statuses: new() { DocumentStatus.Received },
        classname: null, filename: null, filetype: null,
        start: DateTime.UtcNow.AddDays(-30), end: DateTime.UtcNow,
        masterid: null, includeparamdefcategories: null,
        pageNo: page, pageSize: pageSize,
        sortField: SortField.DTC, sortDirection: SortDirection.Desc,
        comment: null, result: null, resultId: null, resultIndex: null,
        externalId: null, docGuid: null, classId: null, id: null
    );

    foreach (var d in pageResp?.Result ?? new()) { /* … */ }
}
```

Tip: retrieve by ID when you already know it
```csharp
var single = await ctx.DocumentClient.GetDocumentAsync(docId: 12345);
```

---

## 2) Upload variants (single and multi/parallel)

Single-file upload (typical)
```csharp
var bytes = await File.ReadAllBytesAsync("invoice.pdf");
using var ms = new MemoryStream(bytes);
var fileParam = new FileParameter(ms, "invoice.pdf", "application/pdf");

var upload = await ctx.DocumentClient.UploadFileAsync(
    stpdId: serviceId,
    userId: ctx.CurrentUser.Id,
    projectId: projectId,
    classId: null,
    status: DocumentStatus.Received,
    usage: UsageType.Inbox,
    masterid: null,
    comment: "SDK upload",
    externalId: $"EXT-{Guid.NewGuid():N}",
    result: null, resultId: null, resultIndex: null,
    guid: Guid.NewGuid(),
    data: fileParam
);

var doc = upload?.Result?.FirstOrDefault();
```

Multi-file uploads — simplest approach: parallelize single-file calls
```csharp
var files = new[] { "inv1.pdf", "inv2.pdf", "inv3.pdf" };

var tasks = files.Select(async path =>
{
    var bytes = await File.ReadAllBytesAsync(path);
    using var ms = new MemoryStream(bytes);
    var f = new FileParameter(ms, Path.GetFileName(path), "application/pdf");

    var resp = await ctx.DocumentClient.UploadFileAsync(
        stpdId: serviceId,
        userId: ctx.CurrentUser.Id,
        projectId: projectId,
        classId: null,
        status: DocumentStatus.Received,
        usage: UsageType.Inbox,
        masterid: null,
        comment: $"Bulk upload {Path.GetFileName(path)}",
        externalId: null,
        result: null, resultId: null, resultIndex: null,
        guid: Guid.NewGuid(),
        data: f
    );
    return resp?.Result?.FirstOrDefault();
});

var uploadedDocs = (await Task.WhenAll(tasks)).Where(d => d != null).ToList();
```

!!! tip
    - For very large batches, consider chunking (e.g., groups of 20–50) to stay within rate limits.
    - Use a small delay or jitter between batches for smoother throughput under load.

---

## 3) Common statuses and usages

Statuses you’ll see most:

- Received — newly uploaded, not processed yet
- Queued — ready/queued for processing
- Processing / Verifying — in progress (server‑side)
- Processed — processing done (all rules passed or interim processed)
- Verification — requires human review (HITL)
- Error — processing failed

Usages (folders):

- Inbox — incoming documents
- Outbox — results/finals
- Training — documents used to train models
- Definition/Label — configuration and labelling stages (for services that support training)
- System — internal templates and assets

!!! tip
    Your solution may use additional statuses/usages to express nuances of your workflow.

---

## 4) Update status, externalId, and other metadata

Update via DocumentClient.UpdateAsync by modifying the DocumentViewModel you’ve fetched.

Set status and externalId
```csharp
var docResp = await ctx.DocumentClient.GetDocumentAsync(docId);
var d = docResp.Result;

d.Status = DocumentStatus.Verification;    // routed to human review
d.ExternalId = "ERP-456789";               // link to your back office
d.Comment = "Flagged for manual QC";

var updated = await ctx.DocumentClient.UpdateAsync(d);
```

Move a document between usages (Inbox → Outbox) typically happens as a result of processing. If you need to explicitly move documents across services or projects, see copy/move operations (covered in advanced topics).

---

## 5) Basic polling pattern (resilient, with backoff)

Processing is asynchronous. This pattern waits for a terminal state (Processed, Verification, Error, etc.) with exponential backoff and a timeout.

```csharp
async Task<DocumentViewModel?> WaitForTerminalAsync(Context ctx, int docId, TimeSpan timeout)
{
    var sw = System.Diagnostics.Stopwatch.StartNew();
    var delay = TimeSpan.FromSeconds(2);

    while (sw.Elapsed < timeout)
    {
        var r = await ctx.DocumentClient.GetDocumentAsync(docId);
        var d = r?.Result;
        if (d == null) return null;

        if (d.Status is DocumentStatus.Processed
            or DocumentStatus.InterimProcessed
            or DocumentStatus.Verification
            or DocumentStatus.Error
            or DocumentStatus.CustomProcessed  // depending on your flows
            or DocumentStatus.CustomError)
            return d;

        await Task.Delay(delay);
        delay = TimeSpan.FromSeconds(Math.Min(delay.TotalSeconds * 1.6, 30));
    }
    return null;
}
```

Trigger processing and wait:
```csharp
// Start processing this document
await ctx.ServicesClient.ProcessAsync(
    userId: ctx.CurrentUser.Id,
    projectId: projectId,
    stpdId: serviceId,
    docIds: new() { doc.Id }
);

// Wait up to 3 minutes
var final = await WaitForTerminalAsync(ctx, doc.Id, TimeSpan.FromMinutes(3));
if (final == null) Console.WriteLine("Timeout waiting for processing.");
else Console.WriteLine($"Final status: {final.Status}");
```

Tip (production)
- Prefer webhooks/events to avoid polling at scale. Polling is fine for demos, small jobs, or as a fallback.

---

## Troubleshooting

- No results returned
    - Verify projectId/serviceId, usage filter, statuses, and date range.
    - Check permissions for the API key/user.

- Status “stuck” at Received/Queued
    - Confirm processing is enabled for the service.
    - Ensure the document type is supported and the service has the right configuration.

- 401/403 errors
    - Confirm X-Api-Key header value and that the key has access to the project/service.

- Large uploads time out
    - Increase cfg.Timeout.
    - Upload in smaller batches; add jitter between them.

---

## Best practices

- Always log the document Id, projectId, and serviceId for traceability (but never the API key).
- Use ExternalId to link AIForged documents to your ERP/line‑of‑business records.
- Keep GetExtendedAsync filters tight (date ranges, usage, statuses) for predictable pagination and performance.
- Adopt a safe concurrency level for bulk uploads (e.g., 5–10 parallel uploads), then tune.

---

## Next steps

- How‑to: Work Items (HITL) — create/assign/escalate for low‑confidence results
- How‑to: Datasets — use custom datasets for lookups and validation
- Errors & Retries — catch SwaggerException, add backoff for transient failures
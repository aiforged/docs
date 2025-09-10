# 🚀 .NET SDK — Quick Start

Get your first end-to-end flow running in minutes:

- Authenticate with API key
- Discover a Project and Service (or use environment variables)
- Upload a document
- Trigger processing
- Poll until done
- Extract and print results

NuGet: [AIForged.SDK](https://www.nuget.org/packages/AIForged.SDK)

---

## Prerequisites

- .NET 6+ SDK
- An AIForged account with access to at least one Project and Service
- An API key

!!! tip "Unified access"
    No cloud-provider keys or regional setup required. AIForged is a unified access layer—your AIForged account + API key is all you need.

---

## Set environment variables (recommended)

Use environment variables to keep secrets out of source control and switch environments easily.

- AIFORGED_BASE_URL — Production API base URL: https://portal.aiforged.com
- AIFORGED_API_KEY — your API key
- AIFORGED_PROJECT_ID — optional; default project id for samples
- AIFORGED_SERVICE_ID — optional; default service id for samples
- AIFORGED_GROUP_ID — optional; default group for HITL (work items)

PowerShell:
```powershell
$env:AIFORGED_BASE_URL = "https://portal.aiforged.com"
$env:AIFORGED_API_KEY  = "•••"
# Optional shortcuts for this quick start
$env:AIFORGED_PROJECT_ID = "123"
$env:AIFORGED_SERVICE_ID = "456"
$env:AIFORGED_GROUP_ID   = "789"
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

## Create a console app

```bash
mkdir aiforged-quickstart
cd aiforged-quickstart
dotnet new console
dotnet add package AIForged.SDK
```

Replace Program.cs with the code below, then run:
```bash
dotnet run
```

---

## Program.cs (copy/paste)

```csharp
using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using AIForged.API;

class Program
{
    static async Task<int> Main()
    {
        // 1) Read environment variables
        var baseUrl  = Env("AIFORGED_BASE_URL") ?? "https://portal.aiforged.com"; // production
        var apiKey   = Env("AIFORGED_API_KEY")  ?? throw new Exception("AIFORGED_API_KEY not set.");
        int? projectId = TryInt("AIFORGED_PROJECT_ID");
        int? serviceId = TryInt("AIFORGED_SERVICE_ID");

        // Optional: change file to your local test document
        var filePath = "invoice.pdf";

        // 2) Configure the SDK
        var cfg = new Config
        {
            BaseUrl = baseUrl,
            Timeout = TimeSpan.FromMinutes(5)
        };
        await cfg.Init(); // wires HttpClient/handler
        cfg.HttpClient.DefaultRequestHeaders.Add("X-Api-Key", apiKey);

        var ctx = new Context(cfg);

        try
        {
            // 3) Verify we can call the API
            var me = await ctx.GetCurrentUserAsync();
            Console.WriteLine($"Connected as: {me?.Email ?? me?.UserName} ({me?.Id})");

            // 4) Pick a Project and Service (env vars or auto-discover first available)
            if (projectId == null || serviceId == null)
            {
                (projectId, serviceId) = await AutoDiscoverProjectAndServiceAsync(ctx);
                if (projectId == null || serviceId == null)
                    throw new Exception("No accessible Project/Service found. Please set AIFORGED_PROJECT_ID and AIFORGED_SERVICE_ID.");
            }
            Console.WriteLine($"Using ProjectId={projectId}, ServiceId={serviceId}");

            // 5) Upload a document
            if (!File.Exists(filePath))
            {
                Console.WriteLine($"Sample file '{filePath}' not found. Create a PDF with this name or update filePath.");
                return 0;
            }

            byte[] bytes = await File.ReadAllBytesAsync(filePath);
            using var ms = new MemoryStream(bytes);
            var fp = new FileParameter(ms, Path.GetFileName(filePath), "application/pdf");

            var upload = await ctx.DocumentClient.UploadFileAsync(
                stpdId: serviceId,
                userId: ctx.CurrentUser.Id,
                projectId: projectId,
                classId: null,
                status: DocumentStatus.Received,
                usage: UsageType.Inbox,
                masterid: null,
                comment: "Quick Start upload",
                externalId: $"QS-{Guid.NewGuid():N}",
                result: null, resultId: null, resultIndex: null,
                guid: Guid.NewGuid(),
                data: fp
            );

            var doc = upload?.Result?.FirstOrDefault();
            if (doc?.Id == null) throw new Exception("Upload failed: no document returned.");

            Console.WriteLine($"Uploaded doc id: {doc.Id}");

            // 6) Trigger processing
            await ctx.ServicesClient.ProcessAsync(
                userId: ctx.CurrentUser.Id,
                projectId: projectId,
                stpdId: serviceId,
                docIds: new() { doc.Id }
            );
            Console.WriteLine("Processing started...");

            // 7) Poll until done (simple exponential backoff)
            var processed = await WaitUntilProcessedAsync(ctx, doc.Id, TimeSpan.FromMinutes(3));
            if (processed == null)
            {
                Console.WriteLine("Timed out waiting for processing. Check status in Studio.");
                return 0;
            }

            Console.WriteLine($"Final status: {processed.Status}");

            if (processed.Status == DocumentStatus.Error)
            {
                Console.WriteLine("Document ended in Error. Review logs in Studio or via System/Log clients.");
                return 0;
            }

            // 8) Extract and print results
            var extraction = await ctx.ParametersClient.ExtractAsync(processed.Id);
            Console.WriteLine("Results:");
            foreach (var row in extraction?.Result ?? Enumerable.Empty<DocumentExtraction>())
            {
                Console.WriteLine($"- {row.Name}: {row.Value} (conf {row.Confidence})");
            }

            Console.WriteLine("Quick Start completed successfully!");
            return 0;
        }
        catch (SwaggerException ex)
        {
            Console.Error.WriteLine($"API error {(int)ex.StatusCode} {ex.StatusCode}: {ex.Message}");
            Console.Error.WriteLine($"Response: {ex.Response}");
            if (ex.StatusCode == HttpStatusCode.Unauthorized || ex.StatusCode == HttpStatusCode.Forbidden)
                Console.Error.WriteLine("Check X-Api-Key and permissions for the target project/service.");
            return 1;
        }
        catch (Exception ex)
        {
            Console.Error.WriteLine($"Unexpected error: {ex}");
            return 1;
        }
    }

    static async Task<(int? projectId, int? serviceId)> AutoDiscoverProjectAndServiceAsync(Context ctx)
    {
        // Get all projects for the current user
        var projects = await ctx.ProjectClient.GetByUserAsync(ctx.CurrentUser.Id, includeBalance: true);
        var project = projects?.Result?.FirstOrDefault();
        if (project == null) return (null, null);

        // Get services in the selected project
        var services = await ctx.ProjectClient.GetServicesAsync(ctx.CurrentUser.Id, project.Id, null, null);
        var service = services?.Result?.FirstOrDefault();
        if (service == null) return (project.Id, null);

        return (project.Id, service.Id);
    }

    static async Task<DocumentViewModel?> WaitUntilProcessedAsync(Context ctx, int docId, TimeSpan timeout)
    {
        var sw = System.Diagnostics.Stopwatch.StartNew();
        var delay = TimeSpan.FromSeconds(2);

        while (sw.Elapsed < timeout)
        {
            var resp = await ctx.DocumentClient.GetDocumentAsync(docId);
            var d = resp?.Result;
            if (d == null) return null;

            if (d.Status is DocumentStatus.Processed
                or DocumentStatus.InterimProcessed
                or DocumentStatus.Verification
                or DocumentStatus.Error)
                return d;

            await Task.Delay(delay);
            var next = Math.Min(delay.TotalSeconds * 1.5, 30); // cap at ~30s
            delay = TimeSpan.FromSeconds(next);
        }
        return null;
    }

    static string? Env(string name) => Environment.GetEnvironmentVariable(name);
    static int? TryInt(string name) => int.TryParse(Env(name), out var v) ? v : null;
}
```
!!! info "Optional"
    If your project uses implicit usings or a different SDK style, no changes are needed. The code above targets .NET SDK defaults.

---

## What just happened?

1. Initialized the SDK with BaseUrl [https://portal.aiforged.com](https://portal.aiforged.com) and your API key (X-Api-Key).
2. Confirmed connectivity by fetching the current user.
3. Selected a Project and Service (from env vars, or auto-discovered the first available).
4. Uploaded a PDF into Inbox with status Received.
5. Triggered processing for that document.
6. Polled until terminal status (Processed, InterimProcessed, Verification, or Error).
7. Extracted results and printed them.

!!! info "Roles required"
    To create/configure services, you need the Owner, Administrator, or Developer role in the target tenant. Viewing/processing may vary by your organization’s RBAC policies.

---

## Troubleshooting

- 401/403 Unauthorized/Forbidden
    - Verify AIFORGED_BASE_URL and that the API key is valid and active.
    - Ensure the key has access to the Project and Service.

- 404 Not Found
    - Double-check ProjectId/ServiceId; avoid mixing environments (e.g., Studio vs API base).

- Timeouts or large files
    - Increase `Config.Timeout` (e.g., 5–10 minutes for large PDFs).
    - Use retries with backoff for 429/5xx.

- Status remains Received
    - Confirm Auto Execution isn’t disabled.
    - Ensure the Service supports processing path for your document type.

!!! tip "Next steps"
    - Replace filePath with your own sample documents.
    - Add minimal logging (ILogger) and trace IDs to correlate across services.
    - Switch from polling to webhooks for production-scale flows.

---

## Where to next?

- [SDK Overview](index.md)
- [Authentication](/how-to/auth/index.md)
- [Documents (search, upload, status)](/how-to/documents/index.md)
- [Work Items (HITL)](/how-to/work-items/index.md)
- [Datasets](/how-to/datasets/index.md)
- [Error handling and retries](/errors-retries/index.md)
# .NET SDK — How‑to: Authentication

Authenticate to AIForged using:

- API key (recommended for backend and service integrations)
- Credentials (username/password) for first‑party, trusted apps

Production API base URL: https://portal.aiforged.com  
NuGet: [AIForged.SDK](https://www.nuget.org/packages/AIForged.SDK)

---

## TL;DR — which should I use?

- Server‑to‑server/backends: API key via the X‑Api‑Key header.
- First‑party trusted apps: credentials (username/password) using the SDK’s built‑in helpers.

!!! tip "One method per Context"
    Don’t mix API key and credentials/bearer on the same Config/Context. If you need both in one process, create separate Context instances.

---

## Option 1 (recommended): API key via X‑Api‑Key

Environment variables
- AIFORGED_BASE_URL: https://portal.aiforged.com
- AIFORGED_API_KEY: your key

PowerShell
```powershell
$env:AIFORGED_BASE_URL = "https://portal.aiforged.com"
$env:AIFORGED_API_KEY  = "•••"
```

Bash/zsh
```bash
export AIFORGED_BASE_URL="https://portal.aiforged.com"
export AIFORGED_API_KEY="•••"
```

Minimal console snippet
```csharp
using AIForged.API;

var baseUrl = Environment.GetEnvironmentVariable("AIFORGED_BASE_URL") ?? "https://portal.aiforged.com";
var apiKey  = Environment.GetEnvironmentVariable("AIFORGED_API_KEY")  ?? throw new Exception("AIFORGED_API_KEY not set.");

var cfg = new Config { BaseUrl = baseUrl, Timeout = TimeSpan.FromMinutes(5) };
await cfg.Init();

cfg.HttpClient.DefaultRequestHeaders.Add("X-Api-Key", apiKey);

var ctx = new Context(cfg);
var me  = await ctx.GetCurrentUserAsync();
Console.WriteLine($"Connected as: {me?.Email ?? me?.UserName} ({me?.Id})");
```

ASP.NET Core DI pattern
```csharp
using AIForged.API;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddSingleton<Config>(sp =>
{
    var baseUrl = Environment.GetEnvironmentVariable("AIFORGED_BASE_URL") ?? "https://portal.aiforged.com";
    var apiKey  = Environment.GetEnvironmentVariable("AIFORGED_API_KEY")  ?? throw new Exception("AIFORGED_API_KEY not set.");

    var cfg = new Config { BaseUrl = baseUrl, Timeout = TimeSpan.FromMinutes(5) };
    cfg.Init().GetAwaiter().GetResult();
    cfg.HttpClient.DefaultRequestHeaders.Add("X-Api-Key", apiKey);
    return cfg;
});

builder.Services.AddSingleton<Context>();

var app = builder.Build();
app.MapGet("/me", async (Context ctx) =>
{
    var me = await ctx.GetCurrentUserAsync();
    return Results.Ok(new { me?.Id, me?.Email, me?.UserName });
});
app.Run();
```

Rotate the API key at runtime
```csharp
void UpdateApiKey(Config cfg, string newKey)
{
    var headers = cfg.HttpClient.DefaultRequestHeaders;
    if (headers.Contains("X-Api-Key")) headers.Remove("X-Api-Key");
    headers.Add("X-Api-Key", newKey);
}
```

!!! tip "Best practices"
    - Load keys from a secret store (Key Vault, AWS Secrets, etc.).
    - Use IOptionsMonitor/IOptionsSnapshot or a background refresher to call UpdateApiKey when keys rotate.

---

## Option 2 (optional): Credentials‑based sign‑in (username/password)

For trusted, first‑party applications, the SDK can sign in with user credentials and manage access/refresh tokens internally.

Environment variables (example)

- AIFORGED_BASE_URL
- AIFORGED_USERNAME
- AIFORGED_PASSWORD
- AIFORGED_CLIENT_ID
- AIFORGED_CLIENT_SECRET
- AIFORGED_SCOPES (e.g., openid profile api)

Example
```csharp
using AIForged.API;

var cfg = new Config
{
    BaseUrl      = Environment.GetEnvironmentVariable("AIFORGED_BASE_URL") ?? "https://portal.aiforged.com",
    UserName     = Environment.GetEnvironmentVariable("AIFORGED_USERNAME"),
    Password     = Environment.GetEnvironmentVariable("AIFORGED_PASSWORD"),
    ClientId     = Environment.GetEnvironmentVariable("AIFORGED_CLIENT_ID"),
    ClientSecret = Environment.GetEnvironmentVariable("AIFORGED_CLIENT_SECRET"),
    Scopes       = Environment.GetEnvironmentVariable("AIFORGED_SCOPES") ?? "openid profile api"
};

await cfg.Init();
var ctx = new Context(cfg);

// Sign in with credentials; the SDK handles the underlying token exchange.
var currentUser = await ctx.LoginAsync();
Console.WriteLine($"Logged in as: {currentUser?.Email ?? currentUser?.UserName} ({currentUser?.Id})");

// Use the SDK normally…
var projects = await ctx.ProjectClient.GetByUserAsync(ctx.CurrentUserId, includeBalance: true);
Console.WriteLine($"Projects: {projects?.Result?.Count}");

// Refresh tokens later when needed
var refreshedUser = await ctx.RefreshLoginAsync();
Console.WriteLine($"Token refreshed. Expires: {cfg.Expiry}");
```

!!! note "Notes"
    - The SDK sets and maintains bearer tokens on the underlying HttpClient.
    - Do not add X‑Api‑Key when using credentials on the same Context.

---

## Per‑environment setup

- Environment variables per environment (dev/staging/prod).
- appsettings.{Environment}.json + secret store (preferred in production).
- Single Context per process (or per tenant) that is reused.

Example config binding
```json
{
  "AIForged": {
    "BaseUrl": "https://portal.aiforged.com",
    "ApiKey": "use-env-or-secret-store"
  }
}
```

```csharp
var aiforged = builder.Configuration.GetSection("AIForged").Get<AIForgedOptions>();

builder.Services.AddSingleton(sp =>
{
    var cfg = new Config { BaseUrl = aiforged.BaseUrl, Timeout = TimeSpan.FromMinutes(5) };
    cfg.Init().GetAwaiter().GetResult();
    cfg.HttpClient.DefaultRequestHeaders.Add("X-Api-Key", aiforged.ApiKey);
    return cfg;
});
builder.Services.AddSingleton<Context>();

public record AIForgedOptions
{
    public string BaseUrl { get; init; }
    public string ApiKey  { get; init; }
}
```

---

## Security do’s and don’ts

Do

- Keep secrets out of code; use env vars or a secret manager.
- Use least‑privilege keys; rotate regularly.
- Add structured logging (IDs, correlation) — but never log secrets.

Don’t

- Commit keys or passwords to git.
- Mix API key and credentials on the same Context/HttpClient.
- Share one key across unrelated apps/tenants.

!!! note "Header exactness"
    The header name must be exactly `X-Api-Key`.

---

## Troubleshooting

401/403 Unauthorized/Forbidden

- Missing/invalid API key or credentials.
- Insufficient access to the target project/service.
- BaseUrl points to the wrong environment.

404 Not Found

- Wrong IDs (project/service/document) or stale references.

Credentials sign‑in fails

- Check username/password, client id/secret, and scopes.
- Ensure the account is active and not locked.

Key rotation didn’t apply

- Update the existing HttpClient header or rebuild Context.

Example error handling
```csharp
try
{
    var me = await ctx.GetCurrentUserAsync();
}
catch (AIForged.API.SwaggerException ex)
{
    Console.Error.WriteLine($"API error {(int)ex.StatusCode} {ex.StatusCode}: {ex.Message}");
    Console.Error.WriteLine($"Response: {ex.Response}");
}
catch (HttpRequestException ex)
{
    Console.Error.WriteLine($"Network error: {ex.Message}");
}
```

---

## Multi‑tenant pattern

- Keep one Context per tenant (each with its own API key or credentials).
- Resolve tenant, pull the correct Context from a keyed cache, proceed.
- When a tenant secret rotates, update the header or refresh the sign‑in accordingly.
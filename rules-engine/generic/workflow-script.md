# Workflow Script



```csharp
    TModule module { get; set; }
    IProject project { get; set; }
    IParameterDef stpd { get; set; }
    int stl { get; set; }
    BaseOption rule { get; set; }
    ILogger logger { get; set; }
 
    IDocument doc { get; set; }
    IDocumentParameter par { get; set; }
    IParameterDef def { get; set; }
    IVerification verification { get; set; }
    VerificationStep step { get; set; }
```

<pre class="language-csharp"><code class="lang-csharp"><strong>public interface IVerificationModule : IBaseModule
</strong>{
    IDocument Doc { get; }
    IDocumentParameter Par { get; }
    IParameterDef Def { get; }
    IVerification Verification { get; }
    VerificationStep Step { get; }
 
    IDocumentParameter FindParameter(int pdId,
        bool includeVerification = false,
        int? index = null);
    IDocumentParameter FindParameterByParentIndex(int pdId,
        string parentName,
        bool includeVerification = false);
    IDocumentParameter CreateParameter&#x3C;T>(int pdId, T value);
 
}
 </code></pre>

```csharp
 public interface IWorkFlowModule : IVerificationModule, IBaseModule
{
    Task<List<IWorkItem>> CreateDefaultWorkflowAsync(IVerification v,
        List<WorkItemType> enabledWorkItemTypes,
        string comment = "Verification");
 
    IWorkItem CreateWorkItem(IProjectUser pu,
       IVerification ver,
       string comment = null,
       TimeSpan? graceperiod = null);
 
}
```

For more see the information on the [BaseModule](../../custom-code/base-module.md)

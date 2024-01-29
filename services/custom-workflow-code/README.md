# Custom Workflow Code

## Global variables in custom workflow code

```csharp
    TModule module { get; set; }
    IProject project { get; set; }
    IParameterDef stpd { get; set; }
    int stl { get; set; }
    BaseOption rule { get; set; }
    ILogger logger { get; set; }
    
    List<IDocument> docs { get; set; }
```

## The Workflow module is as follows. It derives from BaseModule

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

For more see the information on the [BaseModule](broken-reference).

---
layout: default
title: Custom Workflow Code
parent: Understanding Services
has_children: true
nav_order: 5
---

# Custom Workflow Code

#### Global variables in custom workflow code

```csharp
    TModule module { get; set; }
    IProject project { get; set; }
    IParameterDef stpd { get; set; }
    int stl { get; set; }
    BaseOption rule { get; set; }
    ILogger logger { get; set; }
    
    List<IDocument> docs { get; set; }
```

#### The Workflow module is as follow.  It derives from BaseModule

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


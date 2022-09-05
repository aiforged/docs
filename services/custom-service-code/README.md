# Custom Service Code



#### Global variables in custom service code

```csharp
    TModule module { get; set; }
    IProject project { get; set; }
    IParameterDef stpd { get; set; }
    int stl { get; set; }
    BaseOption rule { get; set; }
    ILogger logger { get; set; }
    
    List<IDocument> docs { get; set; }
```

#### The Custom Service module is as follow.  It derives from BaseModule

```csharp
public interface IBaseServiceModule : IBaseModule
{
    List<IDocument> Docs { get; }
    IParameterDef Def { get; }
    IExecutionParameter pep { get; }
}
```

For more see the information on the [BaseModule](../../custom-code/base-module.md)

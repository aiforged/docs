# IBaseModule Methods

The **IBaseModule** interface exposes methods that can be used in the **Custom Service Code**. The methods are described in the following sections.

## General

### IProject Project { get; }

Returns: The AIForged **Project** the **Custom Service Code** is created in.

Parameters: None.

### IParameterDef ServiceTypePD { get; }

Returns: The AIForged **Service** where **** the **Custom Service Code** is created in.

Parameters: None.

### IParameterDef RootSetting { get; }

Returns: The AIForged **RootSetting** of the **Service** where the **Custom Service Code** is created in.

Parameters: None.

### (T value, float? distance, float? confidence)? GetBestOption(string value, List\<T> data, Func\<T, string> getValue, bool ignoreCase = true) where T : notnull;

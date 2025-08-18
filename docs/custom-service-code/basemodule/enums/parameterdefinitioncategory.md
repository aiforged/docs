# ParameterDefinitionCategory

### Overview

The ParameterDefinitionCategory enum specifies the category a Parameter Definition belongs to. Use it to filter and target settings, services, containers, results, datasets, or extraction fields in your automation.

Underlying type: int

***

### Quick usage

```csharp
// Find a field definition that is categorized as a result/rule
var def = module.FindParameterDef(
    "InvoiceTotal",
    stpdId: stpd.Id,
    categories: new List<ParameterDefinitionCategory?> { ParameterDefinitionCategory.Results }
);
```

***

### Member Reference

#### None

Value: 0

Description: No category specified.

When to use:

* Default or placeholder where the category is unspecified.

***

#### Setting

Value: 1

Description: Definition used as a setting for a service.

When to use:

* Service configuration (e.g., API keys, endpoints, toggles).

***

#### Service

Value: 2

Description: Top-level service definition.

When to use:

* Representing an actual service node in your agent (parent for sub-settings/fields).

***

#### Statistics

Value: 3

Description: Definition used for processing statistics.

When to use:

* KPIs, counters, or metrics captured during processing.

***

#### Results

Value: 4

Description: Definition used for a result or rule for fields.

When to use:

* Output fields and post-processing rule targets you publish to downstream systems.

***

#### Dependency

Value: 5

Description: Dependency parameter used for configuring a service.

When to use:

* Declaring prerequisites (e.g., model references, credentials, feature flags).

***

#### Verification

Value: 6

Description: Verification service configured via parameter definition rules.

When to use:

* Linking a field to a verification provider/process.

***

#### DataSet

Value: 7

Description: Custom dataset reference.

When to use:

* Binding a field/service to a lookup/enrichment dataset.

***

#### PreProcessor

Value: 20

Description: Container for pre-processing settings (data quality improvements before extraction).

When to use:

* Normalization, cleaning, rotation, split/merge, and preparation steps.

***

#### Processor

Value: 21

Description: Container for processing settings.

When to use:

* Core extraction/recognition configuration for the service.

***

#### PostProcessor

Value: 22

Description: Container for post-processing settings (e.g., result shaping and publication).

When to use:

* Rules, formatting, validation, and output mapping after extraction.

***

#### Extraction

Value: 40

Description: Extract/Map fields from OCR data.

When to use:

* Field definitions that are directly mapped from OCR/vision outputs.

***

### Best Practices

* Filter FindParameterDef by Category to quickly narrow down targets (e.g., Settings vs Results).
* Use Category alongside GroupingType to distinguish structure (e.g., Results + Field).
* Treat Service/PreProcessor/Processor/PostProcessor as containers; they typically parent other definitions.
* For verification flows, pair Category=Verification with related rules and providers.

### FAQ

* Q: What’s the difference between Results and Extraction?
  * A: Extraction focuses on mapping OCR outputs; Results represents published/ruled output fields.
* Q: Are Service/PreProcessor/Processor/PostProcessor actual fields?
  * A: They’re container categories—use them to structure and scope underlying definitions.
* Q: Can one definition change category later?
  * A: It can, but prefer stability—changing categories affects filters and downstream logic.


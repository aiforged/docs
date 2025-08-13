# VerificationType

### Overview

The VerificationType enum indicates which part of AIForged created a verification entry on a field/parameter. Use it to understand provenance (who/what set the verification) and to filter or route actions accordingly.

Underlying type: int

***

### Quick usage

```csharp
// Filter to verifications created by a verification service
var items = module.FindVerifications(
    parameter.Id,
    VerificationType.Service,
    status: null,
    provider: null,
    valuefilter: null,
    infofilter: null,
    fromDate: null,
    toDate: null
);
```

***

### Member Reference

#### None

Value: 0

Description: Not specified.

When to use:

* Fallback or legacy entries without a defined source.

***

#### Provider

Value: 1

Description: Set by the upstream service provider (e.g., OCR/AI model output).

When to use:

* Identify validations/results originating from the core extraction/provider layer.

***

#### System

Value: 2

Description: Created by the AIForged system workflow (automation, rules engine hooks).

When to use:

* Distinguish platform-driven checks from user or external additions.

***

#### User

Value: 3

Description: Added by a human user (often via Custom Code or HITL UI).

When to use:

* Audit human decisions and track HITL confirmations/corrections.

***

#### Service

Value: 4

Description: Created by a configured Verification Service.

When to use:

* Attribute outcomes to specialized verification services in your pipeline.

***

#### Training

Value: 5

Description: Added during training workflows.

When to use:

* Separate training artifacts from production verifications.

***

#### RPA

Value: 6

Description: Added by an external RPA process.

When to use:

* Trace and audit Robotic Process Automations contributing to verification.

***

#### API

Value: 7

Description: Created as a result of an external API call.

When to use:

* Attribute verifications to integrations or external systems.

***

#### DataSet

Value: 8

Description: Derived from Custom Dataset data.

When to use:

* Flag verifications that came from dataset lookups or enrichment steps.

***

### Best Practices

* Use VerificationType filters to separate machine, human, and external contributions when analyzing history.
* For auditability, pair VerificationType with VerificationStatus to capture both who/what set it and the outcome.
* In blended flows (provider + service + HITL), order your logic to avoid overwriting important human inputs; append instead.

### FAQ

* Q: What’s the difference between Provider and Service?
  * A: Provider refers to the core extraction/model layer. Service refers to an explicit Verification Service configured to validate or enrich values.
* Q: Should HITL actions be User or System?
  * A: HITL user actions should be User; automated transitions are typically System.

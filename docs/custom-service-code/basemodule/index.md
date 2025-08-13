# ⚙️ BaseModule

### Overview

The **BaseModule** is the central API for all custom logic in AIForged. It serves as the entry point for your scripts—providing rich access to services, documents, fields (parameters), verifications, datasets, work items, and more. All custom code, whether for validation, enrichment, integration, or workflow automation, interacts with AIForged via the `module` object, which exposes the full range of BaseModule methods.

!!! info
    Tip: Use BaseModule as your “toolbox”—it exposes everything you need to read, update, create, search, and orchestrate data, documents, and processes in AIForged custom code.

***

### How to Access BaseModule

All custom code utilities in AIForged receive a pre-initialized `module` object.\
Call any method via `module.MethodName(...)` in your code, whether working at the document, field, or workflow level.

***

### Method Categories

The available methods are organized into the following functional groups:

* General
  &#xNAN;_&#x43;ommon helpers, logging, user lookup, parent service access, and webhooks._
* Parameter Definitions
  &#xNAN;_&#x51;uery, create, and manage field/label definitions and service settings._
* Parameters
  &#xNAN;_&#x57;ork with field/label values, create/update parameters, and handle parent-child field structures._
* Documents
  &#xNAN;_&#x4D;anage document properties, status, attachments, data blobs, copying, moving, and cloning._
* Verification
  &#xNAN;_&#x41;ccess and manage verifications, trigger validation routines, and apply rule engine results._
* Work Items (HITL)
  &#xNAN;_&#x43;reate, assign, and manage Human-in-the-Loop work items, including KPIs and advanced routing._

***

### Best Practices

* Always use the `module` object for all system interactions—never bypass with direct database or service calls.
* Reference parameter and document definitions by ID for reliability.
* Use provided enums and return types to ensure compatibility and clarity.
* Follow the recommended code patterns and utilize the code samples for inspiration.

***

### Quick Start

1. Reference the relevant section below for the method you need.
2. Call your desired method using `module.MethodName(...)` in your custom code.
3. Check the return type and documentation for usage tips.
4. Use logging and error handling as best practice.

***

### FAQ

* **Where do I find the full method signatures and return types?**
  Each method category page below provides complete signatures, parameter descriptions, and usage notes.
* **Can I mix methods from multiple categories in one script?**
  Yes! BaseModule is designed for cross-functional workflows—combine as needed.
* **How do I know which method to use?**
  Start with the General and Parameters pages for most common operations. Use the Verification and Work Items (HITL) sections for more advanced use cases.

***

If you need help with a specific method, or want a deep dive into a particular workflow, just check the subpages—or reach out to the AIForged team for tailored support!
 IgnoreCase Multiline IgnoreCase Multiline



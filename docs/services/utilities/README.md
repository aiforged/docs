---
description: Pre- and post-processing utilities to power up your AIForged agent workflows.
---

# 🛠️ Utilities

### Overview

AIForged Utility Services are in-house developed tools that augment your agent workflows by providing powerful pre-processing and post-processing automation. These utilities are not intended as standalone services—instead, you attach them to core services to clean up, normalize, enrich, route, or validate documents and data at any point in your pipeline.

{% hint style="info" %}
Attach utility services to parent services as pre- or post-processors to build robust, modular, and highly customizable document workflows.
{% endhint %}

The following are the latest and most capable Utility Services available in AIForged:

| Service Name            | Best Suited For                                                     | Quick Link                 |
| ----------------------- | ------------------------------------------------------------------- | -------------------------- |
| AIForged Digitizer      | Convert scans/images to searchable PDFs with visual overlays        | aiforged-digitizer.md      |
| AIForged Image Splitter | Split multi-page documents into per-page images for downstream flow | aiforged-image-splitter.md |
| AIForged PDF Converter  | Normalize any input to PDF; flatten complex PDFs for OCR            | aiforged-pdf-converter.md  |
| Image Pre-Processing    | Clean, deskew, whiten, and optimize images before OCR               | image-pre-processing.md    |
| Copy Documents          | Copy filtered documents to another service within your workflow     | copy-documents.md          |
| Move Documents          | Move (not copy) filtered documents, ensuring a single copy exists   | move-documents.md          |
| Custom Code             | Script custom logic and automation in C#, VB, F#, IronPython, or AI | custom-code.md             |
| Webhooks                | Call external APIs/webhooks on document or agent events             | webhooks.md                |
| Workflow Code           | Advanced HITL and routing automation for verification workflows     | workflow-code.md           |

{% hint style="info" %}
Utility services are designed to be attached as pre- or post-processors; do not configure them as standalone services. Use the Service Flow Configurator or parent service’s view to attach and schedule them.
{% endhint %}

***

### Typical Use Cases

* Pre-process documents before extraction/classification (cleaning, splitting, digitizing).
* Normalize and route documents between services with Copy/Move utilities.
* Enrich, validate, or transform data using Custom Code or external APIs (Webhooks).
* Automate complex HITL assignments and escalation with Workflow Code utilities.
* Build modular, maintainable pipelines that are easy to audit and extend.

{% hint style="info" %}
Need help designing your workflow? The AIForged team can help you select and configure the right utilities for your scenario.
{% endhint %}

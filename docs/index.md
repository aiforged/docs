# AIForged Documentation

Welcome to AIForged—an enterprise‑grade IDP platform that unifies best‑of‑breed AI services (Microsoft, Google, Amazon, Tesseract, and more) behind a single access layer. Ingest documents from the sources you already use, extract and verify data with precision, orchestrate complex workflows, and keep humans in the loop wherever it matters.

---

## What is AIForged?

AIForged is a unified platform for Intelligent Document Processing that combines:

- AI services for OCR, extraction, classification, and vision
- Strong Human‑in‑the‑Loop (HITL) with work items, assignment methods, and SLAs
- Rich pre/post‑processing utilities (digitize, split, normalize, route)
- Developer‑friendly Custom Code and Workflow Code for tailored logic
- Secure, auditable flows with roles, verifications, and detailed status tracking

!!! tip "Who is this for?"
    - Solution owners and architects building reliable IDP pipelines  
    - Developers and integrators scripting custom logic and enrichment  
    - Operations teams running high‑volume verification and QA  
    - Compliance teams needing strong audit and lifecycle controls

---

## Spotlight: LLM Extractor and Generative AI

AIForged’s LLM Extractor elevates extraction beyond templates—use natural language prompts and structured schemas to pull exactly what you need from unstructured and semi‑structured content.

- Natural language prompts with few‑shot examples for rapid iteration
- Schema‑aware outputs (e.g., JSON/object mapping) with strict type validation
- Guardrails and verification rules to ensure safe, compliant responses
- Retrieval grounding with Custom Datasets or document context for higher accuracy
- Hybrid pipelines: blend traditional OCR/layout models with LLM reasoning
- Cost and latency controls with batching, caching, and confidence routing to HITL

!!! info "When to use the LLM Extractor"
    - Unstructured or highly variable documents (contracts, letters, reports)  
    - Rapid prototyping where template training would be too slow  
    - Complex reasoning tasks (cross‑field validation, derived values, narrative extraction)

---

## Key capabilities

- Unified access layer to leading AI providers—no key or region sprawl
- Accurate text extraction (OCR & handwriting) for PDFs and images
- Structured field and table extraction (Extract & Verify services)
- LLM‑powered extraction for unstructured content with schema enforcement
- Object detection, face analysis, and content moderation (Vision services)
- Speech‑to‑Text transcription for audio inputs
- Built‑in scrapers (Email, OneDrive) for automated intake
- Utilities for digitization, conversion, splitting, copy/move routing
- Robust Custom Code and Workflow Code for validation, enrichment, and automation
- Auditable verification trail with statuses, types, and HITL work items

---

## How AIForged works (at a glance)

1. Ingest documents via scrapers or direct upload  
2. Normalize and prepare with utilities (convert, digitize, split)  
3. Extract and verify with AI services (including LLM Extractor and verification services)  
4. Keep humans in the loop with work items (assignment methods, SLAs)  
5. Publish, export, or trigger webhooks and integrations  
6. Monitor, iterate, and continuously improve through datasets, training, and rules

---

## Core concepts

- Documents: Inputs and results with explicit Usage (Inbox, Outbox, Training, etc.) and lifecycle status
- Parameters (fields/labels): Values extracted or set on documents, defined by Parameter Definitions
- Verifications: Bit‑flag statuses and typed entries capturing system/user/service outcomes
- Work items: HITL tasks linked to documents/fields with actions, status, and assignment methods
- Datasets: Custom reference/master data for lookups, deduplication, enrichment, and grounding LLMs
- Utilities: Pre/post‑processors (Digitizer, PDF Converter, Image Splitter, Copy/Move, Webhooks, Custom Code, Workflow Code)
- Scrapers: Automated intake from Email and OneDrive via Microsoft Graph

---

## Quick start

AIForged gives you two equally powerful ways to get started: via Studio (UI) or programmatically via REST, SDKs, and RPA integrations. Pick the path that fits your team and tooling.

### Option A — Studio (fastest to value)

1. Create or open an Agent
2. Add a Service
   - Structured/semi-structured: Extract & Verify or Document Intelligence
   - Unstructured/variable: LLM Extractor (prompt + schema) for GenAI-powered extraction
3. (Optional) Attach Utilities as pre/post-processors
   - PDF Converter, Digitizer, Image Splitter, Copy/Move, Webhooks, Custom Code, Workflow Code
4. Ingest documents
   - Upload directly or configure a Scraper (Email, OneDrive)
5. Process and verify
   - Use HITL work items, assignment methods (Random, HighThroughput, Idle, etc.), and SLAs
6. Publish and integrate
   - Export results, trigger webhooks, or hand off to downstream systems

!!! tip
    For unstructured content (contracts, letters), use the LLM Extractor with a typed schema. Ground prompts with datasets for accuracy and enforce output types for reliability.

### Option B — Programmatic (REST, SDKs, and RPA)

Besides using AIForged Studio, you can create, manage, and report on agents, services, document flows, and HITL flows using:

- REST APIs (foundation)
  - Provision agents/services, ingest documents, orchestrate utilities, drive HITL, and report results
- SDKs
  - .NET (C#), JavaScript / TypeScript for strongly-typed development
- RPA & low-code
  - UiPath activities and Power Automate connector to embed AIForged in existing automations

Typical sequence (high level):
1. Create an agent and add a service (e.g., LLM Extractor or Extract & Verify)
2. Configure parameters, prompts/schemas (LLM), and utilities
3. POST documents for processing
4. Poll or subscribe to results; create/route work items as needed
5. Retrieve structured outputs and metrics for reporting

!!! tip 
    Prefer SDKs for rapid, type-safe development. Use UiPath or Power Automate to orchestrate AIForged steps inside your enterprise automations.

## Choose the right approach

- Structured forms → Template‑oriented extraction (Extract & Verify, Document Intelligence)  
- Semi‑structured (invoices, receipts) → Prebuilt/custom extraction services with table support  
- Unstructured (contracts, policies) → OCR + LLM Extractor + targeted rules + HITL  
- Images with objects/faces/moderation → Vision services  
- Audio → Speech‑to‑Text (Microsoft Speech)

See: [Documents → Document Types](documents/document-types.md)

---

## Best practices

- Identify your document type first; pick the appropriate service and training approach
- Normalize inputs early (PDF conversion, digitize, split) to improve downstream accuracy
- Use verifications and work items where confidence or policy requires human oversight
- Ground LLM prompts with datasets and context; enforce schemas for deterministic outputs
- Track lifecycle with DocumentStatus and UsageType; define clear archiving and retention policies
- Encapsulate complex logic in Custom Code/Workflow Code; keep prompts versioned and testable

---

## Conventions in this documentation

- Admonitions: `!!! note`, `!!! tip`, `!!! warning`, `!!! info` call out important guidance
- Enums and APIs: Values are shown with explicit numeric values where applicable
- Code snippets: Provided in C# unless otherwise stated; align to BaseModule APIs
- Links: Relative links to sections/pages within this site

---

## Where to go next

- Documents  
  - [Document Types](documents/document-types.md)  
  - [Understanding Document Flows](documents/understanding-document-flows.md)  
  - [Document Attributes](documents/document-attributes.md)  
  - [Document Categories](documents/document-categories.md)

- Services  
  - OCR: [Overview](services/ocr/index.md)  
  - Extract & Verify: [Overview](services/extract-and-verify/index.md)  
  - Vision: [Overview](services/vision/index.md)  
  - Speech‑to‑Text: [Overview](services/speech-to-text/index.md)
  - LLM Extractor: [Overview](services/llm-extractor/index.md)

- Scrapers & Utilities  
  - Scrapers: [Email](scrapers/email-scraper.md), [OneDrive](scrapers/onedrive-scraper.md)  
  - Utilities: [Digitizer](utilities/digitizer.md), [PDF Converter](utilities/pdf-converter.md), [Image Splitter](utilities/image-splitter.md), [Copy/Move](utilities/copy-move.md), [Webhooks](utilities/webhooks.md)

- Custom Code & Developer Docs  
  - [Custom Code](custom-code/index.md)  
  - [BaseModule](developers/basemodule/index.md)

---

## Developer tools and integrations

AIForged is built on REST APIs and offers SDKs and RPA integrations so you can automate everything you can do in AIForged Studio—programmatically.

- REST APIs (foundation)
  - Create, manage, and report on agents, services, document flows, and HITL flows via HTTP.
  - Standard OAuth/Bearer authentication patterns.
  - Consistent, versioned endpoints for stability.

- SDKs
  - .NET (C#)
  - JavaScript / TypeScript
  - Available on application for other languages
  - Use SDKs for strongly-typed access to core entities (agents, services, documents, datasets, work items).

- RPA & low‑code integrations
  - UiPath: Activities available to integrate AIForged in attended/unattended automations.
  - Power Automate: Connector/integration to orchestrate flows across Microsoft 365 and line‑of‑business apps.

- What you can do programmatically (besides using Studio)
  - Provision and configure agents and services
  - Ingest documents (directly or via scrapers)
  - Orchestrate end‑to‑end flows (utilities, extraction, verification)
  - Create and route HITL work items
  - Query results, verifications, statuses, and KPIs for reporting
  - Manage datasets for lookups, enrichment, and deduplication

---

## Support, security, and compliance

- Support: Contact the AIForged team for deployment guidance, complex use cases, and best practices  
- Security: AIForged manages provider credentials/regions centrally; apply least‑privilege roles and verifications  
- Compliance: Use archive/deletion policies; log verification transitions for auditability

!!! warning
    Avoid logging sensitive data (passwords, unmasked PII). Use Password/SecureString ValueTypes and ensure encryption at rest where configured.

---

## Release notes & versioning

We regularly ship improvements to services, utilities, and developer APIs. Track changes and upgrade guidance in Release Notes (if included in your deployment). For major changes, we maintain backward compatibility or provide clear migration paths through configuration and enums with explicit numeric values.
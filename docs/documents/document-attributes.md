---
title: Document Attributes
description: Understand the core attributes on a document in AIForged—what they mean, where they’re set, and how to use them in Studio and via REST/SDKs.
---

# ➕ Document Attributes

Document attributes describe the identity, classification, lifecycle, and context of a document as it moves through your AIForged flows. Use them to route work, enforce policy, and correlate with external systems.

!!! tip
    Attributes are different from Parameter values. Attributes describe the document and its lifecycle; Parameters are field values (outputs) extracted by services (e.g., invoiceNumber, total).

---

## Quick reference

| Field | Description | Example |
|---|---|---|
| Id | Unique identifier for the document (system‑generated). | 1234 |
| Master ID | Links related documents into a hierarchical or cross‑source flow. Useful for grouping emails and their extracted attachments, or multi‑step pipelines. | 1234 |
| Filename | The stored filename. | invoice_12345.pdf |
| File Type | File extension. | pdf |
| Content Type | MIME type of the binary. | application/pdf |
| Category | Classification assigned to the document (by a classifier or manually). | Invoice, ID, Payslip |
| Type | Document type used by downstream extractors/definitions. | Invoice (Contoso), Bank Statement |
| Usage | Indicates where the document is used within the flow. Common examples include inbox/outbox/training/result. | Inbox, Outbox, Training, Result |
| Status | The current lifecycle state of the document. | Created, Processing, Completed, Error |
| Comment | Free‑text notes for operators and audit context. | Duplicate detected via checksum |
| Result | Output payload or summary set by services (often OCR/Classification). May reference generated files or JSON. | JSON with extracted fields |
| External ID | Optional, user‑defined identifier for correlating with third‑party systems. | ERP‑INV‑000123 |
| Date Created | When the document was added to AIForged. | 2025‑08‑12 10:14 UTC |
| Date Modified | Last time the document or its data changed (processing, verification, etc.). | 2025‑08‑12 10:21 UTC |

!!! info
    Exact Status and Usage values can vary by solution. Use them consistently for routing and reporting. If you need a canonical list for your tenant, we can add a reference table.

---

## Where these attributes come from

- Id, Filename, File Type, Content Type
    - Set on upload/ingest (manual upload or Scrapers like Email/OneDrive).
- Category, Type
    - Set by Classification or Extract & Verify services (or manually edited when permitted).
- Usage
    - Set/updated by your pipeline as a document moves (e.g., Inbox → Outbox).
- Status
    - Managed by the platform and services during processing (e.g., Created → Processing → Completed/Error).
- Result
    - Set by services that produce outputs (OCR, Classification, Extract & Verify, LLM Extractor via post‑processing).
- External ID
    - Set by you (upload, API, SDKs) to map documents to external systems.
- Master ID
    - Assigned/propagated by flows to group related items (e.g., email parent to child attachments).

!!! tip
    Use External ID to keep a stable link to your ERP/CRM. Use Master ID to group multi‑file work (e.g., email + attachments, split pages, or downstream derivatives).

---

## Relationships and hierarchy

- Parent/child documents
    - Email “parent” → Attachment “children” (created by the Attachment utility).
- Master ID grouping
    - Keeps disparate but related documents linked across services and locations.
- Derived artifacts
    - Utilities (Digitizer, PDF Converter) may create transformed versions while preserving identity and traceability.

---

## Viewing and editing in Studio

- Document page header
    - Shows Id, Filename, Type/Category, Status, Usage, and timestamps.
- Editable fields
    - Comment and External ID (subject to roles/permissions).
- Operational context
    - You’ll often see Parameter values (extracted data) alongside attributes for verification.

!!! tip
    If attributes or actions appear disabled, confirm you’re in the correct Tenant and that your role (Owner, Administrator, Developer) allows edits.

---

## Programmatic access (REST, SDKs, RPA)

AIForged is built on REST APIs and also offers SDKs for .NET and JavaScript/TypeScript, plus UiPath and Power Automate integrations.

- Typical operations
    - Get a document by Id, update Comment/External ID, query by Status/Usage/Category, fetch Results and Parameter values.
- REST pattern (generic)
    - GET/PUT https://{your-endpoint}/api/{documents}/{id}
- SDKs
    - .NET (C#) and JavaScript/TypeScript provide strongly‑typed access to documents, datasets, services, and work items.

!!! tip
    Prefer SDKs for type safety and faster development. Use REST for lightweight scripting or custom integrations. RPA (UiPath/Power Automate) can read/update attributes inside broader enterprise flows.

---

## Related data: DocumentData types

Documents can have multiple data blobs linked to them (originals, processed outputs, training data, etc.). These are typed via DocumentDataType:

| Name | Value | Description |
|---|---:|---|
| Image | 0 | Original document images/data blob/sound file. |
| Result | 1 | Result data produced by processing. |
| Page | 2 | Per‑page data associated with the image. |
| Backup | 3 | Backup of an image. |
| Definition | 10 | Definition/configuration data. |
| Training | 11 | Training artifacts or examples. |

Use these types to retrieve the right artifact (e.g., final JSON, searchable PDF) for your exports or audits.

---

## Best practices

- Keep Category and Type clean and consistent—they drive routing, model selection, and reporting.
- Use Usage and Status to orchestrate flows and dashboards (e.g., “Processing backlog,” “Ready for QA”).
- Populate External ID on ingest to simplify reconciliation with external systems.
- Leverage Master ID to hold multi‑file jobs together across services.
- Add concise Comments for human context—this helps during HITL and audits.

---

## See also

- Document Types
- Understanding Document Flows
- Document Categories
- Understanding the Document Page
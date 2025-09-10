---
title: "📚 .NET SDK — Client References"
description: Quick landing page linking to all .NET SDK client reference documents, with access pattern and recommended reading order.
---

# 📚 .NET SDK — Client References

## Overview

A concise entry point to the .NET SDK client reference pages. Use this index to jump directly to the client you need.

!!! note "Access pattern"
    All clients are accessed via the Context. For example: Context.AuditClient, Context.ProjectClient, Context.WorkItemClient.

---

## In this section

| Client | Purpose | Page |
| --- | --- | --- |
| Account Client | Manage user accounts and authentication context. | [sdk/dotnet/client-reference/account-client](sdk/dotnet/client-reference/account-client) |
| Audit Client | Query the audit trail of system events and data changes. | [sdk/dotnet/client-reference/audit-client](sdk/dotnet/client-reference/audit-client) |
| Classes Client | Manage document categories/classes and classification schemas. | [sdk/dotnet/client-reference/classes-client](sdk/dotnet/client-reference/classes-client) |
| Cloning Client | Configure and run cloning between projects (services, data, options). | [sdk/dotnet/client-reference/cloning-client](sdk/dotnet/client-reference/cloning-client) |
| Contacts Client | Manage contacts used for notifications and alerts. | [sdk/dotnet/client-reference/contacts-client](sdk/dotnet/client-reference/contacts-client) |
| DataSet Client | Create and query custom datasets (schemas, records, filtering, paging). | [sdk/dotnet/client-reference/dataset-client](sdk/dotnet/client-reference/dataset-client) |
| Documents Client | Manage documents, lifecycle (Inbox → Outbox), metadata, and blobs. | [sdk/dotnet/client-reference/documents-client](sdk/dotnet/client-reference/documents-client) |
| Group Client | Manage organizations/tenants, groups, and group memberships. | [sdk/dotnet/client-reference/group-client](sdk/dotnet/client-reference/group-client) |
| Log Client | Retrieve system/application logs for diagnostics and auditing. | [sdk/dotnet/client-reference/log-client](sdk/dotnet/client-reference/log-client) |
| Marketplace Client | Manage membership links and access within user groups. | [sdk/dotnet/client-reference/marketplace-client](sdk/dotnet/client-reference/marketplace-client) |
| Notification Client | Send and manage notifications, contacts, and preferences. | [sdk/dotnet/client-reference/notification-client](sdk/dotnet/client-reference/notification-client) |
| ParamDef Client — Overview | Define and manage parameter definitions, rules, and validation. | [sdk/dotnet/client-reference/paramdef-client/index](sdk/dotnet/client-reference/paramdef-client/index) |
| ParamDef Client — Settings Data | Work with settings/options data (BaseOption and supporting types). | [sdk/dotnet/client-reference/paramdef-client/paramdef-client-options](sdk/dotnet/client-reference/paramdef-client/paramdef-client-options) |
| Parameters Client | Access and manipulate extracted document parameters/values. | [sdk/dotnet/client-reference/parameters-client](sdk/dotnet/client-reference/parameters-client) |
| Projects Client | Manage projects (agents), services, and billing context. | [sdk/dotnet/client-reference/projects-client](sdk/dotnet/client-reference/projects-client) |
| Roles Client | Manage system roles and permissions. | [sdk/dotnet/client-reference/roles-client](sdk/dotnet/client-reference/roles-client) |
| Service Types Client | Catalog and configure service types, pricing, and charges. | [sdk/dotnet/client-reference/service-types-client](sdk/dotnet/client-reference/service-types-client) |
| Services Client | Manage services within projects; trigger processing/training. | [sdk/dotnet/client-reference/services-client](sdk/dotnet/client-reference/services-client) |
| System Client | Access system metadata, diagnostics, and enumerations. | [sdk/dotnet/client-reference/system-client](sdk/dotnet/client-reference/system-client) |
| Verification Client | Manage verification records linked to document parameters. | [sdk/dotnet/client-reference/verification-client](sdk/dotnet/client-reference/verification-client) |
| Wizard Client | Run configuration wizards and stepwise validations. | [sdk/dotnet/client-reference/wizard-client](sdk/dotnet/client-reference/wizard-client) |
| Work Item Client | Manage Human‑in‑the‑Loop (HITL) work items and queues. | [sdk/dotnet/client-reference/workitem-client](sdk/dotnet/client-reference/workitem-client) |

---

## Recommended path

1. Authentication context and configuration are assumed.
1. Start with Projects and Services to understand agents and capabilities.
1. Explore Documents and Verification for core IDP flows.
1. Use Work Item (HITL) for human review pipelines.
1. Add Audit, Logs, and Errors for observability and resilience.

!!! tip "Jump straight to what you need"
    If you already know the client, use the table above to navigate directly.

---

## Related

- [Models & Enums Reference](sdk/dotNET/models-and-enums.md) — shared schemas across clients.
- [How‑to Guides](sdk/dotNET/how-to/index.md) — task‑oriented workflows using these clients.
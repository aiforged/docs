---
title: AIForged Assistant in Studio
description: Use the global AIForged Assistant in Studio for product help, navigation, workspace inspection, selected actions, and exports.
---

# 💬 AIForged Assistant in Studio

The **AIForged Assistant in Studio** is the global, always-available form of the AIForged Assistant.

It is intended to help you across day-to-day work in AIForged Studio, not only during setup.

---

## What it helps with

The AIForged Assistant in Studio can help with:

- general AIForged product questions
- “how do I...” guidance
- navigation to the correct Studio area
- inspection of the current workspace state
- selected scoped actions
- selected downloads and exports

It is best thought of as a **product guide plus workspace-aware assistant**.

---

## Typical uses

### Product guidance

You can ask questions such as:

- How do I set up an invoice flow?
- Where do I configure service settings?
- How do I move documents between services?
- Where do I review extraction results?

### Navigation

You can ask it to take you directly to a relevant area, for example:

- Agents
- Workflow
- Transactions
- Audit
- Logs
- Reports
- Settings
- Documentation

### Workspace inspection

You can ask about the **current workspace**, for example:

- what Agents exist
- what Services exist in an Agent
- what settings a Service has
- what parameter definitions are configured
- what documents are in inbox or outbox
- what datasets exist
- what extracted parameters were returned for a document

### Scoped actions and exports

Depending on your permissions and the current tool scope, you can also ask it to:

- update selected Agent or Service metadata
- change selected Service settings
- manage document categories
- manage dataset records or columns
- open report views
- export or download selected data

---

## Important safety and permission behaviour

The Studio assistant is intentionally **permission-aware**.

That means:

- it should respect your current roles
- it should respect your current Tenant and Group
- it should not perform actions that your current access level does not allow

!!! warning
    If the assistant tells you that it cannot perform an action because of permissions, treat that as a normal product restriction, not as a workaround problem.

### Confirmation for mutations

Read-only inspection and general help do not usually require confirmation.

But when the assistant is about to **change** something, the normal pattern should be:

1. inspect current state
2. summarize the proposed change
3. ask you to confirm it
4. apply it only after explicit confirmation

### Read-only vs mutating behaviour

Typical read-only tasks:

- listing Agents
- listing Services
- reading settings
- reading documents
- reading extracted values
- reading datasets

Typical mutating tasks:

- updating metadata
- changing settings
- deleting records
- renaming dataset columns
- changing categories

---

## Example prompts

### General help

```text
How do I configure a service dependency in AIForged?
```

### Navigation

```text
Take me to the workflow report for this agent.
```

### Workspace inspection

```text
Show me the services in the Accounts Payable agent.
```

```text
What settings are configured on the invoice extraction service?
```

```text
List the datasets available for this service.
```

### Scoped changes

```text
Rename this service to Invoice Extraction v2.
```

```text
Disable this service.
```

```text
Add a new document category called Credit Note.
```

### Downloads and exports

```text
Download document 123.
```

```text
Export the workflow data for this agent as CSV.
```

---

## Best practices

- Be clear about whether you want **information**, **navigation**, or an **action**.
- Mention the Agent or Service name when it helps disambiguate the request.
- Confirm important mutations carefully before accepting them.
- Use the assistant for fast inspection, then validate the result in the normal Studio view when needed.

---

## Availability

The Studio assistant depends on the relevant assistant configuration being available in the current host environment.

If assistant services are not configured or temporarily unavailable, the assistant may not be able to respond or complete actions.

---

## Related pages

- [AIForged Assistant](index.md)
- [New Agent Assistant](new-agent-assistant.md)
- [Prompt Designer Assistant](prompt-designer-assistant.md)
- [Agents](../agents/index.md)
- [Documents](../documents/index.md)
- [Service Flow Configurator](../service-flow-configurator.md)
- [Wallets and Billing](../transactions.md)

---
title: Prompt Designer Assistant
description: Use the AIForged Assistant to design, refine, compare, and apply prompts and schemas for LLM-driven services.
---

# 🧠 Prompt Designer Assistant

The **Prompt Designer Assistant** is the AIForged Assistant form focused on **prompt and schema design**.

It helps you improve extraction prompts, schema structure, and prompt-related reasoning without needing to rewrite everything manually each time.

---

## What it helps with

The Prompt Designer Assistant is especially useful when you need to:

- draft a new prompt for an LLM-based service
- improve an existing prompt
- refine a JSON or structured schema
- compare prompt changes before applying them
- iterate on extraction behaviour after testing real documents
- accelerate prompt work during new-agent setup

---

## Where it fits best

Use the Prompt Designer Assistant when working with:

- **LLM Extractor**
- other LLM-driven service flows where prompt quality matters
- prompt/schema work surfaced by the **New Agent Assistant**

See: [LLM Extractor](../services/extract-and-verify/llm-extractor.md)

---

## Typical workflow

1. Open the relevant service’s prompt configuration area.
2. Launch the Prompt Designer Assistant.
3. Describe what the prompt should extract, validate, or produce.
4. Review the proposed prompt and schema changes.
5. Compare differences before applying them.
6. Apply or save the changes.
7. Test the result on representative documents.
8. Iterate until the output is stable enough for production use.

---

## What to include in your request

To get better suggestions, include:

- what the document is
- what fields or tables you need
- what output format you want
- required validation or formatting rules
- how missing values should be handled
- any important edge cases

### Example

```text
Improve this invoice extraction prompt so it always returns valid JSON, normalizes invoice dates to ISO format, and returns null instead of guessing when a field is missing.
```

### Another example

```text
Design a schema for a bank statement extractor that includes account holder, statement period, closing balance, and transaction rows with date, description, debit, credit, and running balance.
```

---

## Review before apply

A good prompt suggestion is still only a suggestion.

Before applying changes, review:

- field names
- required vs optional values
- null-handling rules
- table structure
- date and currency formatting
- whether the prompt is explicit enough about returning valid JSON

!!! warning
    Always test prompt and schema changes against real or representative documents before rolling them out broadly.

---

## Prompt diffs and apply flow

The Prompt Designer Assistant is intended to make prompt changes easier to review.

That means you should expect a workflow where you can:

- see the current prompt or schema
- compare it with the suggested version
- apply only after review
- save once you are happy with the result

This is particularly helpful when multiple prompt iterations are being tried quickly.

---

## Prompt design during new-agent setup

When the **New Agent Assistant** generates a blueprint that includes LLM services, prompt work can be surfaced as part of that planning flow.

In practice, this means:

- the new-agent flow can identify prompt work that still needs design
- prompt design status can be shown while the blueprint is being refined
- prompt work can then be refined more directly through the Prompt Designer Assistant experience

See: [New Agent Assistant](new-agent-assistant.md)

---

## Best practices

- Tell the assistant what the output must look like.
- Be explicit about JSON structure.
- Tell it when to return **null** instead of guessing.
- Separate header extraction, line-item extraction, and derived-value logic when the use case is complex.
- Add examples for edge cases when the document type varies significantly.
- Keep prompts deterministic where production reliability matters.

---

## Permissions and access

Prompt editing still depends on your normal AIForged permissions.

If prompt actions are unavailable, confirm that you have the correct role in the current Tenant and Group for the target service.

---

## Related pages

- [AIForged Assistant](index.md)
- [New Agent Assistant](new-agent-assistant.md)
- [AIForged Assistant in Studio](studio-assistant.md)
- [LLM Extractor](../services/extract-and-verify/llm-extractor.md)

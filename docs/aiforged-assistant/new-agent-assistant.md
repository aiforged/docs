---
title: New Agent Assistant
description: Use the AIForged Assistant in the new-agent experience to turn a natural-language requirement into an Agent, service flow, and initial configuration.
---

# ✨ New Agent Assistant

The **New Agent Assistant** is the AIForged Assistant form focused on **creating and planning a new Agent**.

Instead of manually creating every service and connection from scratch, you can describe what you want in natural language and let the assistant build an initial plan for you.

---

## What it helps with

The New Agent Assistant is designed to help you:

- create a new Agent faster
- choose a sensible starting structure
- propose a service flow based on your description
- suggest service settings and configuration direction
- suggest document categories
- suggest prompt and schema work for LLM-based services
- review a generated blueprint before committing changes

!!! tip
    The more specific your requirements are, the better the assistant can shape the initial Agent and flow.

---

## Typical workflow

A typical New Agent Assistant flow looks like this:

1. Open the **new-agent** experience.
2. Describe the solution you want to build.
3. Optionally start from one of the assistant’s quick-start ideas or templates.
4. Let the assistant generate a proposed **Agent blueprint**.
5. Review the blueprint preview.
6. Adjust the proposal through follow-up prompts.
7. Confirm and **commit** the blueprint when it looks correct.
8. Validate the created Agent, Services, prompts, categories, and links.

---

## What the blueprint usually covers

The assistant’s proposed blueprint can include:

- Agent name and description
- top-level services
- pre-processing or post-processing utilities
- child or dependency services where appropriate
- service links and flow order
- document categories
- prompt and schema design work for LLM-based services
- suggested service settings

This gives you a structured starting point before anything is finally applied.

---

## What to tell the assistant

When asking the New Agent Assistant to build something, try to include:

- the **business goal**
- the **document types** involved
- the **input source**
- the **target outputs**
- any required **verification or HITL** steps
- any needed **utilities**
- any external **routing, exports, or webhooks**

### Example

```text
Build an agent that reads invoices from email, classifies invoice vs statement, extracts invoice header fields and line items, validates supplier names against a dataset, and sends low-confidence items to verification.
```

### Better example

```text
Build an agent for AP invoice automation. Input comes from a shared mailbox. We need email scraping, attachment handling, invoice classification, invoice extraction, supplier lookup against a custom dataset, and a verification step for low-confidence totals or missing invoice numbers. The final result should be available in outbox and ready for export.
```

---

## Quick-start templates and starter prompts

The New Agent Assistant can also help you get started with **quick-start patterns** instead of an empty prompt.

These are useful when:

- you want a fast starting point
- your use case matches a common intake/extraction pattern
- you want to learn how AIForged composes a working flow

A quick-start path is usually best treated as a **starting draft**. Review the generated blueprint before committing it.

---

## Prompt design during new-agent setup

When your new Agent includes LLM-based services, the New Agent Assistant can also coordinate early prompt work.

That means it can:

- identify where prompt design is needed
- queue or suggest prompt/schema design work
- surface prompt design progress in the blueprint preview
- hand prompt refinement off to the **Prompt Designer Assistant** workflow where needed

See: [Prompt Designer Assistant](prompt-designer-assistant.md)

---

## Commit and confirmation

A generated blueprint is not the same thing as a finished Agent.

Before changes are applied, review:

- Agent metadata
- service order
- dependencies
- categories
- prompt design notes
- settings that could materially affect behaviour

!!! warning
    Treat the commit step as the moment where the proposed design becomes real configuration. Review carefully before committing.

After commit, validate the result in the normal Studio views.

---

## After commit: what to check

Once the assistant has created or updated the Agent, check:

1. the **Agent card and Agent view**
2. the **Service Flow Configurator**
3. service-specific **settings**
4. **parameter definitions** and field structures
5. **prompt and schema** content for LLM services
6. **document categories**
7. any required **dataset links**, utilities, or webhooks

See also: [Service Flow Configurator](../service-flow-configurator.md)

---

## Permissions and context

The New Agent Assistant still operates within your normal AIForged access model.

That means:

- your current Tenant matters
- your current Group matters
- your current roles still control what can actually be created or updated

If you can create a blueprint but cannot commit it, check:

- whether you are in the correct Tenant
- whether you have **Owner**, **Administrator**, or **Developer** access where required
- whether related services or datasets are visible in the current context

---

## Best practices

- Start with a clear business outcome, not just a tool name.
- Be specific about document types and desired outputs.
- Use the blueprint as a collaboration aid, not as an unquestioned final design.
- Validate prompt-heavy services before processing large volumes.
- Process a small representative batch first.

---

## Related pages

- [AIForged Assistant](index.md)
- [Prompt Designer Assistant](prompt-designer-assistant.md)
- [AIForged Assistant in Studio](studio-assistant.md)
- [Agents](../agents/index.md)
- [Service Flow Configurator](../service-flow-configurator.md)
- [Getting Started](../getting-started.md)

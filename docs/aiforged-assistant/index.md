---
title: AIForged Assistant
description: Understand the AIForged Assistant across Studio, including the New Agent Assistant, the Prompt Designer Assistant, and the global in-app AIForged Assistant.
---

# 🤖 AIForged Assistant

The **AIForged Assistant** is available in multiple forms across AIForged Studio. Each form is designed to help you move faster, reduce configuration effort, and keep setup work closer to the place where you are already working.

At a high level, the AIForged Assistant currently appears in three main forms:

| Form | Best used for | Where it appears |
| --- | --- | --- |
| **New Agent Assistant** | Turning a natural-language idea into an Agent, service flow, and initial configuration | Inside the new-agent setup experience |
| **Prompt Designer Assistant** | Drafting and refining prompts and schemas for LLM-driven services | Inside prompt configuration and prompt-design flows |
| **AIForged Assistant in Studio** | General product help, navigation, workspace inspection, selected actions, and exports | From the main Studio app bar |

---

## What all assistant forms have in common

### Tenant and group awareness

All assistant forms work inside your **current Studio context**.

That means:

- your selected **Tenant** matters
- your selected **Group** matters
- your current **roles and permissions** still apply

!!! warning
    If you are in the wrong Tenant or Group, the assistant may not be able to see, open, edit, or create the items you expect.

### Permissions still apply

The assistant does **not** bypass normal AIForged permissions.

If your current role cannot perform an action manually, the assistant should not be able to perform it on your behalf either.

Examples:

- If you cannot edit a service, the assistant should not edit that service.
- If you cannot manage dataset columns, the assistant should not change them.
- If you cannot download documents, the assistant should not export or download them.

### Confirmation for mutating actions

Where the assistant can make changes, important actions should still be **explicitly confirmed**.

Typical pattern:

1. Ask the assistant for help.
2. Let it inspect the current workspace state.
3. Review the proposed change.
4. Confirm the exact action.
5. Let the assistant apply it.

### Documentation-backed help

For general product questions, the assistant is intended to answer using the latest available **AIForged documentation context** instead of relying only on static built-in guidance.

This is especially useful for:

- setup questions
- workflow questions
- feature questions
- navigation questions
- “how do I...” questions

---

## Which assistant should I use?

### Use the **New Agent Assistant** when you want to:

- create a new Agent faster
- describe a solution in natural language
- generate an initial service flow and setup plan
- review a blueprint before committing it
- accelerate early prompt and schema setup

See: [New Agent Assistant](new-agent-assistant.md)

### Use the **Prompt Designer Assistant** when you want to:

- improve an LLM prompt
- design or refine a schema
- compare suggested prompt changes before applying them
- iterate on extraction instructions without rewriting everything manually

See: [Prompt Designer Assistant](prompt-designer-assistant.md)

### Use the **AIForged Assistant in Studio** when you want to:

- ask product questions
- navigate to the correct page or view
- inspect Agents, Services, documents, settings, datasets, and extracted results
- perform selected scoped actions with confirmation
- request a download or export

See: [AIForged Assistant in Studio](studio-assistant.md)

---

## Recommended workflow

A practical way to use the AIForged Assistant across Studio is:

1. **Start in the New Agent Assistant**
    - describe the solution you want to build
2. **Review the generated plan or blueprint**
    - confirm the service flow, settings, and categories
3. **Refine prompts with the Prompt Designer Assistant**
    - improve prompt quality and schema structure where needed
4. **Use the global AIForged Assistant in Studio**
    - inspect the workspace, navigate quickly, and perform selected follow-up actions
5. **Validate with real documents**
    - process a small batch first and adjust before scaling up

---

## Good to know

- The assistant helps you work faster, but it does not replace solution design review.
- Prompt and schema suggestions should still be tested with representative documents.
- Permission denials are a normal part of secure operation, not an assistant failure.
- The different assistant forms complement one another rather than replacing one another.

---

## Related pages

- [New Agent Assistant](new-agent-assistant.md)
- [Prompt Designer Assistant](prompt-designer-assistant.md)
- [AIForged Assistant in Studio](studio-assistant.md)
- [Agents](../agents/index.md)
- [Service Flow Configurator](../service-flow-configurator.md)
- [LLM Extractor](../services/extract-and-verify/llm-extractor.md)
- [User Profile](../user-profile.md)

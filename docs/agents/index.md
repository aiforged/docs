---
title: Agents
description: Understand what Agents are in AIForged, how to create them, and how the AIForged Assistant can accelerate new-agent setup.
---

# 💡 Agents

## Overview

Agents in AIForged are the top-level containers for your solutions.

An Agent typically contains:

- one or more AI Services
- service flow links and processing order
- document categories
- configuration, prompts, and parameter definitions
- user access scoped by your Tenant, Group, and role assignments

A single Agent can represent an entire business solution, such as:

- invoice automation
- claims processing
- identity verification
- contract extraction
- mailroom intake and routing

---

## Why Agents matter

Agents help you keep a solution together.

They provide the boundary for:

- service organisation
- permissions and visibility
- document flow design
- configuration and maintenance
- reporting and lifecycle management

!!! tip
    Think of an Agent as the solution container, and Services as the processing steps inside that solution.

---

## Create an Agent manually

Creating an Agent in AIForged Studio is straightforward.

1. From the home or Agents view, click **Create a new agent**.
2. Choose whether to:
    - create a blank Agent, or
    - start with an initial Service
3. Enter the Agent name and optional description.
4. Open the Agent and continue configuring the Services and flow.

If you start with an initial Service, you can continue in the normal configuration views or open the [Service Flow Configurator](../service-flow-configurator.md) to build the rest of the solution visually.

---

## Create an Agent with the AIForged Assistant

If you want to move faster, use the **AIForged Assistant** instead of starting from a blank setup.

The assistant can help you:

- describe the solution in natural language
- generate a proposed Agent blueprint
- suggest Services, utilities, categories, and links
- surface prompt and schema design work
- let you review the proposal before committing it

See:

- [AIForged Assistant](../aiforged-assistant/index.md)
- [New Agent Assistant](../aiforged-assistant/new-agent-assistant.md)

!!! tip
    The New Agent Assistant is especially useful when you already know the business outcome you want, but do not want to create every Service and connection manually.

---

## Disable or delete an Agent

To disable or delete an Agent:

1. Open the Agent card or Agent view.
2. Open the **More agent related actions** menu.
3. Choose the action you want.

### Disable an Agent

Disabling an Agent temporarily stops processing across the Services in that Agent until it is enabled again.

### Delete an Agent

Deleting an Agent permanently removes it from the system.

!!! warning
    Deleting an Agent is destructive. Only delete an Agent when you are certain it is no longer needed.

---

## Permissions and visibility

Your ability to create, update, disable, or delete an Agent depends on:

- the current Tenant
- the current Group
- your assigned role

If actions are unavailable, confirm that you are working in the correct context and that your account has the required access.

See: [User Profile](../user-profile.md)

---

## Related pages

- [Understanding Agents](understanding-agents.md)
- [AIForged Assistant](../aiforged-assistant/index.md)
- [New Agent Assistant](../aiforged-assistant/new-agent-assistant.md)
- [Service Flow Configurator](../service-flow-configurator.md)
- [AI Services](../services/index.md)

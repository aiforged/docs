---
title: "📊 Human Review & Straight-Through Processing"
description: Monitor document journeys, human-review activity, straight-through processing rates, review cases, and operational outcomes across an AIForged Agent or Service.
---

# 📊 Human Review & Straight-Through Processing

The **Human Review & Straight-Through Processing** view is an operational dashboard for understanding how documents move through an AIForged workflow.

It brings together document-journey outcomes and Human-in-the-Loop (HITL) activity so that you can see:

- which document journeys completed successfully
- which journeys required human review
- which journeys completed straight through without review
- which review cases are still open, transferred, escalated, completed, or rejected
- where failures, archived outcomes, and review queues need attention

Use this view when you need to measure operational performance, investigate a particular document journey, or identify where automation can be improved.

!!! tip
    Use this dashboard together with the [HITL Corrections View](hitl-corrections-view.md). This view explains **how journeys and review cases are progressing**; the HITL Corrections View explains **what reviewers changed** in extracted or classified results.

---

## Key concepts

### Document journey

A **document journey** starts with a root input document and includes the linked documents created as it moves through your service flow. One root document can produce more than one journey row when a container creates child documents.

The dashboard uses this journey context to report outcomes across the relevant linked documents rather than treating every output document as an unrelated item.

### Human review

A journey is considered to have **touched human review** when it has one or more related HITL review cases. A review case can be open, transferred, escalated, completed, rejected, or otherwise unresolved.

### Straight-through processing

A **straight-through journey** completed successfully **without touching human review** in the counted scope.

- In an **Agent** view, this considers the linked document journey across the Agent.
- In a **Service** view, the straight-through measure applies to the counted path in that Service; branches in other Services are not counted against that Service's straight-through result.

!!! note
    Rates and counts reflect the current report scope, filters, and root-document page. Use a consistent date range and scope when comparing results over time.

---

## Open the dashboard

Open the dashboard from either the standard **Documents** view or the **LLM Documents** view.

1. Open the relevant Agent or Service.
2. Open **Documents** or **LLM Documents**.
3. Optionally select one or more documents to investigate a narrower scope.
4. In the command bar, select **Open the human review and straight-through processing dashboard**.

The dashboard carries the active context where available, including the Agent, Service, selected documents, date range, category, filename, external ID, and paging scope.

!!! info
    The dashboard action is available when you have **Workflow** access for the current Agent. If the action is not visible, confirm that you are in the correct Tenant and have the required access for that Agent.

---

## Scope and filters

The dashboard can report at two scopes:

| Scope | Use it when you want to |
|---|---|
| **Agent view** | Understand end-to-end outcomes and HITL activity across the selected Agent. |
| **Service view** | Measure outcomes and review activity for one Service in the Agent. |

Use the toolbar to refine the current view:

- **From / To** — limit the reporting date range.
- **Search** — find document names, journey details, review cases, people, statuses, and related identifiers.
- **Open review cases only** — focus on journeys that still have an open review case.
- **Refresh** — reload the current report scope and filters.
- **Root document paging** — move through large result sets or change the page size.

---

## Summary cards

The summary cards provide a quick view of the current report scope.

| Metric | Meaning |
|---|---|
| **Journeys in view** | The document journeys currently loaded after scope, date range, and root-document paging are applied. |
| **Successful journeys** | Journeys that ended successfully across the relevant linked journey. |
| **Successful with review** | Successful journeys that touched human review. |
| **Straight-through journeys** | Successful journeys that completed without human review in the counted scope. |
| **Touched human review** | Journeys with one or more related review cases, whether the cases are open or resolved. |
| **Journeys needing review** | Journeys with an open or pending review state that currently require attention. |
| **Journeys with failures** | Journeys that encountered a processing failure state. |
| **Archived or rejected journeys** | Journeys that were archived or rejected and therefore did not complete successfully. |

### Rates

The dashboard also shows two useful rates:

- **Human review rate** = successful journeys that touched human review ÷ successful journeys.
- **Straight-through rate** = straight-through journeys ÷ total journeys in the current view.

A rising straight-through rate can indicate that classification, extraction, prompts, rules, and upstream document preparation are improving. A rising human-review rate can identify a workflow that needs investigation or additional capacity.

---

## Dashboard tabs

### Document journeys

The **Document journeys** tab is the best starting point for operational investigation.

It shows each journey's:

- input document and category
- current document status and completion time
- result-document count
- straight-through result
- whether human review was needed
- current review outcome, latest review status, and latest activity
- concise journey summary

Select a row to open **Document journey details**. The detail panel shows the linked document steps and related review cases. You can then open an individual document or focus the **Review cases** tab on the selected journey.

### Journey outcomes

The **Journey outcomes** tab groups journeys by their current outcome, such as successful, needing review, archived, failed, in progress, or another terminal state.

Select an outcome row to focus the **Review cases** tab on the relevant related cases.

### Review queue

The **Review queue** tab summarizes human-review activity by review status. It shows review-item volume, distinct documents, distinct review cases, and whether the status is open.

Use it to identify queue pressure and distinguish normal review activity from transfers, escalations, completed work, and unresolved items.

### Review cases

The **Review cases** tab provides the detailed case-level view. It includes:

- linked document and category
- current review status
- started and last-updated times
- review steps, transfers, escalations, and rejections
- participants and current owner
- current review note or comment
- parent and root-document context

Use this tab for QA, workload investigation, and reviewing the history of a specific HITL case.

---

## Export the current view

Use the **Download** menu in the dashboard toolbar to export the current view.

Available formats:

- **CSV** — exports the currently selected dashboard section as a spreadsheet-friendly file.
- **JSON** — exports the report context, filters, overview, and available dashboard data in a structured format.
- **PDF** — exports the current filtered dashboard view as a management-ready report.

!!! note
    Exports respect the current report scope and filters. Before sharing or comparing reports, confirm the Agent, Service, date range, page, search value, and open-review filter are correct.

---

## Typical workflows

### Investigate a growing review queue

1. Open the dashboard for the affected Service.
2. Enable **Open review cases only**.
3. Open the **Review queue** tab to identify the statuses and volume creating the backlog.
4. Open **Review cases** to inspect owners, transfers, escalations, and comments.
5. Rebalance work, adjust the workflow, or improve the service configuration.

### Improve straight-through processing

1. Open the dashboard at Agent scope for a consistent date range.
2. Review the **Straight-through journeys** and **Successful with review** cards.
3. Use **Document journeys** to identify the categories or routes that repeatedly enter review.
4. Investigate the related cases and documents.
5. Improve the relevant category descriptions, extraction prompt, schema, parameter definitions, rules, OCR, or document preparation.
6. Compare the same scope again after the change.

### Investigate a single document

1. In **Documents** or **LLM Documents**, select the document.
2. Open the Human Review & Straight-Through Processing dashboard.
3. Select the journey row to open its details.
4. Review the linked document steps and related review cases.
5. Open the individual document or review case when you need to take action.

---

## Best practices

- Compare equivalent Agent or Service scopes over consistent date ranges.
- Start with the summary cards, then drill into document journeys before changing workflow configuration.
- Use **Open review cases only** for daily operations; use the full view for trend analysis.
- Treat repeated transfers or escalations as a workflow-design signal, not only a queue-management issue.
- Use the [HITL Corrections View](hitl-corrections-view.md) when you need to understand the specific fields, values, or categories that reviewers are correcting.
- Export a filtered view before major configuration changes so you can measure the impact afterwards.

---

## Related pages

- [Documents](index.md)
- [Understanding the Documents Section](documents-in-service-view.md)
- [Understanding Document Flows](understanding-document-flows.md)
- [HITL Corrections View](hitl-corrections-view.md)
- [Getting Started](../getting-started.md)
- [Workflow Code](../services/utilities/workflow-code.md)

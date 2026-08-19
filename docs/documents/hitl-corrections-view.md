---
title: "🧾 HITL Corrections View"
description: Review Human-in-the-Loop correction activity across documents, identify hotspots, and drill into single-document audit details to improve classifiers, extractors, prompts, and rules.
---

# 🧾 HITL Corrections View

The **HITL Corrections View** helps you understand where human reviewers are correcting or confirming results in AIForged. It gives you a reporting-oriented view over correction activity so you can spot recurring issues, measure intervention volume, and drill into individual documents when you need the exact before/after detail.

This is especially useful when you want to:

- identify fields or categories that need tuning
- measure how often people intervene in a workflow
- compare original extraction output to reviewed values
- find services, users, or document groups with the highest correction activity
- improve prompts, rules, verification setup, or category definitions based on real usage

!!! tip
    Use the HITL Corrections View as an improvement tool, not just an audit screen. It is one of the fastest ways to see where your classifiers, extractors, and verification rules still create avoidable manual work.

---

## What the view shows

The page supports two main reporting scopes:

### 1) Multi-document overview

Use this when you want an aggregated picture across a document set.

Typical outputs include:

- high-level correction counts and intervention metrics
- trend charts over time
- top corrected fields
- correction hotspots by field, service, or reviewer scope
- summary views that help you prioritize tuning work

This mode is best for operational reporting and continuous improvement.

### 2) Single-document audit

Use this when you want to inspect one document in detail.

Typical outputs include:

- field-by-field or row-by-row correction detail
- original extracted values versus reviewed values
- reviewer-related metadata where available
- confidence and verification context where available
- a clearer explanation of what changed on that specific document

This mode is best for QA, investigation, and validating whether a broader trend is caused by a real extraction issue.

---

## How to open it

You can launch the **HITL Corrections View** from several places in AIForged Studio:

- **Documents** view
  - open the **Corrections** action for a broader, multi-document view
  - use the row-level action to open the single-document audit for a specific document
- **LLM Documents** view
  - open the same corrections actions from the LLM-focused document workspace
- **Document Verification** view
  - use the **Insights / Corrections** action to jump directly into the reporting view for the current document context

!!! info
    When launched from another page, the HITL Corrections View carries over the current reporting context where possible, such as the active agent, service scope, selected documents, or document-level focus.

---

## Why it matters

The HITL Corrections View helps answer questions such as:

- Which fields are corrected most often?
- Are reviewers mostly correcting formatting, values, or routing mistakes?
- Which documents or services generate the most manual intervention?
- Are recent prompt or rules changes improving correction rates?
- Do we have a user-specific or service-specific quality trend to investigate?

For teams operating at scale, this turns day-to-day verification work into actionable quality feedback.

---

## Reading the results

A typical correction row represents a reviewed item coming out of extraction and verification history.

Depending on the workflow and service type, the report can show:

- the original value produced before human review
- the final reviewed value after HITL action
- the reviewer who confirmed or changed it
- verification-related status and confidence context
- grouping by document, field, or service scope

!!! note
    Not every service produces the exact same metadata shape. The report will show the most relevant correction and verification details available for the selected scope.

---

## Typical workflow

1. Open the view from **Documents**, **LLM Documents**, or **Document Verification**.
2. Start with the **multi-document overview** to see where correction volume is concentrated.
3. Identify the top corrected fields or the strongest trend spikes.
4. Drill into a **single-document audit** when you need exact before/after context.
5. Use what you find to improve:
   - category wording for classification
   - prompts and schemas for LLM extraction
   - parameter definitions and labels
   - rules-engine thresholds and verification policies
   - upstream OCR or document-normalization steps
6. Re-check the report after changes to confirm whether intervention volume improves.

---

## Practical use cases

### Improve a classifier

If the same document types repeatedly need manual correction or reclassification, review the affected categories and refine:

- category names
- category descriptions
- fallback categories such as **Other**
- downstream routing logic

### Improve an extractor

If a small set of fields is corrected again and again, review:

- prompt wording
- schema design
- field descriptions
- supporting OCR or document preparation
- rules and post-processing logic

### Improve operations

If correction load is concentrated by queue, reviewer, or service scope, use the view to:

- rebalance work
- identify training opportunities
- find documents that need a better pre-processing step
- track whether a recent release improved quality

---

## Best practices

- Start with the overview before drilling into single documents.
- Focus on the **most corrected fields first**—they usually offer the biggest improvement return.
- Validate trends against real examples before changing prompts or rules globally.
- Revisit the view after every meaningful classifier, extractor, or rules update.
- Use it together with release notes and service change logs so you can connect quality shifts to actual platform or configuration changes.

!!! tip
    A recurring pattern of small manual fixes often means the system is close to correct but needs clearer category descriptions, tighter field rules, or better normalization—not a full redesign.

---

## Related pages

- [Documents](index.md)
- [Understanding Document Flows](understanding-document-flows.md)
- [Understanding the Documents Section](documents-in-service-view.md)
- [Human Review & Straight-Through Processing](human-review-straight-through-processing.md)
- [Getting Started](../getting-started.md)
- [LLM Classifier](../services/classification/llm-classifier.md)

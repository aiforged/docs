# WorkItemAction

### Overview

The WorkItemAction enum indicates the specific action a Human-in-the-Loop (HITL) user should take on an assigned work item. Use it to route, display, and measure the nature of HITL tasks across your workflows.

Underlying type: int

***

### Member Reference

#### None

Value: 0

Description: No action specified.

When to use:

* Placeholder or default state before an action is determined.

***

#### Verify

Value: 1

Description: Review and confirm/correct extracted values; mark verification outcomes accordingly.

When to use:

* Standard HITL verification of fields and results prior to publication.

***

#### Investigate

Value: 2

Description: Perform a deeper investigation into issues, inconsistencies, or missing data.

When to use:

* When verification alone isn’t sufficient and additional context or evidence is needed.

***

#### Forensic

Value: 3

Description: Conduct an in-depth analysis to assess anomalies, tampering, or data integrity concerns.

When to use:

* High-scrutiny cases requiring meticulous review and evidence gathering.

***

#### Fraudulant

Value: 4

Description: Handle tasks related to suspected fraud: review, escalate, and record outcomes.

When to use:

* Fraud detection/triage workflows where specialized evaluation is required.

***

#### Classify

Value: 5

Description: Determine or correct the document’s class/category.

When to use:

* When automatic classification needs human confirmation or adjustment.

***

#### QA

Value: 6

Description: Quality assurance review to validate outputs against policies, guidelines, or samples.

When to use:

* Second-pass reviews, calibration checks, or sampling-based audits.

***

#### Reprocess

Value: 10

Description: Trigger or coordinate a reprocessing step (e.g., after configuration tweaks or corrections).

When to use:

* Cases where re-running extraction/processing is required to produce acceptable results.

***

### Best Practices

* Align your routing rules with action semantics (e.g., Verify for standard checks, Investigate for complex issues).
* Use action-specific SLAs and grace periods to prioritize urgent items (e.g., Fraudulant, Forensic).
* Track outcomes and durations by action type to optimize staffing and training.
* Pair WorkItemAction with WorkItemStatus and VerificationType/Status for clear, auditable trails.
 IgnoreCase Multiline IgnoreCase Multiline

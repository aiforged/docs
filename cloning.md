---
title: Cloning
nav_order: 3
---

# Cloning

## Overview

Cloning in AIForged enables teams to quickly duplicate agents and services, supporting a variety of scenarios such as DevOps, testing, demonstrations, and cross-tenant collaboration. This process helps maintain consistency between environments and accelerates development workflows.

---

## Reasons for Cloning

### DevOps

Cloning is a fundamental part of the AIForged DevOps lifecycle. Developers can clone a “Live” agent or service into a “Dev” environment, make changes to settings and training data, and safely test the impact of these changes—without affecting the production agent.

- Enables safe experimentation and validation before deploying changes to production.
- Supports the creation of demo or sandbox copies for training, presentations, or customer walkthroughs.

> **Tip:** Cloning is only available in the Production environment. The cloning scheduler is not enabled on Sandbox or Development environments.

### Demos and Research

Cloning also allows agents and services to be duplicated across tenants or projects for demo or research purposes, supporting collaboration and experimentation in isolated environments.

---

## Cloning Scheduler

Cloning operations are executed as scheduled backend jobs. Once cloning is configured, the scheduler handles execution. Schedules can be set for daily or weekly runs.

- For ad-hoc cloning, schedule it as daily and then disable the schedule after the operation starts.

### Creating and Managing Cloning Schedules

1. **Create Cloning Options**  
   Before setting a schedule, define your cloning options.
2. **Access Service Settings/Definitions**  
   Once options are set, the cloning schedule appears in the service settings or definitions view.

### Modifying Cloning Options and Validation Checks

Adjust cloning options and validation settings as needed. Initiating these changes will update both cloning options and the schedule.

---

## Agent Cloning Options

A wide range of cloning options can be configured, offering granular control over what is cloned. Many options are interdependent and can have complex nested effects.

> **Tip:** Review all options carefully before cloning, especially when cloning user access or sensitive data.

Below are detailed definitions for each agent cloning option, organized by configuration tab.

---

### Source / Destination

Configure which agent and service will be used as the source and destination for the cloning process.

- **Source Agent**  
  *Description:* The agent from which all selected data, services, and configurations will be cloned.
  *Purpose:* This is your starting point for the cloning process.

- **Destination Agent**  
  *Description:* The agent where the cloned data, services, and configurations will be copied to.
  *Purpose:* Choose the target agent that will receive the cloned content.

- **Source Service (Optional)**  
  *Description:* A specific service within the source agent to clone.
  *Purpose:* Use this if you only want to clone a particular service, not the entire agent.

- **Destination Service (Optional)**  
  *Description:* The target service within the destination agent to receive the cloned data.
  *Purpose:* Direct the cloned service content to a specific service in the destination agent.

---

### Cloning Options

Control which features, services, and logs are included in the cloning process.

- **Clone all services**  
  *Description:* Clones all services linked to the source agent.
  *Purpose:* Ensures all connected services are copied to the destination agent.

- **Clone services recursively**  
  *Description:* Also clones any nested or dependent services within each service.
  *Purpose:* Use this to maintain complex service hierarchies.

- **Clone service definition settings**  
  *Description:* Includes all configuration and processing settings for each service.
  *Purpose:* Ensures the destination agent matches the source agent’s setup.

- **Clone document categories**  
  *Description:* Clones all document category structures.
  *Purpose:* Maintains document organization and classification.

- **Clone workflow items**  
  *Description:* Clones workflow items such as tasks and automation steps.
  *Purpose:* Preserves workflow automation in the destination agent.

- **Clone audit logs**  
  *Description:* Copies audit logs from the source agent.
  *Purpose:* Retains a history of changes and activity for compliance or analysis.

- **Clone service processing logs**  
  *Description:* Copies internal processing logs from each service.
  *Purpose:* Useful for troubleshooting and validation in the destination agent.

- **Clone wallets and billing transactions**  
  *Description:* Clones associated billing and wallet transaction records.
  *Purpose:* Use with caution—intended for financial auditing or migration scenarios.

- **Clone interval (days)**  
  *Description:* Sets how often the cloning operation should be scheduled (in days).
  *Purpose:* Automate cloning at regular intervals for continuous sync or backup.

---

### Document Cloning Options

Fine-tune which document types and associated data are cloned.

#### Clone Documents

- **Inbox documents**  
  *Description:* Clone all documents from the agent’s inbox.
- **Outbox documents**  
  *Description:* Clone all documents from the agent’s outbox.
- **Training documents**  
  *Description:* Clone any documents used for agent training.
- **Labelling documents**  
  *Description:* Clone documents used for labeling and annotation tasks.
- **Definition documents**  
  *Description:* Clone documents used to define agent or service behavior.
- **Dataset documents**  
  *Description:* Clone documents used as datasets for processing or training.

#### Clone Documents Data

- **Clone document data**  
  *Description:* Copy all document data (content, metadata, etc.).
- **Document parameters**  
  *Description:* Clone parameters associated with each document.
- **Document parameters verifications**  
  *Description:* Clone verification results for document parameters.
- **Rerun verifications after cloning**  
  *Description:* Re-execute verifications on cloned documents in the destination agent.

#### Clone Other Documents Data

- **Clone soft deleted documents**  
  *Description:* Include documents marked as deleted (soft delete) in the cloning process.
- **Clone documents in descending order**  
  *Description:* Clone documents starting from the most recent to the oldest.
- **Clone from document with...**  
  *Description:* Limit cloning to documents with a specific starting document ID.
- **Clone to document with Id**  
  *Description:* Limit cloning to documents up to a specific ending document ID.

---

### Parameter Definition Options

Fine-tune which parameter definition features are cloned to the destination agent.

- **Clone parameter definition settings**  
  *Description:* Clone all parameter definition settings, including custom code, rules, and logic.
- **Parameter definition categories**  
  *Description:* Specify which parameter categories to include.  
  *Purpose:* Use this to narrow cloning to certain categories for advanced scenarios.

---

### Validation Options

Select the validations to be performed during the cloning process.

#### Agent Validations

- **Destination agent must exist**  
  *Description:* Ensure the destination agent is present before cloning.
- **Don't overwrite existing wallets and billing transactions**  
  *Description:* Prevents cloning from overwriting any existing billing or wallet data.
- **Don't overwrite existing service processing logs**  
  *Description:* Keeps existing service processing logs in the destination agent.
- **Don't overwrite existing workflow items**  
  *Description:* Keeps existing workflow tasks in the destination agent.
- **Don't overwrite existing audit entries**  
  *Description:* Keeps existing audit records in the destination agent.

#### Service Validations

- **Only clone to existing parameter definitions**  
  *Description:* Only clone parameter definitions if they already exist in the destination agent.

#### Document Validations

- **Only re-process document data**  
  *Description:* Restrict reprocessing to document data only (not parameters/verifications).
- **Re-process outbox documents**  
  *Description:* Reprocess outbox documents during cloning.
- **Re-process inbox documents**  
  *Description:* Reprocess inbox documents during cloning.
- **Re-process training documents**  
  *Description:* Reprocess training documents during cloning.
- **Re-process labelling documents**  
  *Description:* Reprocess labelling documents during cloning.
- **Re-process definition documents**  
  *Description:* Reprocess definition documents during cloning.
- **Re-process dataset documents**  
  *Description:* Reprocess dataset documents during cloning.
- **Don't overwrite existing document parameters**  
  *Description:* Keeps existing document parameter data in the destination agent.

---

### Advanced Options

Control additional cloning functions related to cloud or external service providers.

- **Clone provider projects**  
  *Description:* Clone projects and configurations from external providers (e.g., MS Forms, Document Intelligence).
- **Clone provider models**  
  *Description:* Clone AI models from external providers.

---

Tip: Always test cloning in a non-production environment before running in production.
Tip: When cloning user access, review permissions to avoid accidental over-sharing.
Tip: Use document ID filters for large agents to improve performance and avoid unnecessary cloning.
Tip: Regularly review scheduled cloning jobs and disable them when not needed to save resources.
Tip: If unsure about any setting, consult AIForged support or documentation before proceeding.

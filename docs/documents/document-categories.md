# ❓ Document Categories

## Overview

Document Categories define the type of document that has been uploaded (for example, Invoice, ID, Bank-Statement). Categories are shared across all services in an agent and are used throughout AIForged for classification, training, verification, routing, and reporting.

!!! info
    Examples: Invoice, Bank-Statement, Proof-of-Address, ID

!!! info
    Document Categories are shared across all services in the agent.

---

## Where categories are used (and why they matter)

- Classification
    - Categories act as the labels that classifiers learn or use for decisioning.
    - Microsoft Document Intelligence uses categories you define in Step 2 (Categories) and during Analysis uploads to train and apply its internal classifier.

- Extraction and training
    - Services (for example, Document Intelligence) associate trained definitions and label sets with a Category to improve accuracy and apply the right model at run time.

- Upload and processing
    - When uploading to Inbox or Analysis, you can select a Category to steer training or processing flows.
    - Filters in Inbox/Outbox let you view and action documents per Category.

- Reporting and routing
    - Categories enable dashboards and downstream routing (for example, separate queues or export rules per Category).

!!! tip
    Keep Category names business‑friendly and stable over time. Use descriptions to clarify scope or edge cases.

---

## How to create a document category

1. From any service in your agent, open its Service Configuration Wizard and proceed to the Categories step:
    
    ![](../assets/image%20%281%29%20%281%29%20%281%29%20%281%29%20%281%29%20%281%29.png)
    ![](../assets/image%20%282%29%20%281%29%20%281%29%20%281%29%20%281%29%20%281%29.png)

2. In the “Add a new category” textbox, enter the category name (for example, Invoice), then press Enter or click the add 
    ![](../assets/image%20%284%29%20%281%29%20%281%29%20%281%29%20%281%29.png) button:
    
    ![](../assets/image%20%286%29%20%281%29%20%281%29%20%281%29%20%281%29.png)
    ![](../assets/image%20%288%29%20%281%29%20%281%29%20%281%29%20%281%29.png)

!!! info
    The Category description is optional but recommended. It helps other users understand when to use the Category.

---

## How to delete a document category

1. From any service in your agent, open its Service Configuration Wizard and proceed to the Categories step:
    
    ![](../assets/image%20%281%29%20%281%29%20%281%29%20%281%29%20%281%29%20%281%29.png)
    ![](../assets/image%20%282%29%20%281%29%20%281%29%20%281%29%20%281%29%20%281%29.png)

2. Click the delete ![](../assets/image%20%289%29%20%281%29%20%281%29%20%281%29%20%281%29.png) button in the category card for the Category you want to remove:
    
    ![](../assets/image%20%2810%29%20%281%29%20%281%29%20%281%29%20%281%29.png)

!!! note
    Deleting a Category does not delete documents already categorized under it; it removes the Category from future use. If deletion is blocked, reassign or remove dependent items (for example, datasets or service definitions) and try again.

---

## Best practices

- Keep names clear and consistent
    - Use singular, human-readable names (for example, Invoice, Receipt, Bank-Statement).
    - Avoid internal codes in the name; put operational codes in descriptions if needed.

- Separate environments with Categories only when necessary
    - Prefer using Usage and Status for lifecycle separation.
    - Use Categories to express true document types (for example, Invoice vs. Statement), not environments.

- Align Categories with training and verification
    - Ensure the Categories you create match what your services need to train on (for example, Document Intelligence labeling sets).
    - When uploading for Analysis or Training, select the correct Category so data lands in the right bucket.

- Review periodically
    - Archive or consolidate Categories that are no longer needed to keep your agent tidy.

---

## FAQ

- Are Categories global or agent-specific?
    - Categories are agent-scoped and shared across all services within that agent.

- Do Categories affect classification accuracy?
    - Yes. Categories defined in the Wizard and used when uploading for Analysis/Training help classifiers learn and route documents correctly.

- Should I create Categories for Training, Test, and Production?
    - Generally no. Use Categories to describe document types. Use Usage and Status for lifecycle stages (Training/Test/Production).

- Can I rename a Category later?
    - If renaming is permitted in your environment, be mindful of downstream dependencies and retraining implications.

---

## Related links

- Document Attributes: [Click Here](document-attributes.md)
- Understanding Document Flows: [Click Here](understanding-document-flows.md)
- Working in the Service view: [Click Here](documents-in-service-view.md)
- Documents overview: [Click Here](documents.md)
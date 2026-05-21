# 🤖 LLM Classifier

### Overview

The **LLM Classifier** is AIForged's **preferred classification service for new projects**. It uses modern large language models to classify documents and pages by comparing the content against your configured category names and descriptions. This makes it ideal when you want to stand up useful classification quickly without building and maintaining a traditional supervised training set.

!!! info
    The LLM Classifier is the recommended starting point for mixed inboxes, rapidly evolving document sets, and use cases where document classes are easier to define in natural language than by uploading large training batches.

!!! info
    Category names and category descriptions are used directly by the classifier. Keep them specific, distinct, and business-friendly to improve classification quality.

***

### Supported content types

* PDF
* TIFF
* Images (JPEG, PNG)

!!! tip
    If your inputs arrive in other formats, normalize them first with the AIForged PDF Converter for more consistent results.

***

### Possible use cases

* Rapidly classifying mixed business inboxes such as invoices, statements, IDs, application forms, or correspondence.
* Replacing manual triage steps with a category-driven routing layer before extraction.
* Handling categories that change frequently, where updating wording is faster than retraining a classic supervised model.
* Adding a lightweight "Other" catch-all path for documents that do not belong to any primary category.

***

### Why it is the preferred classifier

The LLM Classifier is generally the best first choice when you need classification because it:

* Requires less setup than a traditional supervised classifier.
* Lets you improve accuracy by refining category wording instead of repeatedly re-uploading training samples.
* Performs well on document sets with broad wording differences and more natural-language variation.
* Works especially well when category descriptions clearly explain what belongs in each class.

!!! tip
    Keep the AIForged Classifier for scenarios where you explicitly want a supervised, example-driven model lifecycle. Use the LLM Classifier when you want faster rollout and easier day-to-day tuning.

***

### Service setup

Follow these steps to add and configure the **LLM Classifier** in your agent:

1. **Open the Agent view**  
   Navigate to the agent where you want to add the service.

2. **Add the Service**  
   Click **Add Service** and select **LLM Classifier**.

3. **Open the Service Wizard**  
   Configure the service in the wizard and save your changes when you are done.

4. **Define Categories**  
   Add the categories you want the classifier to recognize. For each category, configure:
    * A clear **Category Name**
    * A concise **Description** explaining what belongs in that category
    * Enough detail to distinguish it from related categories

5. **Process a representative test batch**  
   Run a small mixed set of documents and review the predicted categories before scaling up.

6. **Refine category wording**  
   Adjust category names and descriptions based on real-world results. In most cases this is the fastest way to improve accuracy.

***

### Recommended category-writing pattern

| Configuration area | Recommendation | Why it matters |
| --- | --- | --- |
| Category name | Keep it short, specific, and business-friendly | Clear labels help both users and the model |
| Category description | Use 1-3 sentences describing what belongs in the category | Descriptions are used directly during classification |
| Boundary wording | Mention what makes the category distinct from similar ones | Reduces overlap between categories |
| Catch-all class | Add an **Other** or **Unclassified** category where appropriate | Prevents forced matches into the wrong class |
| Review batch | Test with representative, mixed examples | Reveals overlap and wording issues early |

Example:

```text
Category: Bank Statement
Description: Monthly or ad hoc account statements issued by a bank. Usually contains account balances, transactions, statement periods, and account holder information.
```

***

### Processing documents

Once configured:

1. Upload documents into the service or connect an upstream scraper/utility.
2. Process a small batch first.
3. Review predicted categories and any low-confidence outcomes.
4. Refine category names and descriptions where needed.
5. Route the classified output to downstream extraction or verification services.

!!! tip
    The LLM Classifier is most effective when paired with clean downstream routing—for example, LLM Classifier → Copy/Move Documents → specialized extractor.

***

### Troubleshooting tips

* **Two categories keep getting confused**
    * Rewrite the category descriptions so each one explains a clearer boundary.
    * Remove vague wording that could apply to multiple classes.

* **Too many documents land in the wrong business category**
    * Add or refine an **Other** category so the model has a safe fallback.
    * Make primary category descriptions more explicit.

* **Results are inconsistent across similar documents**
    * Review whether your category descriptions are too broad or too short.
    * Normalize poor-quality inputs with OCR or PDF utilities before classification.

* **Performance is acceptable but quality needs work**
    * Start by improving category wording before redesigning the wider flow.
    * Re-test with a realistic mixed batch rather than isolated sample documents.

***

### Best practices

* Start with the LLM Classifier first for new classification workflows.
* Keep category names mutually exclusive and easy for people to understand.
* Use category descriptions as your primary tuning mechanism.
* Avoid repeating the same wording across multiple categories.
* Review low-confidence or misclassified documents regularly and refine descriptions incrementally.
* Use utilities like Digitizer or PDF Converter when source quality is inconsistent.

***

### Related services

* [AIForged Classifier](aiforged-classifier.md) — supervised, training-sample-based classification
* [AIForged Clustering](aiforged-clustering.md) — unsupervised grouping by similarity
* [ChatGPT Classifier](chatgpt-classifier.md) — prompt-driven classification using a question/answer matrix
* [Microsoft Custom Text Classification](microsoft-custom-text-classification.md) — Microsoft language-model-based text classification

---
description: Document and File Classification by way of an AI Model.
---

# 🔀 Classification

## Overview

Classification services in AIForged use machine learning and advanced AI models to automatically categorize documents and files into predefined groups based on their content. This enables smarter routing, search, automation, and—in the case of the LLM Classifier—logical splitting of combined document packs.

!!! info
    Classification engines can analyze and classify documents on a per-page basis for granular control. The LLM Classifier can additionally use page sequence and content to identify logical document boundaries and return separate assembled documents from one combined input file.

!!! tip
    **Preferred choice for new projects:** Start with the [LLM Classifier](llm-classifier.md). It is the recommended classifier type when you want faster setup, easier tuning, category-driven natural language classification, or semantic document-pack splitting.

AIForged currently provides the following **Classification Service Types**:

| Service Name                      | Best Suited For                                                                 | Quick Link                                                         |
| ---------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| LLM Classifier                     | **Preferred** for new projects, mixed inboxes, document-pack splitting, and category-driven natural language classification | [llm-classifier](llm-classifier.md "mention")                   |
| AIForged Classifier                | General document classification using custom-trained supervised models          | [aiforged-classifier](aiforged-classifier.md "mention")         |
| AIForged Clustering                | Unsupervised grouping of documents based on content similarity                  | [aiforged-clustering](aiforged-clustering.md "mention")         |
| ChatGPT Classification             | AI-powered, context-aware classification using ChatGPT models                   | [chatgpt-classifier](chatgpt-classifier.md "mention")           |
| Microsoft Custom Text Classifier   | Text classification for custom categories using Microsoft’s language models     | [microsoft-custom-text-classification](microsoft-custom-text-classification.md "mention") |

***

## Typical Use Cases

* Automatic document routing and sorting based on content type or topic
* Splitting one combined PDF or TIFF pack into separate logical documents before routing or extraction
* Pre-processing for downstream extraction, verification, or storage workflows
* Supporting compliance by ensuring documents are correctly categorized
* Enhancing search, analytics, and reporting with accurate document tagging

!!! info
    Need a custom classification workflow? Contact the AIForged team to discuss your unique requirements!

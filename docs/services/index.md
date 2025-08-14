# 👓 AI Services

### Overview

AI services in AIForged are specialized processing engines—either first-party or third-party—designed to perform targeted automation and data processing tasks. These services can be flexibly connected using built-in utilities and verification engines to form robust document and data workflows.

***

### Types of AI Services

AIForged offers a variety of AI services, each tailored for specific functions:

* **Scrapers**
  Extract documents or data from specified sources (e.g., mailboxes, folders, cloud storage).
* **Classifiers**
  Identify and classify the type or category of each page or document.
* **Extractors and Verifiers**
  Extract targeted information from documents and verify its accuracy and validity.
* **OCR (Optical Character Recognition)**
  Convert images or scanned documents into machine-readable text.
* **Object Detection**
  Identify and locate objects within images.
* **Speech Recognition**
  Convert spoken words in audio files into text.

> **Tip:** You can combine different AI services to automate complex, multi-step processing scenarios.

***

### AI Services Structure

AI services in AIForged can be configured in several ways to best fit your workflow needs:

* **Sequence**
  Services execute one after another in a defined order.
* **Independent**
  Services operate completely independently from one another.
* **Parallel**
  Multiple services run simultaneously, each working on the same or different data.
* **Tandem**
  Services collaborate closely, with outputs from one service feeding directly into another.

Understanding these structural options is key to leveraging the full power and flexibility of AIForged.

***

### AI Service Operations

AI services can be connected in any order, allowing for customized processing pipelines.

#### Individual AI Services

* Operate independently.
* Do not require input from any other service.
* Suitable for simple, single-step automation tasks.

#### Dependent AI Services

* Rely on additional functionality (such as OCR or custom logic).
* Can be configured to run:
  * **Before Processing:** Pre-processes input to enhance data quality.
  * **After Processing:** Post-processes results for validation or further enrichment.

**Example:**\
If the Microsoft Document Intelligence service does not provide the desired accuracy, you can integrate custom code before or after its execution to improve results.

> **Tip:** Dependent AI services are set up using the same process as standard AI services.

***

### Verification AI Services

Verification AI services are triggered automatically based on specific conditions—such as when a field’s confidence score falls below a set threshold.

* Can be configured and managed within the Rule Engine.
* Enable automated double-checking and human-in-the-loop escalation for improved data quality.

> **Tip:** Use Verification AI services for critical data points where accuracy is essential.



# Document Intelligence – Prebuilt Models

### Overview

The **Document Intelligence – Prebuilt Models** service in AIForged allows you to instantly extract structured data from common document types using Microsoft’s rich library of pre-trained models. With no need for training or manual labelling, you can rapidly process a wide array of standardized forms—including invoices, receipts, ID documents, bank statements, tax forms, and more.

{% hint style="info" %}
Prebuilt Models let you start extracting data from supported forms right away—simply select a model and upload your documents. No training or labelling required.
{% endhint %}

***

### Supported Content Types

* PDF
* Images (JPEG, PNG, TIFF, etc.)

{% hint style="info" %}
If your content is in a different format, use the AIForged PDF Converter to generate a compatible file.
{% endhint %}

***

### Possible Use Cases

* Instantly extract structured data from invoices, receipts, or identity documents.
* Automate business processes such as expense reporting, onboarding, or compliance.
* Digitize and validate standard forms for downstream workflows without model configuration.
* Rapidly prototype or deploy solutions for well-known document types.

***

### Service Setup

Follow these steps to add and configure the **Prebuilt Models** service to your agent:

1. **Open the Agent View**\
   Navigate to the agent where you want to add the service.
2. **Add the Prebuilt Models Service**\
   Click the **Add Service** ![](<../../.gitbook/assets/image (129).png>) button.
3. **Select Service Type**\
   Choose **Document Intelligence – Prebuilt Models** from the available service types.\
   ![](<../../.gitbook/assets/image (15) (1).png>)
4. **Configure the Service Wizard**\
   Open the Service Configuration Wizard.\
   ![](<../../.gitbook/assets/image (16) (1).png>)\
   or\
   ![](<../../.gitbook/assets/image (17) (1).png>)
   * **Step 1: Service**\
     Select your desired **Prebuilt Model** from the dropdown (e.g., Invoices, Receipts, IdDocuments, USPersonalTax, BankStatements, Checks, CreditCards, BusinessCards, Contracts, Layout, and more).\
     ![](<../../.gitbook/assets/image (18) (1).png>)
     {% hint style="info" %} Each prebuilt model is tailored for a specific document type and returns structured key-value pairs, tables, and fields optimized for that format. {% endhint %}
   * **Step 2: Categories**\
     Optionally, create document categories for organizational or workflow purposes.\
     ![](<../../.gitbook/assets/image (19) (1).png>)
   * **Step 3: Verification**\
     Use this step to verify the keys/fields extracted by the selected prebuilt model.\
     ![](<../../.gitbook/assets/image (20) (1).png>)

***

### Service Configuration Settings

Most users can proceed with the default settings. Key configuration options include:

| Setting                      | Description                                                |
| ---------------------------- | ---------------------------------------------------------- |
| Enabled                      | Enable or disable this service.                            |
| Prebuilt Model               | Select the Microsoft prebuilt model to use for extraction. |
| Auto Execution               | Automatically process documents as they are uploaded.      |
| Output Content Type          | Define the output format for extracted data.               |
| Allow Process Table Creation | Enable to create new table definitions for unknown tables. |
| Save OCR Layout              | Save OCR layout including lines and words.                 |

{% hint style="info" %}
No training, labelling, or dataset upload is needed for prebuilt models—just select your model and start processing.
{% endhint %}

***

### Available Prebuilt Models

* **Document**\
  General document extraction (key-value pairs, tables, etc.)
* **Invoices**\
  Extraction of invoice fields, totals, vendor details, line items, and more.
* **Receipts**\
  Extraction of merchant, transaction, and line item information from receipts.
* **IdDocuments**\
  Extraction of information from identity documents (passports, ID cards, driver’s licenses).
* **USHealthInsurance**\
  Extraction from US health insurance cards.
* **USPersonalTax**\
  US personal tax forms (general).
* **USPersonalTaxW2**\
  US IRS W-2 wage and tax statement forms.
* **USPersonalTax1098**\
  US IRS 1098 mortgage interest statement forms.
* **USPersonalTax1098E**\
  US IRS 1098-E student loan interest statement forms.
* **USPersonalTax1098T**\
  US IRS 1098-T tuition statement forms.
* **USMortgage1003**\
  US mortgage loan application (1003) forms.
* **USMortgage1004**\
  US mortgage appraisal (1004) forms.
* **USMortgage1005**\
  US verification of employment (1005) forms.
* **USMortgage1008**\
  US mortgage transmittal summary (1008) forms.
* **USPayStubs**\
  US payroll/pay stub documents.
* **UBankStatements**\
  US bank statements.
* **USChecks**\
  US bank checks.
* **CreditCards**\
  Credit card statements and related documents.
* **USMarriageCertificates**\
  US marriage certificates.
* **Contracts**\
  Legal contract extraction.
* **BusinessCards**\
  Business card extraction (contact details, organization, etc.).
* **OCR**\
  Optical Character Recognition (raw text extraction and layout).
* **Layout**\
  Extraction of tables, lines, and structural layout from documents.

***

### Add and Process Documents

To upload and process documents using the **Prebuilt Models** service:

1. **Open Service**\
   In the Prebuilt Models service, click the **Upload** ![](<../../.gitbook/assets/image (13) (1).png>) button or drag and drop files over the document grid.\
   ![](<../../.gitbook/assets/image (21) (1).png>)
2. **Select Category (Optional)**\
   If you have defined categories, select the appropriate one; otherwise, select **No category**.
3. **Process Documents**\
   After uploading, select the documents to process and click on the **Process** ![](<../../.gitbook/assets/image (10) (1) (1).png>) button.

{% hint style="info" %}
**Tip:** For new services, process a small batch first to verify the results before scaling up.
{% endhint %}

***

### View Processed Documents

* Select **Outbox** in the usage filter in the **Prebuilt Models** service.\
  ![](<../../.gitbook/assets/image (51).png>)
* Open any processed document to view and verify the extracted results.

***

### Troubleshooting Tips

* **Missing or Incorrect Data?**
  * Ensure uploaded documents are clear and legible. Poor quality scans or images reduce extraction accuracy.
  * Confirm the document matches the selected prebuilt model (e.g., don’t use an invoice model for a bank statement).
* **Upload or Processing Errors?**
  * Try re-uploading the document or using a different sample to rule out file-specific issues.
  * Check that your Azure credentials and API version are correct.
* **Performance Issues?**
  * Large batches may take longer to process. Start with a small batch to ensure responsiveness.

***

### Best Practices

* Always select the prebuilt model that best matches your document type for optimal results.
* Use high-quality scans or digital originals.
* Review the extracted data fields for each document type to understand model outputs.
* Keep your Azure Document Intelligence API credentials up to date.

# ChatGPT Classifier

### Overview

The GPT Classifier in AIForged empowers you to categorize documents using advanced language models, without the need for traditional supervised training. Instead, you configure a question and answer matrix linked to your document categories, guiding the model's classification logic.

{% hint style="info" %}
Unlike traditional classifiers, the GPT Classifier does not require uploading training data. Instead, you guide the model’s classification logic by configuring a question and answer matrix linked to your document categories.
{% endhint %}

{% hint style="info" %}
The GPT Classifier is designed for page-by-page classification. Each page is evaluated independently, so your questions should be relevant and answerable for a single page.
{% endhint %}

{% hint style="warning" %}
Due to the nature of "Page by Page" classification (and dependent on the LLM model version and configuration of the Hint and Question Matrixes), ChatGPT classification might not be suited for certain types of lengthy documents.
{% endhint %}

{% hint style="info" %}
GPT services are charged by [Token Usage](https://platform.openai.com/tokenizer).
{% endhint %}

***

### How It Works

* **No Training Required:**\
  The GPT Classifier bases its decision on your configured question and answer matrix, not on uploaded training examples.
* **Question and Answer Matrix:**\
  You define a set of questions and expected answers for each document category. During classification, these questions are posed to the model, and its responses are used to determine the document’s category.
* **Weighting for Accuracy:**\
  The model calculates a score for each category based on how closely its responses match your expected answers.
* **Page-by-Page Classification:**\
  Classification is performed individually for each page within a document.

{% hint style="info" %}
When designing your questions, make sure they are appropriate for single-page evaluation, as each page is assessed separately.
{% endhint %}

***

### Configuration Steps

1. **Service Setup**
   * Create a new GPT Classifier service within your agent by clicking on the **Add Service** ![](<(../../assets/image (26) (1).png>) button.\
     ![](<(../../assets/image (27) (1).png>)
   * No need to upload training data.
2. **Step 2: Hint Matrix (Optional)**
   * Optionally, add a Hint Matrix dataset to provide additional context to the model for more nuanced classification.\
     ![](<(../../assets/image (28) (1).png>)
3.  **Step 3: Define the Question Matrix**

    * In the "QuestionMatrix" step of the wizard, create your question and answer set:\
      ![](<(../../assets/GPT Classifier.png>)
      * **Category:** The document category you want to identify.
      *   **Question:** The prompt or question to ask about the page.

          > **Tip:** Since classification is performed page by page, phrase your questions to be meaningful at the page level.
      * **Expected Answer:** The ideal answer that indicates a match for this category.
      * **Regex:** (Optional) Use a regular expression for advanced answer matching.

    &#x20;_Example: Setting up the Question Matrix for each category in the GPT Classifier wizard._

    > **Tip:** For best results, use 2–3 page-focused questions per category to allow the classifier to accurately weight responses and improve category determination.
4. **Step 4: Define Categories**
   * Add all the document categories you want to classify. Link these to your question matrix.\
     ![](<(../../assets/image (29) (1).png>)

***

### Sample Page-Level Questions

Below are some example questions you can use for typical document categories. Remember, questions should be answerable by reviewing a single page.

| Category       | Example Question                                  | Expected Answer           | Regex            |
| -------------- | ------------------------------------------------- | ------------------------- | ---------------- |
| Invoice        | What type of document is this page?               | Invoice                   | ^Invoice$        |
| Invoice        | Does this page list a total or balance due?       | Yes                       | ^Yes$            |
| Invoice        | Who is the recipient of this invoice?             | \[Recipient Name/Company] | .\*              |
| Purchase Order | What is the primary purpose of this page?         | Purchase Order            | ^Purchase Order$ |
| Purchase Order | Does this page reference items to be ordered?     | Yes                       | ^Yes$            |
| Purchase Order | Is there a PO number on this page?                | Yes or No                 | ^(Yes            |
| Contract       | Does this page contain legal terms or conditions? | Yes                       | ^Yes$            |
| Contract       | Is there a signature or signatory section here?   | Yes or No                 | ^(Yes            |
| Report         | What kind of information is summarized here?      | Financial Report          | ._Report._       |
| Cover Sheet    | Is this page a cover or title page?               | Yes or No                 | ^(Yes            |

{% hint style="info" %}
Tailor your questions to the language, structure, and cues present on a typical page of each category.
{% endhint %}

***

### Best Practices

* **Use 2–3 Page-Level Questions Per Category:**\
  This improves classification accuracy by providing multiple answer points for weighting.
* **Be Specific and Relevant:**\
  Questions should target information that is likely present and clear on a single page.
* **Leverage Regex:**\
  Use regex for flexible answer matching (e.g., matching any PO number format).
* **Test and Iterate:**\
  Try your configuration on a set of sample documents and refine your questions/answers as needed.
* **Minimize Overlap:**\
  Make sure each category's questions are distinct to avoid ambiguous results.

***

### Processing Documents

Once your configuration is complete:

1. Upload documents to your agent’s inbox as usual.
2. The GPT Classifier will automatically use your question and answer matrix to determine the correct category for each document.
3. Review the results and adjust your configuration as needed for continuous improvement.

***

### Troubleshooting Tips

* **Unexpected or Ambiguous Results?**
  * Double-check that your questions are unambiguous and page-appropriate.
  * Ensure expected answers are unique per category.
  * Add or revise questions for categories that are frequently misclassified.
* **Some Pages Not Getting Classified?**
  * Make sure your questions cover the full range of possible page content.
  * Use regex to capture variable answers (e.g., numeric PO numbers, various report titles).
* **Low Confidence or "Unknown" Categories?**
  * Add more or better-targeted questions for those categories.
  * Review sample pages and adjust expected answers/regex to reflect real-world document variations.
* **Performance Issues?**
  * Large documents with many pages may take longer to process. Test with smaller samples first.


# AIForged Classifier

### Overview

The AIForged Classifier is a powerful classification engine that leverages supervised machine learning techniques to identify each page and group documents into their respective classes. It is designed to be cost-effective, reliable, and requires minimal maintenance throughout the agent's lifetime.

> **Tip:** The AIForged Classifier is ideal for automating the organization and classification of documents, saving both time and effort in large-scale document processing tasks.

***

### Before You Start

Make sure you have the following prerequisites:

* At least 5–10 example documents for each class or category you want to classify.
* An agent with sufficient credits to perform training and classification.

***

### Creating an AIForged Classifier

1. **Initialize the Service**
   * Navigate to the agent where you want to add the classifier.\
     ![](../../assets/image%20%284%29%20%281%29%20%281%29%20%281%29.png)
   * Create a new AIForged Classifier service.\
     ![](../../assets/image%20%285%29%20%281%29%20%281%29%20%281%29.png)
2. **Set Up the Classifier**
   * Open the AIForged Classifier wizard within your agent.\
     ![](../../assets/image%20%286%29%20%281%29%20%281%29%20%281%29.png) or ![](../../assets/image%20%289%29%20%281%29%20%281%29%20%281%29.png)\
     ![](../../assets/image%20%288%29%20%281%29%20%281%29%20%281%29.png)
   * Adjust the classifier according to your requirements.
   * Review and apply the recommended settings for optimal results.

| **Setting**         | **Description**                                                                              | **Recommendation**                                                                                                       |
| ------------------- | -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| **Enabled**         | Enable processing in the service.                                                            | On (enabled)                                                                                                             |
| **Auto Execution**  | Automatically process documents in the service as they are added.                            | On (enabled)                                                                                                             |
| **Force PDF Image** | Process PDFs as images only. Removes artifacts or hidden objects for cleaner classification. | Only enabled when experiencing issues with accurate classification. This will increase the training and processing time. |
| **Merge To PDF**    | Group classified pages into individual PDFs based on the detected classes.                   | On (enabled) if you want grouped output; otherwise, off if you want separate documents for each page.                    |

{% hint style="info" %}
Enabling **Force PDF Image** can help if you experience issues with inconsistent or incorrect classification results from scanned or complex PDFs.
{% endhint %}

{% hint style="info" %}
Use **Merge To PDF** if you want each class/category to be output as a consolidated PDF document.
{% endhint %}

***

### Training the Classifier

1. **Define the Classes**
   * Go to the "Categories" step.
   * Add all possible categories (classes) you want the classifier to recognize.\
     ![](../../assets/image%20%2810%29%20%281%29%20%281%29%20%281%29.png)
2. **Upload Training Data**
   * Navigate to the "Training" step.
   * Upload example documents for each class.
   * **Note:** Only one class/category should be uploaded at a time.\
     ![](../../assets/image%20%2811%29%20%281%29%20%281%29%20%281%29.png)
3. **Confirm the Information**
   * Review your categories and training data to ensure accuracy.
4. **Train the Classifier**
   * Start the training process using your uploaded examples and defined categories by clicking on the train ![](../../assets/image%20%2813%29%20%281%29%20%281%29%20%281%29.png) button.\
     ![](../../assets/image%20%2812%29%20%281%29%20%281%29%20%281%29.png)

***

### Processing Documents

* Once the classifier has been successfully trained, you can upload documents to the agent's inbox for automated classification and processing.
* Your AIForged Classifier is now ready to use!

***

### Troubleshooting Tips

* **Classifier Not Performing Well?**
  * Double-check that you have enough training samples (at least 5–10 per class).
  * Ensure each training document is clearly labeled and belongs to only one class.
  * Avoid uploading duplicate or very similar documents across different classes.
* **Training Fails to Start or Complete?**
  * Confirm that your agent has sufficient credits.
  * Ensure your training documents are in supported formats (e.g., PDF, TIFF).
  * Check for any upload errors in the "Training" section.
* **Classifier Not Detecting New Categories?**
  * Make sure all desired categories are added before uploading training data.
  * Retrain the classifier after adding new categories or additional samples.

***

### Best Practices for Optimal Training

* **Use Diverse Examples:**\
  Collect a variety of representative documents for each class to improve classifier accuracy.
* **Regularly Retrain:**\
  Periodically retrain your classifier as you gather new document types or encounter misclassifications.
* **Keep Classes Distinct:**\
  Ensure that classes are well-defined and documents are not ambiguous between categories.
* **Validate with Real Data:**\
  After training, test with real incoming documents to verify and fine-tune classifier performance.
* **Incremental Improvement:**\
  Continuously add new samples for classes that show lower accuracy and retrain as needed.

> **Tip:** Document your categories and training process, so you can maintain and improve your classifier over time.
 IgnoreCase Multiline IgnoreCase Multiline


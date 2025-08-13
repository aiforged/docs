---
description: Retrieve a document's images by its unique identifier.
---

# Get Document Images

**Obsolescence Notice:**\
This activity is marked as obsolete and is scheduled to be deprecated. It is recommended to use the "Get Document Data" activity instead, as the underlying API will soon no longer return results for this activity.

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document for which to retrieve image blob data. This is a required argument.
  * **Service Id** (Obsolete)
    * **Type:**`int`
    * **Description:** The unique identifier of the service where the document is located. This property is no longer used and should not be relied upon.

**Usage**

1. **Setup Activity:**
   * Add the "Get Document Images" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Document Id:** Provide the ID of the document whose images you wish to retrieve.
2. **Execution:**
   * The activity executes asynchronously, retrieving the document's image data blobs based on the specified document ID.
   * It uses the configured API context to access the image data via the document client.
3. **Output:**
   * The activity returns a`List<DocumentDataViewModel>`, representing the image data blobs for the specified document.

**Considerations**

* **Transition to New Activity:** As this activity is deprecated, it is strongly recommended to transition to using the "Get Document Data" activity, which provides similar functionality with more flexibility and continued support.
* **Data Integrity:** Ensure that the document ID is valid and accessible to avoid errors during the retrieval process.
* **Limited Use:** Given its deprecated status, use this activity only if necessary and begin updating workflows to accommodate the recommended replacement.
 IgnoreCase Multiline IgnoreCase Multiline

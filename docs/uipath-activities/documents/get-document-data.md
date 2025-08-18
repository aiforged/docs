---
description: >-
  Retrieve a document's data blobs by its unique identifier and available
  filters.
---

# Get Document Data

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document for which to retrieve blob data. This is a required argument.
  * **Data Types**
    * **Type:**`List<DocumentDataType?>`
    * **Description:** A list of data types to filter the returned data by. This is an optional argument.
  * **Content Type**
    * **Type:**`string`
    * **Description:** The content MIME type to filter the returned data by. This is an optional argument.
  * **Text**
    * **Type:**`string`
    * **Description:** Text to filter the returned data by. This is an optional argument.
  * **Blob Id**
    * **Type:**`int?`
    * **Description:** A specific blob ID to retrieve data for. This is an optional argument.
  * **Page Index**
    * **Type:**`int?`
    * **Description:** A specific page index to retrieve data for. This is an optional argument.
  * **Image Count**
    * **Type:**`int?`
    * **Description:** The maximum number of images/blobs to return. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Document Data" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Document Id:** Provide the ID of the document whose data blobs you wish to retrieve.
   * Optionally, specify any of the following to filter the results:
     * **Data Types:** Filter by the list of specified data types.
     * **Content Type:** Filter by a specific MIME type.
     * **Text:** Filter by specific text content.
     * **Blob Id:** Retrieve data for a specific blob ID.
     * **Page Index:** Retrieve data for a specific page index.
     * **Image Count:** Limit the number of images/blobs returned.
2. **Execution:**
   * The activity executes asynchronously, retrieving the document's data blobs based on the specified criteria.
   * It uses the configured API context to access the data via the document client.
3. **Output:**
   * The activity returns a`List<DocumentDataViewModel>`, representing the filtered data blobs for the specified document.

**Considerations**

* **Data Filtering:** Utilize the optional filters effectively to retrieve only the necessary data, improving performance and reducing processing time.
* **Data Integrity:** Ensure that the document ID and any specified filters are valid and accessible to avoid errors during the retrieval process.
* **Further Processing:** The resulting list of`DocumentDataViewModel`objects can be used for further processing, analysis, or reporting within your workflow.


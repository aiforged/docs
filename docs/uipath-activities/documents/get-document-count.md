---
description: >-
  Retrieve a count of documents from a project/service combination with various
  available filters.
---

# Get Document Count

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the project from which to count documents. This is a required argument.
  * **Service Id**
    * **Type:**`int?`
    * **Description:** The unique identifier of the service associated with the documents. This is an optional argument.
  * **Usage Type**
    * **Type:**`UsageType?`
    * **Description:** Filter by document usage type (e.g.,`UsageType.Outbox`). This is an optional argument.
  * **Document Statuses**
    * **Type:**`List<DocumentStatus>`
    * **Description:** Filter by a list of document statuses (e.g.,`DocumentStatus.Processed`). This is an optional argument.
  * **Class Name**
    * **Type:**`string`
    * **Description:** Filter by document category name. This is an optional argument.
  * **Filename**
    * **Type:**`string`
    * **Description:** Filter by filename. This is an optional argument.
  * **Filetype**
    * **Type:**`string`
    * **Description:** Filter by filetype (MIME types accepted). This is an optional argument.
  * **Comment Filter**
    * **Type:**`string`
    * **Description:** Filter by comment. This is an optional argument.
  * **Result Filter**
    * **Type:**`string`
    * **Description:** Filter by result. This is an optional argument.
  * **Start Date**
    * **Type:**`DateTime`
    * **Description:** Filter from a starting date. This is an optional argument.
  * **End Date**
    * **Type:**`DateTime`
    * **Description:** Filter up to an end date. This is an optional argument.
  * **Document Id**
    * **Type:**`int?`
    * **Description:** Filter by the unique identifier of a specific document. This is an optional argument.
  * **Master Id**
    * **Type:**`int?`
    * **Description:** Filter by the unique identifier of the master/parent document. This is an optional argument.
  * **Result Id**
    * **Type:**`string`
    * **Description:** Filter by result identifier. This is an optional argument.
  * **Result Index**
    * **Type:**`int?`
    * **Description:** Filter by result index. This is an optional argument.
  * **External Id**
    * **Type:**`string`
    * **Description:** Filter by a user-configured unique identifier. This is an optional argument.
  * **Document Guid**
    * **Type:**`string`
    * **Description:** Filter by document GUID. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Document Count" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Project Id:** Specify the project ID to count documents.
   * Optionally, configure any additional filters to refine the document count based on your specific needs.
2. **Execution:**
   * The activity executes asynchronously, retrieving the count of documents based on the specified criteria.
   * It uses the configured API context to access and filter the documents via the document client.
3. **Output:**
   * The activity returns an`int`, representing the count of documents that match the specified filters.

**Considerations**

* **Data Filtering:** Utilize the optional filters effectively to count only the necessary documents, improving performance and reducing processing time.
* **Data Integrity:** Ensure that the project ID and any specified filters are valid and accessible to avoid errors during the retrieval process.
* **Accuracy:** The returned count reflects the number of documents that meet all the specified criteria, providing an accurate measure for reporting or further processing.
 IgnoreCase Multiline IgnoreCase Multiline

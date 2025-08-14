---
description: >-
  Retrieve a list of documents from a project/service combination. Various
  filters are available.
---

# Get Documents

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the project from which to retrieve documents. This is a required argument.
  * **Service Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the service associated with the documents. This is a required argument.
  * **Usage Type**
    * **Type:**`UsageType?`
    * **Description:** Filter by document usage type (e.g.,`UsageType.Outbox`). This is an optional argument.
  * **Document Statuses**
    * **Type:**`List<DocumentStatus>`
    * **Description:** Filter by a list of document statuses (e.g.,`DocumentStatus.Processed`). This is an optional argument.
  * **Class Name**
    * **Type:**`string`
    * **Description:** Filter by document category name. This is an optional argument.
  * **Class Id**
    * **Type:**`int?`
    * **Description:** Filter by document category identifier. This is an optional argument.
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
    * **Type:**`DateTime?`
    * **Description:** Filter from a starting date. Defaults to one year prior to the current date. This is an optional argument.
  * **End Date**
    * **Type:**`DateTime?`
    * **Description:** Filter up to an end date. Defaults to the current date. This is an optional argument.
  * **Document Id**
    * **Type:**`int?`
    * **Description:** Filter by the unique identifier of a specific document. This is an optional argument.
  * **Master Id**
    * **Type:**`int?`
    * **Description:** Filter by the unique identifier of the master/parent document. This is an optional argument.
  * **Definition Categories**
    * **Type:**`List<ParameterDefinitionCategory?>`
    * **Description:** Filter by documents containing specific parameter definition categories. This is an optional argument.
  * **Page No**
    * **Type:**`int?`
    * **Description:** Filter by page number (only applicable when Page Size is set). This is an optional argument.
  * **Page Size**
    * **Type:**`int?`
    * **Description:** The maximum number of results to return per page (use Page No to select which page to return results for). This is an optional argument.
  * **Sort Field**
    * **Type:**`SortField?`
    * **Description:** Sort results by a specific field (default: Id). This is an optional argument.
  * **Sort Direction**
    * **Type:**`SortDirection?`
    * **Description:** Sort results in a specific direction (default: descending). This is an optional argument.
  * **Result Id**
    * **Type:**`string`
    * **Description:** Filter by result identifier. This is an optional argument.
  * **Result Index**
    * **Type:**`int?`
    * **Description:** Filter by result index. This is an optional argument.
  * **External Id**
    * **Type:**`string`
    * **Description:** Filter by user-configured unique identifier. This is an optional argument.
  * **Document Guid**
    * **Type:**`string`
    * **Description:** Filter by document GUID. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Documents" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Project Id:** Specify the project ID to search for documents.
     * **Service Id:** Specify the service ID associated with the documents.
   * Optionally, configure any additional filters to refine the document search based on your specific needs.
2. **Execution:**
   * The activity executes asynchronously, retrieving a list of documents based on the specified criteria.
   * It uses the configured API context to access and filter the documents via the document client.
3. **Output:**
   * The activity returns a`List<DocumentViewModel>`, representing the documents that match the specified filters.

**Considerations**

* **Data Filtering:** Utilize the optional filters effectively to retrieve only the necessary documents, improving performance and reducing processing time.
* **Data Integrity:** Ensure that the project and service IDs are valid and accessible to avoid errors during the retrieval process.
* **Pagination:** Use the Page No and Page Size properties to manage large datasets efficiently, retrieving only the required subset of documents.


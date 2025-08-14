---
description: Retrieve an audit trail based on filter criteria.
---

# Get Audit Trail

**Properties**

* **Input**
  * **User Id**
    *   **Type:**

        `string`
    * **Description:** The identifier of the user for which the audit trail is being retrieved.
    * **Required:** Yes
  * **Group Id (Optional)**
    *   **Type:**

        `int?`
    * **Description:** A group identifier to filter the audit trail.
  * **Audit Entity Type (Optional)**
    *   **Type:**

        `AuditEntity?`
    * **Description:** Filter by a specific audit entity type.
  * **Entity Id (Optional)**
    *   **Type:**

        `int?`
    * **Description:** Filter by a specific entity identifier.
  * **Date and Time From (Optional)**
    *   **Type:**

        `DateTime?`
    * **Description:** The start date and time filter (defaults to 3 days prior to today's date).
  * **Date and Time To (Optional)**
    *   **Type:**

        `DateTime?`
    * **Description:** The end date and time filter (defaults to the end of today).
  * **Include Document Verification Audit (Optional)**
    *   **Type:**

        `bool?`
    * **Description:** Include the verification audits for any documents returned in the audit trail. This may increase processing time.
  * **Definition Id (Optional)**
    *   **Type:**

        `int?`
    * **Description:** Filter by a parameter definition identifier.
  * **Document Id (Optional)**
    *   **Type:**

        `int?`
    * **Description:** Filter by a document identifier.
  * **Document Parameter Id (Optional)**
    *   **Type:**

        `int?`
    * **Description:** Filter by a document parameter identifier.
  * **Project Id (Optional)**
    *   **Type:**

        `int?`
    * **Description:** Filter by a project identifier.
  * **Service Id (Optional)**
    *   **Type:**

        `int?`
    * **Description:** Filter by a service identifier.
  * **Verification Id (Optional)**
    *   **Type:**

        `int?`
    * **Description:** Filter by a verification identifier.
  * **Work Item Id (Optional)**
    *   **Type:**

        `int?`
    * **Description:** Filter by a work item identifier.
  * **Timeout (milliseconds)**
    *   **Type:**

        `int`
    * **Description:** The activity timeout, defaulting to 10 minutes (600,000 ms).
    * **Default Value:** 600000

**Returns:** Use this activity to retrieve audit trails based on specified criteria. It returns a dictionary mapping

`AuditViewModel`

objects to lists of

`VerificationViewModel`

objects.

**Key Functionality**

* **Audit Trail Retrieval:**
  * The activity retrieves audit trail data filtered by various criteria specified through input arguments such as user ID, group ID, entity type, and date range.
* **Verification Data Retrieval:**
  *   The

      `List<VerificationViewModel>`

      is populated under specific conditions:

      *   **Document Type:** The document associated with the audit item must be of type

          `Outbox`

          .
      *   **Audit Access Type:** The audit item must indicate that the document has been either

          `Updated`

          or

          `Processed`

          .
      *   **Verification Inclusion:** The

          `Include Document Verification Audit`

          flag must be set to

          `true`

          to include verification data.

**Detailed Conditions**

* **Include Document Verification Audit (Optional)**
  *   **Type:**

      `bool?`
  *   **Description:** When set to

      `true`

      , this flag triggers the retrieval of verification audits for documents. The verification data is only retrieved if the associated document meets the following conditions:

      *   **Document Usage:** The document's usage type must be

          `Outbox`

          . Verification data will not be retrieved for documents of other usage types.
      *   **Audit Access Type:** The audit access type must be either

          `Update`

          or

          `Process`

          . This ensures that verification data is only gathered for documents that have undergone significant changes or processing.
* **Implementation Logic:**
  * During execution, the activity iterates over each audit item. For each item:
    *   It checks if the

        `Include Document Verification Audit`

        flag is

        `true`

        .
    *   It verifies that the document's usage type is

        `Outbox`

        .
    *   It confirms that the audit access type is

        `Update`

        or

        `Process`

        .
    *   If all conditions are met, it retrieves the verification data associated with the document and adds it to the

        `List<VerificationViewModel>`

        .

**Example Workflow**

1. **Set Up Activity:**
   *   Configure the

       `Get Audit Trail`

       activity with the desired input parameters.
   *   Ensure the

       `Include Document Verification Audit`

       is set to

       `true`

       if verification data is needed.
2. **Process Results:**
   *   The output is a

       `Dictionary<AuditViewModel, List<VerificationViewModel>>`

       .
   *   Only audit items that meet the specified conditions will have a non-empty

       `List<VerificationViewModel>`

       .
3. **Use Cases:**
   *   Ideal for scenarios where tracking changes to documents is critical, especially for documents that are expected to move out of the system (

       `Outbox`

       ) and have been updated or processed.


---
description: Add a log message to the AIForged logging subsystem.
---

# Add Log Message

**Properties**

* **Input**
  * **Comment**
    * **Type:**`string`
    * **Description:** Additional commentary to be included with the log message.
  * **Definition**
    * **Type:**`ParameterDefViewModel`
    * **Description:** The parameter definition object associated with the log message.
  * **Definition Id**
    * **Type:**`int?`
    * **Description:** The parameter definition ID associated with the log message.
  * **Document**
    * **Type:**`DocumentViewModel`
    * **Description:** The document object associated with the log message.
  * **Document Id**
    * **Type:**`int?`
    * **Description:** The document ID associated with the log message.
  * **Error Message**
    * **Type:**`string`
    * **Description:** An error message to be included with the log message.
  * **Event**
    * **Type:**`ServiceEventViewModel`
    * **Description:** The event object associated with the log message.
  * **Event Id**
    * **Type:**`int?`
    * **Description:** The event ID associated with the log message.
  * **Page**
    * **Type:**`string`
    * **Description:** The page value associated with the log message.
  * **Document Parameter**
    * **Type:**`DocumentParameterViewModel`
    * **Description:** The document parameter object associated with the log message.
  * **Document Parameter Id**
    * **Type:**`int?`
    * **Description:** The document parameter ID associated with the log message.
  * **Project Id**
    * **Type:**`int?`
    * **Description:** The project ID associated with the log message.
  * **Project**
    * **Type:**`ProjectViewModel`
    * **Description:** The project object associated with the log message.
  * **Service Id**
    * **Type:**`int?`
    * **Description:** The service ID associated with the log message.
  * **Service**
    * **Type:**`ParameterDefViewModel`
    * **Description:** The service object associated with the log message.
  * **Stack Trace**
    * **Type:**`string`
    * **Description:** A stack trace message to be included with the log message.
  * **Transaction**
    * **Type:**`TransactionsAuditViewModel`
    * **Description:** The transaction object associated with the log message.
  * **Transaction Id**
    * **Type:**`int?`
    * **Description:** The transaction ID associated with the log message.
  * **Log Type**
    * **Type:**`LogType?`
    * **Description:** The log message type.
  * **User Id**
    * **Type:**`string`
    * **Description:** The user ID associated with the log message.
  * **Verification**
    * **Type:**`VerificationViewModel`
    * **Description:** The verification object associated with the log message.
  * **Verification Id**
    * **Type:**`int?`
    * **Description:** The verification ID associated with the log message.
  * **Work Item**
    * **Type:**`WorkItemViewModel`
    * **Description:** The work item object associated with the log message.
  * **Work Item Id**
    * **Type:**`int?`
    * **Description:** The work item ID associated with the log message.
  * **Date and Time**
    * **Type:**`DateTime?`
    * **Description:** The date and time of the log message. Defaults to the current UTC time if not specified.

**Usage**

1. **Setup Activity:**
   * Add the "Add Log Message" activity to your UiPath workflow.
   * Configure the input arguments as needed to capture the relevant context for the log message. This can include comments, error messages, associated objects (such as documents or transactions), and other metadata.
2. **Execution:**
   * The activity executes asynchronously, adding the specified log message to the AIForged logging subsystem.
   * It uses the configured API context to submit the log entry via the log client.
3. **Output:**
   * The activity returns a`LogViewModel`, representing the created log message with its associated metadata.

**Considerations**

* **Contextual Information:** Provide as much context as possible in the log message to facilitate debugging and analysis.
* **Optional Fields:** Utilize optional fields (such as error messages or stack traces) when applicable to enhance the log's usefulness.
* **Performance:** Consider the impact of logging on performance, especially if logging is performed frequently or with large amounts of data.
* **Permissions:** Verify that the necessary permissions are in place for the user or application adding the log message to prevent unauthorized actions.
 IgnoreCase Multiline IgnoreCase Multiline

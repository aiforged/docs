---
description: Convert an Audit Trail to JSON
---

# Convert Audit Trail to JSON

**Properties**

* **Input**
  * **Audit Trail**
    *   **Type:**

        `Dictionary<AuditViewModel, List<VerificationViewModel>>`
    * **Description:** The audit trail to convert. This should be obtained from the "Get Audit Trail" activity.
    * **Required:** Yes

**Usage:** Use this activity to convert an audit trail into a JSON string. It serializes the audit trail to JSON format, applying camelCase to property names and ignoring null and default values.
 IgnoreCase Multiline IgnoreCase Multiline

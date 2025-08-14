---
description: Delete a document parameter by its unique identifier
---

# Delete Document Parameter

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the document associated with the parameter to be deleted. This is a required argument.
  * **Parameter Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the parameter to be deleted. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Delete Document Parameter" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Id:** Specify the ID of the document associated with the parameter.
     * **Parameter Id:** Provide the ID of the parameter you wish to delete.
2. **Execution:**
   * The activity executes asynchronously, deleting the specified document parameter.
   * It utilizes the API context to perform the deletion operation through the`ParametersClient`.
3. **Output:**
   * The activity returns a`DocumentParameterViewModel`, representing the deleted document parameter. This can be used to confirm the deletion or log the parameter details.

**Considerations**

* **Data Integrity:** Ensure that the document ID and parameter ID are valid and accessible to prevent errors during the deletion process.
* **Irreversible Action:** Deleting parameters is usually irreversible. Make sure that the deletion is intentional and that any necessary backups or confirmations are in place.
* **Dependence on Document:** Although you provide a`Document Id`, the deletion itself is performed using the`Parameter Id`. Ensure that the parameter is correctly associated with the specified document to avoid unintended deletions.


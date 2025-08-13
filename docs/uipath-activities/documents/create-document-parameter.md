---
description: Create a new document parameter
---

# Create Document Parameter

**Properties**

* **Input**
  * **Document Id**
    * **Type:**`int`
    * **Description:** The identifier of the document to which this parameter will be associated. This is a required argument.
  * **Parameter Definition Id**
    * **Type:**`int`
    * **Description:** The identifier of the parameter definition that this parameter will be based on. This is a required argument.
  * **Parent Id**
    * **Type:**`int`
    * **Description:** The identifier of the parent parameter under which this new parameter will be nested. This is a required argument.
  * **Value**
    * **Type:**`string`
    * **Description:** The value for this parameter. This is a required argument.
  * **Data**
    * **Type:**`byte[]`
    * **Description:** Optional data associated with the parameter, provided as a byte array.
  * **Index**
    * **Type:**`int?`
    * **Description:** Optional index for the parameter definition.

**Usage**

1. **Setup Activity:**
   * Add the "Create Document Parameter" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Document Id:** Specify the ID of the document to which the parameter will belong.
     * **Parameter Definition Id:** Specify the ID of the parameter definition for this new parameter.
     * **Parent Id:** Specify the ID of the parent parameter under which this parameter will be nested.
     * **Value:** Provide the desired value for the parameter.
   * Optionally, specify:
     * **Data:** Provide any additional data for the parameter in byte array format.
     * **Index:** Specify an index if required by the parameter definition.
2. **Execution:**
   * The activity executes asynchronously, creating a new parameter for the specified document using the provided definition and value.
   * The activity communicates with the AIForged platform to create the parameter, utilizing the configured API context.
3. **Output:**
   * The activity returns a`DocumentParameterViewModel`object, representing the newly created document parameter with all its properties and values.

**Considerations**

* **Data Integrity:** Ensure that the document and parameter definition IDs are valid and accessible within your system to prevent errors during parameter creation.
* **Optional Data:** The`Data`and`Index`inputs are optional and should be configured based on specific parameter requirements or business logic.
* **Performance:** The activity is designed to handle single parameter creation efficiently. For batch operations, consider looping through a list of parameters.
 IgnoreCase Multiline IgnoreCase Multiline

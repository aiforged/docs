---
description: Retrieve information about a parameter definition by its unique identifier.
---

# Get Parameter Definition

**Properties**

* **Input**
  * **Parameter Definition Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the parameter definition to retrieve. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Parameter Definition" activity to your UiPath workflow.
   * Configure the required input argument:
     * **Parameter Definition Id:** Provide the ID of the parameter definition you wish to retrieve information about.
2. **Execution:**
   * The activity executes asynchronously, fetching information about the specified parameter definition.
   * It uses the configured API context to access the parameter definition data via the parameter definition client.
3. **Output:**
   * The activity returns a`ParameterDefViewModel`, representing the detailed information about the specified parameter definition.

**Considerations**

* **Data Integrity:** Ensure that the parameter definition ID is valid and accessible to avoid errors during the retrieval process.
* **Further Processing:** The resulting`ParameterDefViewModel`can be used for further processing, analysis, or integration within your workflow, providing insights into the parameter's configuration and usage.
* **Performance:** The execution time may vary depending on network conditions and the size of the data being retrieved. Ensure that the system is configured to handle the expected load efficiently.

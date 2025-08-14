---
description: >-
  Retrieve the parameter definition hierarchy for a given project/service
  combination.
---

# Get Parameter Definition Hierarchy

**Properties**

* **Input**
  * **Project Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the project for which to retrieve the parameter definition hierarchy. This is a required argument.
  * **Service Id**
    * **Type:**`int`
    * **Description:** The unique identifier of the service for which to retrieve the parameter definition hierarchy. This is a required argument.
  * **Include Statistics**
    * **Type:**`bool?`
    * **Description:** Specifies whether to include statistics with the returned data. This can slow down the request response time. Default is`false`.
  * **Include Settings**
    * **Type:**`bool?`
    * **Description:** Specifies whether to include settings data with the returned data. This can slow down the request response time. Default is`false`.
  * **Include Children**
    * **Type:**`bool?`
    * **Description:** Specifies whether to include all children definitions with the returned data. This can slow down the request response time. Default is`false`.
  * **Parameter Definition Categories**
    * **Type:**`List<ParameterDefinitionCategory?>`
    * **Description:** Filter by parameter definition category. This is an optional argument.
  * **Grouping Types**
    * **Type:**`List<GroupingType?>`
    * **Description:** Filter by grouping type. This is an optional argument.
  * **Value Types**
    * **Type:**`List<API.ValueType?>`
    * **Description:** Filter by value type. This is an optional argument.

**Usage**

1. **Setup Activity:**
   * Add the "Get Parameter Definition Hierarchy" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Project Id:** Specify the project ID for which to retrieve the hierarchy.
     * **Service Id:** Specify the service ID for which to retrieve the hierarchy.
   * Optionally, specify:
     * **Include Statistics, Include Settings, Include Children:** Set these to`true`if you want to include additional data.
     * **Parameter Definition Categories, Grouping Types, Value Types:** Provide filters to narrow down the retrieved hierarchy.
2. **Execution:**
   * The activity executes asynchronously, retrieving the parameter definition hierarchy for the specified project and service.
   * It uses the configured API context to access the hierarchy via the parameter definition client.
3. **Output:**
   * The activity returns a`ParameterDefViewModel`, representing the retrieved parameter definition hierarchy.

**Considerations**

* **Data Volume:** Including statistics, settings, or children can increase the data volume and response time. Use these options judiciously.
* **Data Integrity:** Ensure that the project ID and service ID are valid and correctly specified to avoid errors during retrieval.
* **Filter Criteria:** Use the available filters to narrow down the retrieved hierarchy to specific categories, groupings, or value types.
* **Permissions:** Verify that the necessary permissions are in place for the user or application retrieving the hierarchy to prevent unauthorized actions.



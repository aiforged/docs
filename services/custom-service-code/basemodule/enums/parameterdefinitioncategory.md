---
title: ParameterDefinitionCategory
parent: Enums
grand_parent: Custom Code BaseModule
nav_order: 5
---

# ParameterDefinitionCategory

## Description

The **ParameterDefinitionCategory** enum specifies the category that a **Parameter Definition** belongs to. These can range from actual **Services**, **Field Definitions**, or **Containers**.&#x20;

## Members

<table><thead><tr><th width="178.33333333333331">Name</th><th width="87" data-type="number">Value</th><th>Description</th></tr></thead><tbody><tr><td>None</td><td>0</td><td>No category specified.</td></tr><tr><td>Setting</td><td>1</td><td>The definition is used as a setting for a service.</td></tr><tr><td>Service</td><td>2</td><td>A service (top-level defintion).</td></tr><tr><td>Statistics</td><td>3</td><td>The definition is used for processing statistics.</td></tr><tr><td>Results</td><td>4</td><td>The definition is used for a result or rule for fieds.</td></tr><tr><td>Dependency</td><td>5</td><td>Dependency parameter to be used for configuring a service.</td></tr><tr><td>Verification</td><td>6</td><td>A verification service (configured in parameter definition rules).</td></tr><tr><td>DataSet</td><td>7</td><td>A custom dataset</td></tr><tr><td>PreProcessor</td><td>20</td><td>Container for Pre-processing settings (to improve data quality).</td></tr><tr><td>Processor</td><td>21</td><td>Container for processing settings.</td></tr><tr><td>PostProcessor</td><td>22</td><td>Container for Post-processing settings (to indicate result parameters).</td></tr><tr><td>Extraction</td><td>40</td><td>Extract/Map fields from OCR data.</td></tr></tbody></table>

---
title: ValueType
parent: Enums
grand_parent: Custom Code BaseModule
nav_order: 8
---

# ValueType

## Description

The **ValueType** enum specifies the data type of the value that is expected for the **Parameter** defined by the **Parameter Definition**. The **ValueType** allows the **Rules Engine** to run the correct ruleset when verifying the results of an operation.&#x20;

Each **ValueType** has a pre-defined set of rules that can be configured before, during, or after the training of a service.

## Members

<table><thead><tr><th width="178.33333333333331">Name</th><th width="87" data-type="number">Value</th><th>Description</th></tr></thead><tbody><tr><td>None</td><td>0</td><td>No datatype specified</td></tr><tr><td>String</td><td>1</td><td>A String data type.</td></tr><tr><td>Number</td><td>2</td><td>A Number data type is typically used on fields where no alphabet or special characters are expected.</td></tr><tr><td>Currency</td><td>3</td><td>A Currency data type is typically used where prices/amounts are expected.</td></tr><tr><td>Boolean</td><td>4</td><td>A Boolean data type is typically used where checkmarks are expected.</td></tr><tr><td>DateTime</td><td>5</td><td>A DateTime data type is used where dates and/or timestamps are expected.</td></tr><tr><td>TimeSpan</td><td>6</td><td>A TimeStamp data type is used where timestamps are expected.</td></tr><tr><td>E-mail</td><td>7</td><td>An E-mail data type is typically used where e-mail addresses are expected.</td></tr><tr><td>Enum</td><td>8</td><td>An Enum data type is typically used where enum variables are expected.</td></tr><tr><td>Picture</td><td>9</td><td>A Picture data type is typically used where image processing is required, such as signature detection, object detection, etc.</td></tr><tr><td>Password</td><td>10</td><td>A Password data type is used where password data needs to be handled.</td></tr><tr><td>SecureString</td><td>11</td><td>A SecureStringdata type is typically used where encrypted data needs to be handled.</td></tr><tr><td>Address</td><td>12</td><td>An Address data type is used where addresses are expected.</td></tr><tr><td>IDNo</td><td>13</td><td>An IDNo data type is used where ID Numbers are expected.</td></tr><tr><td>Country</td><td>14</td><td>A Country data type is used where country information is expected.</td></tr><tr><td>Code</td><td>15</td><td>A Code data type is used where Custom Code is implemented.</td></tr><tr><td>TelephoneNo</td><td>17</td><td>A TelephoneNo type is typically used where telephone numbers are expected.</td></tr><tr><td>GPS</td><td>18</td><td>A GPS data type is typically used where GPS coordinates are expected.</td></tr><tr><td>ServiceType</td><td>19</td><td>A ServiceType data type is used for a Service definition.</td></tr><tr><td>Service</td><td>20</td><td></td></tr><tr><td>Data</td><td>90</td><td>A Data data type is used when handling raw data, like blobs.</td></tr><tr><td>DataSet</td><td>91</td><td>A Data data type is used when handling Custom Datasets.</td></tr><tr><td>System</td><td>98</td><td>System data type.</td></tr><tr><td>Unknown</td><td>99</td><td>An unknown data type.</td></tr></tbody></table>

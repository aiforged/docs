# VerificationStatus

## Description

The **VerificationStatus** enum is used to build up a verification bit flag value to indicate multiple statuses of **Field/Parameter** verification.

As the **Rules Engine** and **HITL** users verify fields, certain flags are set based on the operations and results of the verification process.

## Members

<table><thead><tr><th width="178.33333333333331">Name</th><th width="87" data-type="number">Value</th><th>Description</th></tr></thead><tbody><tr><td>Required</td><td>1</td><td>Verification on a field/document is required.</td></tr><tr><td>Susicious</td><td>2</td><td>Suspicious field value. Verification is required to clear this flag.</td></tr><tr><td>DefaultUsed</td><td>4</td><td>Default value is used for the parameter.</td></tr><tr><td>Verified</td><td>8</td><td>This field value has been verified by a user.</td></tr><tr><td>Bypassed</td><td>16</td><td>The verification has been bypassed by the Rules Engine.</td></tr><tr><td>Error</td><td>32</td><td>An error occurred during verification.</td></tr><tr><td>Done</td><td>64</td><td>The verification is done.</td></tr><tr><td>Success</td><td>128</td><td>The Rules Engine verified the field successfully.</td></tr><tr><td>RangeProblem</td><td>256</td><td>The value does not fall within specified ranges (minimum and maximum values).</td></tr><tr><td>IsValid</td><td>512</td><td>The field value is valid based on the Rules Engine's configuration, typically used with Anchor fields.</td></tr><tr><td>Warnings</td><td>1024</td><td>Not in use.</td></tr><tr><td>Service</td><td>2048</td><td>A Verification Service has been invoked to help with verification.</td></tr><tr><td>Training</td><td>4096</td><td>This field is used for training purposes</td></tr><tr><td>Scripted</td><td>8192</td><td>This field has been verified through a Custom Code script.</td></tr><tr><td>Deleted</td><td>16384</td><td>The field has been deleted.</td></tr></tbody></table>

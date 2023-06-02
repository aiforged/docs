# VerificationType

## Description

The **VerificationType** enum indicates the type of verification that was added to the field, i.e. what aspect of the **AIForged** was responsible for adding the verification item.

## Members

<table><thead><tr><th width="178.33333333333331">Name</th><th width="87" data-type="number">Value</th><th>Description</th></tr></thead><tbody><tr><td>None</td><td>0</td><td>Not specified.</td></tr><tr><td>Provider</td><td>1</td><td>The service provider added the Verification.</td></tr><tr><td>System</td><td>2</td><td>The system workflow added the Verification.</td></tr><tr><td>User</td><td>3</td><td>A user has added the verification (typically Custom Code).</td></tr><tr><td>Service</td><td>4</td><td>A Verification Service has added the Verification</td></tr><tr><td>Training</td><td>5</td><td>The Verification was added during training.</td></tr><tr><td>RPA</td><td>6</td><td>An external RPA process added the Verification</td></tr><tr><td>API</td><td>7</td><td>An API call resulted in the Verification being added.</td></tr><tr><td>DataSet</td><td>8</td><td>A Verification has been added from dataset data.</td></tr></tbody></table>

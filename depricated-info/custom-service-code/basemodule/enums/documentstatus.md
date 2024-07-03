# DocumentStatus

## Description

The **DocumentStatus** enum indicates the status of a document in **AIForged**.

## Members

<table><thead><tr><th width="194.33333333333331">Name</th><th width="100" data-type="number">Value</th><th>Description</th></tr></thead><tbody><tr><td>None</td><td>0</td><td>Default status.</td></tr><tr><td>Received</td><td>3</td><td>The document was received into a folder and needs to be processed or trained.</td></tr><tr><td>Analyzed</td><td>4</td><td>The document was analyzed and custom labeling can be done.</td></tr><tr><td>Trained</td><td>5</td><td>The document was trained.</td></tr><tr><td>Processing</td><td>8</td><td>The document is busy being processed.</td></tr><tr><td>Verification</td><td>9</td><td>The document requires human verification.</td></tr><tr><td>Processed</td><td>10</td><td>The document was processed and the results are published (all rules passed).</td></tr><tr><td>Queued</td><td>11</td><td>The document is queued for processing.</td></tr><tr><td>Verifying</td><td>12</td><td>The document is currently being verified.</td></tr><tr><td>InterimProcessed</td><td>13</td><td>The document was processed successfully and awaiting further processing (Custom Code, external process, etc.).</td></tr><tr><td>InsufficientBalance</td><td>81</td><td>The project's balance is too low to perform a transaction. The account needs funding.</td></tr><tr><td>Error</td><td>90</td><td>Some error occured while processing the document.</td></tr><tr><td>Archive</td><td>98</td><td>Flag document for hard delete based on archiving strategy.</td></tr><tr><td>Deleted</td><td>99</td><td>Soft delete the document in the database for hard delete in the near future.</td></tr></tbody></table>

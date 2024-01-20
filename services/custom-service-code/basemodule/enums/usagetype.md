---
title: UsageType
parent: Enums
grand_parent: Custom Code BaseModule
nav_order: 7
---

# UsageType

## Description

The **UsageType** enum indicates the reason that a document has been stored, i.e. the intended usage of the document.

## Members

<table><thead><tr><th width="178.33333333333331">Name</th><th width="87" data-type="number">Value</th><th>Description</th></tr></thead><tbody><tr><td>Definition</td><td>0</td><td>This is a definition document. Each service has its unique usage for a definition document.</td></tr><tr><td>Training</td><td>1</td><td>This is training document, uploaded by class.</td></tr><tr><td>Inbox</td><td>2</td><td>This is a user document request for classification or extraction.</td></tr><tr><td>Outbox</td><td>3</td><td>This is the results of the classification or extraction.</td></tr><tr><td>Label</td><td>4</td><td>The document contains labeling information.</td></tr><tr><td>Dataset</td><td>10</td><td>The document is used to store dataset information.</td></tr><tr><td>System</td><td>90</td><td>This is a system document.</td></tr><tr><td>Sample</td><td>98</td><td>This is a sample document (showcasing something).</td></tr><tr><td>Preview</td><td>99</td><td>Preview Image of the document (if applicable).</td></tr></tbody></table>

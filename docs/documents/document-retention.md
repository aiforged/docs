---
title: 🗄️ Document Retention
---

## Document Retention Policies

AIForged offers two options for document and data retention: Automatic and Manual, putting you in control of your data.

## Document deletion

* Soft delete (Recoverable for up to 30 days after deletion)
* Hard Delete (Unrecoverable/ permanent deletion)

## Document deletion options

* Delete Physical Document
* Delete Results generated
* Hard/ Soft - deletion

!!! danger
    Soft deleted documents are automatically hard deleted after 30 days

## Manual document deletion (Full Control)

Administrators and Developers can delete documents on command via the UI or API, They can select [Document Deletion Options](document-retention.md#document-deletion-options "mention")

!!! info
    All delete requests are logged and available on the audit view

## Archiving strategy (Automatic)

Each service has an archiving strategy that can be configured to automatically soft delete documents older than a specified age.

![](../assets/image%20%282%29%20%281%29%20%281%29%20%281%29%20%281%29.png)
!!! warning
    The archiving strategy will soft delete documents for 30 days, before automatically hard deleting them

!!! danger
    Automatic deletion will NOT be logged

## Audited information

Information kept in the audit view includes:

* Document ID
* Project ID
* Service ID
* File Name
* Date of deletion
* IP Address
* Document Category
* File Type
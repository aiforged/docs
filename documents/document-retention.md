---
icon: unlock
---

# Document Retention

### Document retention Policies

AIForged offers two options for document and data retention: Automatic and Manual, putting you in control of your data.

### Document deletion

* Soft delete (Recoverable for up to 30 days after deletion)
* Hard Delete (Unrecoverable/ permanent deletion)

### Document deletion options

* Delete Physical Document
* Delete Results generated
* Hard/ Soft - deletion

{% hint style="danger" %}
Soft deleted documents are automatically hard deleted after 30 days
{% endhint %}

## Manual document deletion (Full Control)

Administrators and Developers can delete documents on command via the UI or API, They can select [#document-deletion-options](document-retention.md#document-deletion-options "mention")

{% hint style="info" %}
All delete requests are logged and available on the audit view
{% endhint %}

## Archiving strategy (Automatic)

Each service has an archiving strategy that can be configured to automatically soft delete documents older than a specified age.

<div align="left"><figure><img src="../.gitbook/assets/image (2) (1) (1) (1).png" alt=""><figcaption></figcaption></figure></div>

{% hint style="warning" %}
The archiving strategy will soft delete documents for 30 days, before automatically hard deleting them
{% endhint %}

{% hint style="danger" %}
Automatic deletion will NOT be logged
{% endhint %}

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

---
icon: unlock
---

# Document Retention

### Document retention Policies

AIForged offers two options for document and data retention: Automatic and Manual, putting you in control of your data.

### Document deletion

* Soft delete (Recoverable)
* Hard Delete (Unrecoverable/ permanent deletion)&#x20;

### Document deletion options

* Delete Physical Document
* Delete Results generated&#x20;
* Hard/ Soft - deletion

{% hint style="danger" %}
Soft delete documents are automatically hard deleted after 30 days
{% endhint %}

## Manual document deletion (Full Control)

Administrators and Training Users can delete documents on command via the UI or API, They can select [#document-deletion-options](document-retention.md#document-deletion-options "mention")

{% hint style="info" %}
All delete requests are logged and available on the audit view
{% endhint %}

## Archiving strategy (Automatic)

Each service has an archiving strategy that automatically cleans documents older than a comfortable age\


<figure><img src="../.gitbook/assets/image (18).png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
The archiving strategy will soft delete documents for 30 days, before automatically hard deleting them
{% endhint %}

{% hint style="info" %}
Archiving will be logged and available on the audit view
{% endhint %}

## Audited information

Information kept in the audit view includes:&#x20;

* Document ID&#x20;
* Project ID&#x20;
* Service ID&#x20;
* File Name&#x20;
* Date of deletion&#x20;
* IP Address&#x20;
* Document Category&#x20;
* File Type








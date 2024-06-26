# ⏩ Understanding Document Flows

### Document flow in a service

Each service has an **Inbox** and an **Outbox**. A physical document is passed into the inbox, and the service processes it to produce a result in the outbox

{% hint style="info" %}
&#x20;Note that services might often produce different outputs, for example: an Extractor may produce document field results, whereas Classifiers might produce document groups
{% endhint %}

<figure><img src="../.gitbook/assets/112 (1).png" alt=""><figcaption></figcaption></figure>

### Hiarcial Flow

Documents are connected hierarchically. We can track documents both through a single service and between multiple services.

<figure><img src="../.gitbook/assets/master ID (2).png" alt=""><figcaption></figcaption></figure>

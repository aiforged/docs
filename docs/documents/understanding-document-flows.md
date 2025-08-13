# ⏩ Understanding Document Flows

### Document flow in a service

Each service has an **Inbox** and an **Outbox**. A physical document is passed into the inbox, and the service processes it to produce a result in the outbox

!!! info
    Note that services might often produce different outputs, for example: an Extractor may produce document field results, whereas Classifiers might produce document groups

<figure><img src="../assets/112%20%281%29.png" alt=""><figcaption></figcaption></figure>

### Hiarcial Flow

Documents are connected hierarchically. We can track documents both through a single service and between multiple services using a Master Id to Id mapping.

<figure><img src="../assets/master%20ID%20%282%29.png" alt=""><figcaption></figcaption></figure>

 IgnoreCase Multiline IgnoreCase Multiline


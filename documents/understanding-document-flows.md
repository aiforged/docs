# ⏩ Understanding Document Flows

### Document flow in a service

Each service has an Inbox and an Outbox

The physical document is passed into the inbox, and a result is produced in the outbox. It is important to note that services might often produce different outputs, for example: an Extractor may produce document field results, whereas Classifiers might produce document groups

<figure><img src="../.gitbook/assets/112 (1).png" alt=""><figcaption></figcaption></figure>


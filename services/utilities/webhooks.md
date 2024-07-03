# Webhooks

A webhook is a mechanism that allows one system or application to send real-time data to another system or application as soon as an **event** occurs. It is a way for applications to communicate with each other automatically. Unlike traditional APIs where one system periodically requests information from another, webhooks enable real-time data transmission.

**AIForged** allows users to add webhooks to their custom code to integrate with other external systems.

## How to create webhooks

**AIForged** contains a **Webhook Utility Service** that can be added to any existing **Service.**

1. Create a new **Project** or select an existing one.
2. Create a new **Service** of any type or select an existing one.
3.  Once in the Service, select the **Add Utility** button.

    <figure><img src="../../.gitbook/assets/image (10) (4).png" alt=""><figcaption></figcaption></figure>
4.  In the **Utilities** section, select the **WebHook Utility** Service.

    <figure><img src="../../.gitbook/assets/image (1) (8).png" alt=""><figcaption></figcaption></figure>
5. Once the **Utility Service** is added, the user can now configure the **WebHook Service**.

## Configuring a WebHook Service

The following settings are available to configure a **WebHook Service**. These setting can be used to setup the conditions when a webhook should fire.

<figure><img src="../../.gitbook/assets/image (8) (1) (2).png" alt=""><figcaption></figcaption></figure>

The following **Document** options are available.

<figure><img src="../../.gitbook/assets/image (9) (2).png" alt=""><figcaption></figcaption></figure>

The following **WebHook** options are avaiable.

<figure><img src="../../.gitbook/assets/image (11).png" alt=""><figcaption></figcaption></figure>

## Custom Code Invocation

A **WebHook Service** can be invoked via **Custom Code**. The [BaseModule](../../depricated-info/custom-service-code/basemodule/) provides the following method to invoke a **WebHook Service**.

<table><thead><tr><th width="287">Method Name</th><th>Description</th><th>Returns</th></tr></thead><tbody><tr><td><p><strong>CallWebHookAsync</strong>(</p><p>IDocument srcdoc,</p><p>IDocument masterdoc = null, IDocumentParameter par = null, IParameterDef def = null, IVerification verification = null, IWorkItem wi = null, int? webHookServiceId = null)</p></td><td>Calls a webhook service to post data to an external system.</td><td>The webhook call result.</td></tr></tbody></table>

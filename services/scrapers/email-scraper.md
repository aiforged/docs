# 📧 Email Scraper

### Overview

The Email Scraper in AIForged is designed to check mailboxes for new emails at scheduled intervals. When new emails are detected, the scraper downloads them into the platform for processing. Attachments are then automatically extracted using the built-in attachment utility, streamlining document intake and workflow automation.

{% hint style="info" %}
With the latest updates, AIForged Email Scraper now supports device code flow authentication for Microsoft 365, providing a secure and user-friendly way to connect to modern mailboxes.
{% endhint %}

***

### Supported Platforms

* **Gmail**\
  Connect to Gmail accounts using IMAP with app-specific passwords.
* **Microsoft 365**\
  Authenticate using device code flow for secure integration with Microsoft 365 mailboxes.
* **Other Email Providers**\
  Any email provider can be used, provided the correct IMAP settings are applied.

***

### Prompt-less Code Flow Authentication (Microsoft 365)

AIForged now supports prompt-less code flow for Microsoft 365 mailbox integration, removing the need for any manual user interaction after setup.

* **How it works:**\
  Simply provide your Azure AD Tenant ID and Client ID (from your registered Azure application) in the Email Scraper settings.
* **Setup:**
  1. Register an application in your Azure AD tenant.
  2. Note the **Tenant ID** and **Client ID** from the registration.
  3. Enter these values in the Email Scraper configuration.
* **Operation:**\
  The Email Scraper will authenticate and retrieve a device token automatically during its first scheduled run. From the second scheduled run onward, it will begin retrieving emails—no user prompts or approvals required.

<figure><img src="../../.gitbook/assets/image (1) (1).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
This is the recommended and most secure way to connect Microsoft 365 mailboxes, as no passwords are stored and no user interaction is needed after setup.
{% endhint %}

***

### Setup Guide

Follow these steps to create and configure an Email Scraping service in AIForged:

1. **Add an Email Scraper Service** \
   Add an email scraper service to your agent, either manually or via the service flow configurator.
2. **Open Service Settings**\
   Apply the following settings, depending on your email provider:

#### Microsoft 365 (Recommended)

* **Service Type:** IMAP
* **Server:** outlook.office365.com
* **Port:** 993
* **Username:** The email address to be scraped
* **Password:** Not required when using prompt-less code flow
* **Prompt-less Code Flow:** Yes (enable this option)
* **Tenant ID:** Your Azure AD tenant ID
* **Client ID:** Your Azure app registration client ID
* **Remove XOAUTH2:** No
* **Folder:** The mailbox folder to monitor (e.g., Inbox)
* **Processed Folder:** The folder where processed emails will be moved

#### Gmail

* **Service Type:** IMAP
* **Server:** imap.gmail.com
* **Port:** 993
* **Username:** The email address to be scraped
* **Password:** App-specific password (required by Google for third-party IMAP access)
* **Remove XOAUTH2:** Yes
* **Folder:** The mailbox folder to monitor (e.g., Inbox)
* **Processed Folder:** The folder where processed emails will be moved

#### Other Providers

* **Service Type:** IMAP
* **Server:** Provider-specific IMAP server address
* **Port:** Typically 993
* **Username:** The email address to be scraped
* **Password:** Email account password or app-specific password
* **Remove XOAUTH2:** As required by your provider
* **Folder:** The mailbox folder to monitor
* **Processed Folder:** The folder where processed emails will be moved

<figure><img src="../../.gitbook/assets/image (3) (1).png" alt=""><figcaption></figcaption></figure>



3. **Enable Auto Execution**\
   Make sure to turn on the "Auto Execution" option so the scraper runs at scheduled intervals.

<figure><img src="../../.gitbook/assets/image (2) (1).png" alt=""><figcaption></figcaption></figure>

***

### Additional Tips

{% hint style="info" %}
For the highest security, use device code flow with Microsoft 365 and avoid storing plain-text credentials.
{% endhint %}

{% hint style="info" %}
Use app-specific passwords for Gmail, as Google requires this for third-party IMAP access.
{% endhint %}

{% hint style="info" %}
Set up different scrapers for different folders or mailboxes to keep processing organized.
{% endhint %}

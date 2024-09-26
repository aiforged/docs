# 📧 Email Scraper

## Overview

Email scrapers are designed to check for new emails in a mailbox periodically. If new emails are found, the scraper downloads them into the service.

{% hint style="info" %}
Once the email is scraped, an [attachment utility](../utilities/attachment-utility.md) can be used to retrieve all the attachments from the email.
{% endhint %}

## Supported Platforms

* **Gmail**
* **Microsoft 365**

{% hint style="info" %}
Any email provider can be used if the correct settings are applied
{% endhint %}

## Setup Guide

1. Create an **Email Scraping** service

<figure><img src="../../.gitbook/assets/image (1) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>

2. Navigate to the **wizard**

<figure><img src="../../.gitbook/assets/image (3).png" alt=""><figcaption></figcaption></figure>

3. Apply the following settings

{% tabs %}
{% tab title="Microsoft 365" %}
**Service Type:** IMAP

**Server:** Your Email Server _<mark style="color:blue;">Default (outlook.office365.com)</mark>_

**Port:** Email Port _<mark style="color:blue;">Default 993</mark>_

**Username:** The Email address that will be used for scraping

**Password:** The Email address Password

**Remove XOAUTH2:** No

**Folder:** The folder to monitor

**Processed Folder:** The folder to move processed emails
{% endtab %}

{% tab title="Gmail" %}
**Service Type:** IMAP

**Server:** Your Email Server _<mark style="color:blue;">Default (imap.gmail.com)</mark>_

**Port:** Email Port _<mark style="color:blue;">Default 993</mark>_

**Username:** The Email address that will be used for scraping

**Password:** The Email address [**App-Specific** ](https://support.google.com/accounts/answer/185833?hl=en)Password

**Remove XOAUTH2:** YES

**Folder:** The folder to monitor

**Processed Folder:** The folder to move processed emails
{% endtab %}
{% endtabs %}

{% hint style="info" %}
Remember to switch on "**Auto Execution**"
{% endhint %}

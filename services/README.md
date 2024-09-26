# 👓 AI Services

## Overview

AI services in AIForged are first and third-party processing engines designed to perform specific tasks. These AI services can be connected using utilities and verification engines.

### Types of AI Services

There are various types of AI services tailored for specific tasks:

* **Scrapers**: Extract documents from specified locations (e.g., mailboxes).
* **Classifiers**: Identify the type of each page or document.
* **Extractors and Verifiers**: Identify and verify information on documents.
* **OCR (Optical Character Recognition)**: Extract text from images.
* **Object Detection**: Identify objects within images.
* **Speech Recognition**: Convert speech from audio files into text.

## AI Services Structure

AI services can operate in different configurations:

* **Sequence**: Services execute one after another.
* **Independent**: Services operate individually.
* **Parallel**: Services run simultaneously.
* **Tandem**: Services collaborate closely with each other.

{% hint style="info" %}
Understanding these structures is crucial to leveraging the full potential of AI services.
{% endhint %}

## AI Service Operations

{% hint style="info" %}
AI services can be connected in **ANY** order.
{% endhint %}

### Individual AI Services

An individual AI service operates independently and does not require input from any other service.

### Dependent AI Services

Dependent AI services rely on additional functionalities, such as OCR or custom logic, which can be applied:

* **Before Processing**: Enhances the input before primary processing.
* **After Processing**: Improves or validates output after initial processing.

#### Example:

If the Microsoft Forms recognizer is inadequate, custom code can be integrated into the process to achieve the desired outcome

<figure><img src="../.gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Dependent AI Services are set up the same way as normal AI Services
{% endhint %}

### Verification AI Services

Verification AI services are triggered based on specific conditions, such as low confidence in a field. These services can be set up in the rule engine.

{% hint style="info" %}
Verification AI Services can be set up in the Rule Engine
{% endhint %}

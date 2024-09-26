# ↗️ Processing documents

## Overview

Once a document is uploaded, one can start to think about processing to produce an output

Processing can be done in various ways:

* Desktop App (manual)
* Auto Batch Processing
* API/ SDK/ BOT

{% hint style="info" %}
Processing a document produces a result file, Processing it multiple times, produces multiple output files
{% endhint %}

## Processing documents in the Desktop app

1. Open the service **Inbox**
2. Select the documents to be processed
3. select "Process selected documents"&#x20;
4. Tune the [processing parameters](processing-paramaters.md)

## Auto processing

This is set up in the service settings. This will automatically process documents in the received state

1. Open the service wizard
2. Set **Processing Batch Size** Recommended 10 -30 documents
3. set **Execution Interval**
4. set **Auto Execuion** to True

{% hint style="info" %}
Documents older than 7 days will not be auto-processed
{% endhint %}

## API Processing

Refer to API/ SDK/ BOT documentation

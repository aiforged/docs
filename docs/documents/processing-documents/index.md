# ↗️ Processing documents

## Overview

Once a document is uploaded, one can start to think about processing it to produce an output

Processing can be done in various ways:

* The AIForged Studo
* Auto Batch Processing
* API/ SDK/ BOT

!!! info
    Processing a document produces a result file, processing it multiple times with the default processing parameters produces multiple output files

## Processing documents in the AIForged Studio

1.  Open the service view by clicking on the service card in your agent view (processing multiple documents can only done from the service view, you can only process individual documents from the agent view).

    ![](../../assets/image%20%2871%29.png)

2.  Select the documents to be processed

    ![](../../assets/image%20%2872%29.png)

3.  Click on the **Process** button

    ![](../../assets/image%20%2873%29.png)

4.  Tune the [processing parameters](processing-paramaters.md) and click on **Process**

    ![](../../assets/image%20%2878%29.png)

## Auto processing

This is set up in the service settings. This will automatically process documents in the received state

1.  Open the service settings dialog:

    ![](../../assets/image%20%2874%29.png)

2.  In the **Auto Execution** tab set the **Batch Size** (recommended 10 -30 documents)


    ![](../../assets/image%20%2875%29.png)

3.  Set the **Execution Interval** (minimum 10 minutes)


    ![](../../assets/image%20%2876%29.png)

4.  Set the **Auto Execution option** to True


    ![](../../assets/image%20%2877%29.png)

!!! info
    Documents older than 7 days will not be auto-processed

## API Processing

Refer to API / SDK / RPA documentation

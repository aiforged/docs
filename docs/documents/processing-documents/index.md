# ↗️ Processing documents

## Overview

Once a document is uploaded to a Service, you can process it to generate results (for example, extracted fields, JSON, or derivative PDFs). Processing can be initiated manually in Studio, scheduled via Auto Execution, or triggered programmatically through your integrations.

!!! info
    Each processing run can create new result artifacts. If you reprocess the same document with default parameters, you may generate multiple outputs. Use Processing Parameters to reset or delete previous outputs when you need a clean re-run.

---

## Processing options

- AIForged Studio
    - Manually process one or more documents from the Service view.
- Auto Execution (auto processing)
    - Let the Service poll and process new “Received” documents on a schedule.
- API / SDK / RPA
    - Trigger processing from your systems and bots for full automation.

---

## Processing documents in the AIForged Studio

1. Open the Service view
    - In your agent, click the Service card to open its operational view.
    - Note: Batch processing across multiple documents is available in the Service view. From the agent view, you can process individual documents only.
    - ![](../../assets/image%20(71).png)

2. Select the documents
    - Check one or more documents you want to process.
    - ![](../../assets/image%20(72).png)

3. Click Process
    - Click the Process button to open the processing dialog.
    - ![](../../assets/image%20(73).png)

4. Tune Processing Parameters and run
    - Adjust options as needed (e.g., Force Re-Processing, Delete Output of Previous Processing).
    - Click Process to start the job.
    - ![](../../assets/image%20(78).png)
    - Guide: [Processing Parameters](processing-parameters.md)

!!! tip
    Start with a small batch to validate results and your parameter choices before scaling up to larger sets.

---

## Auto processing (Auto Execution)

Configure Auto Execution in Service settings to automatically process documents in the Received state.

1. Open Service settings
    - Open the settings dialog for the Service you want to automate.
    - ![](../../assets/image%20(74).png)

2. Set Batch Size
    - In the Auto Execution tab, choose a Batch Size (recommended 10–30 documents).
    - ![](../../assets/image%20(75).png)

3. Set Execution Interval
    - Choose the polling interval (minimum 10 minutes).
    - ![](../../assets/image%20(76).png)

4. Enable Auto Execution
    - Set the Auto Execution option to True to start automated processing.
    - ![](../../assets/image%20(77).png)

!!! info
    Documents older than 7 days will not be auto-processed. Move time-sensitive work to Received promptly to ensure automation picks it up.

---

## API / SDK / RPA processing

Trigger processing from your applications or bots to integrate AIForged into your end-to-end workflows.

- Use the AIForged API or SDK to:
    - Upload documents to a Service
    - Set document Usage/Status (for example, to Received)
    - Initiate processing and poll for results
- Refer to your API / SDK / RPA documentation for endpoints, authentication, and examples.

---

## How results are created (and managed)

- Each run can add result artifacts
    - By default, new results are appended. This helps with auditing and comparisons across runs.
- Control state and outputs with Processing Parameters
    - Use Reset Previous Results and Delete Output of Previous Processing for clean re-runs.
    - Force Re-Processing ensures the full pipeline executes, rather than reusing any cached pre-processing.
- Where to review results
    - Use the Outbox filter in the Service view to find completed items and open documents to inspect fields and artifacts.

!!! warning
    Deleting linked documents (especially recursively) is irreversible. Confirm no downstream dependencies rely on those artifacts before proceeding.

---

## Troubleshooting

- Nothing seems to happen when I click Process
    - Confirm the Service is Enabled.
    - Check that you have a role with permission to process (Owner, Administrator, Developer, etc.).
- Auto Execution isn’t picking up my documents
    - Ensure Auto Execution is enabled and Batch Size > 0.
    - Confirm documents are in the Received state and not older than 7 days.
    - Verify the Execution Interval (minimum 10 minutes) and allow for the next cycle.
- Results didn’t change after a re-run
    - Enable Force Re-Processing.
    - Use Delete Output of Previous Processing to avoid stale outputs.
- I see duplicate or conflicting outputs
    - Use Reset Previous Results and re-run with a smaller batch to validate changes.

---

## Related links

- Documents overview: [Click Here](../documents.md)
- Working in the Service view: [Click Here](documents-in-service-view.md)
- Processing Parameters: [Click Here](processing-parameters.md)
- Understanding Document Flows: [Click Here](understanding-document-flows.md)
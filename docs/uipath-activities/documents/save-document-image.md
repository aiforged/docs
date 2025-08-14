---
description: Save a document image to a given filepath.
---

# Save Document Image

**Properties**

* **Input**
  * **Documents Data**
    * **Type:**`DocumentDataViewModel`
    * **Description:** The document data object that contains the image data. Use the "Get Document Data" activity to retrieve this. This is a required argument.
  * **Filepath**
    * **Type:**`string`
    * **Description:** The filepath where the document image should be saved. This is a required argument.

**Usage**

1. **Setup Activity:**
   * Add the "Save Document Image" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **Documents Data:** Provide the document data object that contains the image data. This can be obtained using the "Get Document Data" activity.
     * **Filepath:** Specify the path where the image should be saved.
2. **Execution:**
   * The activity executes synchronously, saving the image data contained in the document data object to the specified filepath.
   * It uses standard file I/O operations to write the image data to disk.
3. **Output:**
   * The activity returns a`bool`indicating the success of the operation:
     * `true`if the image was successfully saved.
     * `false`if the image data was null or empty, or if the save operation failed.

**Considerations**

* **Data Integrity:** Ensure that the`DocumentData`contains valid image data to avoid unsuccessful saves.
* **Filepath Validity:** Verify that the specified`Filepath`is valid and that the application has write permissions to the directory to prevent errors.
* **Overwrite Caution:** If a file already exists at the specified path, it will be overwritten without warning. Implement additional checks if this behavior needs to be controlled.


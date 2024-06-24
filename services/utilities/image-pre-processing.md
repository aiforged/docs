# Image Pre-Processing

<figure><img src="../../.gitbook/assets/image (20) (4).png" alt=""><figcaption></figcaption></figure>

The **AIForged Image Processor Service** is used to pre-process documents before being sent to OCR services in order to increase the accuracy of the OCR.

The following operations are available when pre-processing documents:

| Operation          | Description                                                                                                                                                                                      |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Remove Comments    | Remove any electronic comments from PDFs.                                                                                                                                                        |
| Rotate             | Rotate the pages of a document. This is mostly used to deskew pages.                                                                                                                             |
| Greyscale          | Convert the image to Greyscale.                                                                                                                                                                  |
| Invert             | Invert the colour of an image.                                                                                                                                                                   |
| Mirror             | Mirrors an image .                                                                                                                                                                               |
| Remove Garbage     | Used to remove small spots such as pen marks.                                                                                                                                                    |
| Remove Color Marks | Remove marks that may affect OCR accuracy, such as bank stamps.                                                                                                                                  |
| Whiten Background  | By specifying lower- and upper greyscale bounds, remove possible watermarks that may negatively impact OCR accuracy. Bound values are between 0 and 255, with 0 being black and 255 being white. |

Consider the document below, with a "DRAFT" watermark.

<figure><img src="../../.gitbook/assets/image (122).png" alt=""><figcaption></figcaption></figure>

The **AIForged Image Processor Service** can be used to remove the watermark and whiten the background.

<figure><img src="../../.gitbook/assets/image (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

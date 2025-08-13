# 📑 Field Rules (Rules Engine)

After data has been extracted by a **Service** from a document, the **AIForged Rules Engine** is invoked to validate the OCR text returned. A certain **Rule Type** can be applied to a field on a document to trigger manual **Human-in-the-Loop** intervention when the OCR test does not meet the conditions of the **Rule**. A **Rule** can also be used to correct the OCR text (such as converting letters to a corresponding number where a number is expected) or matching format patterns (such as matching date patterns containing special characters like '/' or '-', or e-mail addresses expecting characters like '@' and '.').

One of the following can be assigned to a field on a document, and is explained in detail in the following sections:

* Address
* Boolean
* Code
* Country
* Currency
* DateTime
* E-mail Address
* Enum
* GPS Coordinates
* ID NUmber
* Number
* Password
* Picture
* Secure String
* String
* Telephone Number
* Timespan

To setup a **Rule**, select any field on a document, and select **Show Definition**.

<figure><img src="../assets/image (133).png" alt=""><figcaption></figcaption></figure>

This will open the dialogue to select and configure the **Rule**. The **Rule Type** can be assigned here for the selected field.

<figure><img src="../assets/image (150).png" alt=""><figcaption></figcaption></figure>


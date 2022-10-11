---
title: RegEx
parent: Generic Rules
grand_parent: Rules Engine
nav_order: 3
---

# RegEx

Similar to the **Dictionary and Mapping Rules**, the **RegEx Replacement Rule** can be applied to any type of extracted data, and is used to match **Regular Expressions** to the extracted data. The matched text can then be replaced with the predefined replacement text This is especially useful when correcting the extracted data to what is expected.

<figure><img src="../../.gitbook/assets/image (20) (1) (1).png" alt=""><figcaption></figcaption></figure>

The example below illustrated how a **RegEx** pattern can be used to remove any whitespace characters from the extracted data. The pattern simply searches for any whitespace character, and replaces it with a blank value (no characters).

<figure><img src="../../.gitbook/assets/image (13) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

In the next example below, a **RegEx** pattern is shown to look for "Word" preceded and followed by at least one whitespace character. The value that will replace the match, will be "Word" with no whitespace characters. In essence, this **RegEx** replacement was used to remove the whitespace characters from the extracted value for the field.

<figure><img src="../../.gitbook/assets/image (22) (1) (1).png" alt=""><figcaption></figcaption></figure>

To add another **Regular Expression** to the **Regular Expression Mapping Dictionary**, click on "_Click here to add a new row_".

<figure><img src="../../.gitbook/assets/image (16) (3) (1).png" alt=""><figcaption></figcaption></figure>

---
title: Dictionary
parent: Generic Rules
grand_parent: Rules Engine
nav_order: 1
---

# Dictionary

The **Dictionary Rule** can be applied to any type of extracted data and **** provides a means to perform a lookup of an expected word. The user can provide a list of expected words for a field, and using the specified **Lookup Method**, the closest match is used to override the value of the **Parameter**.

For example, if a form contains a field for a **US State**, then the comprehensive list of all 50 states can be supplied to the **Dictionary**, and the best match for what was written on the form, will be returned as the value of the field. In this case, the **Dictionary** can be used to correct the spelling of the expected **US State**.

The **Lookup Method** can be selected from the **Lookup Method** dropdown box.

<figure><img src="../../.gitbook/assets/image (43).png" alt=""><figcaption></figcaption></figure>

The following **Lookup Methods** are available:

| Lookup Method        | Description                                                                                                                |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| Exact                | The extracted data has to match the dictionary entry exactly.                                                              |
| Levenshtein Distance | The Levenshtein Distance lookup method, the minimum number of single-character edits, is used with a specified confidence. |
| Hamming Distance     | The Hamming Distance lookup method is used with a specified confidence.                                                    |
| RegEx                | A Regular Expression can be provided to do the matching.                                                                   |
| None                 | No matching will happen.                                                                                                   |

The list of **Dictionary Entries** can be specified in the **Dictionary Options** table.

<figure><img src="../../.gitbook/assets/image (28).png" alt=""><figcaption></figcaption></figure>

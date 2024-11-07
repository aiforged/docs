# DictionaryLookupMethod

## Description

The **DictionaryLookupMethod** enum specifies the method to be used to perform dictionary lookups for **Parameter Definitions** using **Dictionary Lookups** in **AIForged**. **Dictionary Lookups** are used to replace extracted text with a match in the elements in a **Dictionary**.

## Members

<table><thead><tr><th width="210.33333333333331">Name</th><th width="100">Value</th><th>Description</th></tr></thead><tbody><tr><td>Exact</td><td>NA</td><td>Try to exactly match the string of elements in the dictionary.</td></tr><tr><td>LevenshteinDistance</td><td>NA</td><td>Try matching elements using a Levenshtein Distance method.</td></tr><tr><td>HammingDistance</td><td>NA</td><td>Try matching elements using a Hamming Distance method.</td></tr><tr><td>RegEx</td><td>NA</td><td>Try matching elements using a Regular Expression match method.</td></tr><tr><td>None</td><td>NA</td><td>Do not try to match with elements in the dictionary.</td></tr></tbody></table>

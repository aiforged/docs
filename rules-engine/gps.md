---
title: GPS
parent: Rules Engine
nav_order: 6
---

# GPS Coordinate

The **GPS Coordinate Rule Type** can be applied to a field where a **GPS Coordinate** is expected.

<figure><img src="../.gitbook/assets/image (15) (1) (1) (2).png" alt=""><figcaption></figcaption></figure>

This rule verifies whether a valid **GPS Coordinate** was extracted by checking for degree characters or at least one decimal point. If degree format was detected, the value is derived using degrees, otherwise, the value is derived by using the decimal point.

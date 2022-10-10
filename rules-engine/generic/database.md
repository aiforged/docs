---
title: Database
parent: Rules Engine
nav_order: 10
---

# Database

The **Database Rule Type** can be applied to any type of extracted data. This rule provides a means to directly interface with any **SQL Database**.

<figure><img src="../../.gitbook/assets/image (3) (1).png" alt=""><figcaption></figcaption></figure>

This **Rule Type** is useful when extracted data needs to be synchronized with other external databases, or when external data needs to be pulled into the **Service**.

The following SQL Methods are available:

| SQL Method       | Description                                                      |
| ---------------- | ---------------------------------------------------------------- |
| Query            | A SQL query is executed directly on the SQL database.            |
| Stored Procedure | A SQL Stored Procedure is executed directly on the SQL database. |
| Command          | A SQL command is executed directly on the database.              |

The SQL Method can be selected by clicking on the **SQL Method** dropdown box.

<figure><img src="../../.gitbook/assets/image (65).png" alt=""><figcaption></figcaption></figure>

The following properties can be configured for the SQL database connection:

* The database provider (client)
* The database connection string
* The SQL Query to be executed (when SQL Query mode has been selected).

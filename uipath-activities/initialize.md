---
title: Initialize
parent: UIPath Activities
nav_order: 1
description: >-
  Initialize an AIForged Connection Context object with your AIForged Username
  and Password.
---

# Initialize Connection Context

**Properties**

* **Input**
  * **URL**
    * **Type:**`string`
    * **Description:** The AIForged API base URL. Default is`https://portal.aiforged.com`.
    * **Default Value:**`"https://portal.aiforged.com"`
  * **Username**
    * **Type:**`string`
    * **Description:** Your AIForged username.
  * **Password (Plain Text)**
    * **Type:**`string`
    * **Description:** Your AIForged password in plain text. Use the secure option if possible.
  * **Password (Secure String, Recommended)**
    * **Type:**`SecureString`
    * **Description:** Your AIForged password in`System.Security.SecureString`format.
  * **Connection Timeout**
    * **Type:**`TimeSpan?`
    * **Description:** The API connection timeout.
    * **Default Value:**`TimeSpan.FromMinutes(30)`
  * **Proxy Server**
    * **Type:**`string`
    * **Description:** Proxy server address.
  * **Proxy Username**
    * **Type:**`string`
    * **Description:** Proxy username.
  * **Proxy Password (Plain Text)**
    * **Type:**`string`
    * **Description:** Proxy password in plain text.
  * **Proxy Secure Password (Secure String, Recommended)**
    * **Type:**`SecureString`
    * **Description:** Proxy password in`System.Security.SecureString`format.
  * **Request Logging**
    * **Type:**`bool?`
    * **Description:** Enable or disable logging of API requests.
    * **Default Value:**`false`
  * **Response Logging**
    * **Type:**`bool?`
    * **Description:** Enable or disable logging of API responses.
    * **Default Value:**`false`
  * **Throw on Exception**
    * **Type:**`bool?`
    * **Description:** Specify whether to throw exceptions.
    * **Default Value:**`true`
* **Output**
  * **User Info**
    * **Type:**`AIForged.API.UserViewModel`
    * **Description:** Outputs the user information for the authenticated user.

**Usage**

1. **Setup Activity:**
   * Add the "Initialize Connection Context" activity to your UiPath workflow.
   * Configure the required input arguments:
     * **URL:** Provide the API base URL if different from the default.
     * **Username:** Enter your AIForged username.
     * **Password or Secure Password:** Enter your AIForged password in either plain text or secure string format.
   * Optionally, configure:
     * **Connection Timeout:** Set a custom timeout for the API connection.
     * **Proxy Server and Credentials:** Specify proxy settings if required.
     * **Logging and Exception Handling:** Adjust logging and exception handling options as needed.
2. **Execution:**
   * The activity executes asynchronously, establishing a connection to the AIForged API and initializing the connection context.
   * It uses the provided credentials and configuration to authenticate and set up the context.
3. **Output:**
   * The activity outputs an`API.Context`object, which can be used in subsequent activities within the scope.
   * Additionally, it provides`User Info`, which contains details about the authenticated user.

**Considerations**

* **Security:** Use secure strings for passwords to enhance security. Avoid using plain text passwords where possible.
* **Proxy Configuration:** Ensure proxy settings are correct if your network requires proxy authentication.
* **Error Handling:** Consider how exceptions should be handled in your workflow, using the`Throw on Exception`property to control behavior.

---
description: Initialize an AIForged Connection Context using credentials or API key, with automatic context propagation to nested AIForged activities.
---

# Initialize Connection Context

Initialize and authenticate an AIForged API context for use within a workflow scope. Activities placed inside this scope automatically inherit the Context if their own Context property is left unset.

## Properties

- Input
    - URL
        - Type: `string`
        - Description: The AIForged API base URL. Default is `https://portal.aiforged.com`.
        - Default Value: `"https://portal.aiforged.com"`
    - Username
        - Type: `string`
        - Description: Your AIForged username.
    - Password (Plain Text)
        - Type: `string`
        - Description: Your AIForged password in plain text. Use the secure option if possible.
    - Password (Secure String, Recommended)
        - Type: `SecureString`
        - Description: Your AIForged password in `System.Security.SecureString` format.
    - API Key (Plain Text)
        - Type: `string`
        - Description: Your AIForged API key in plain text. Optional; prefer the secure option when possible.
    - API Key (SecureString, Recommended)
        - Type: `SecureString`
        - Description: Your AIForged API key in `System.Security.SecureString` format. Recommended for production.
    - Connection Timeout
        - Type: `TimeSpan?`
        - Description: The API connection timeout.
        - Default Value: `TimeSpan.FromMinutes(30)`
    - Proxy Server
        - Type: `string`
        - Description: Proxy server address.
    - Proxy Username
        - Type: `string`
        - Description: Proxy username.
    - Proxy Password (Plain Text)
        - Type: `string`
        - Description: Proxy password in plain text.
    - Proxy Secure Password (Secure String, Recommended)
        - Type: `SecureString`
        - Description: Proxy password in `System.Security.SecureString` format.
    - Request Logging
        - Type: `bool?`
        - Description: Enable or disable logging of API requests.
        - Default Value: `false`
    - Response Logging
        - Type: `bool?`
        - Description: Enable or disable logging of API responses.
        - Default Value: `false`
    - Throw on Exception
        - Type: `bool?`
        - Description: Specify whether to throw exceptions.
        - Default Value: `true`

- Output
    - User Info
        - Type: `AIForged.API.UserViewModel`
        - Description: Outputs the user information for the authenticated user.

## Usage

1. Setup Activity
    - Add the "Initialize Connection Context" activity to your UiPath workflow.
    - Configure required inputs:
        - URL: Provide the API base URL if different from the default.
        - Authentication:
            - Username + Password (plain or secure), or
            - API Key (plain or secure; recommended to use secure).
        - You may provide both when supported by your environment.
    - Optional inputs:
        - Connection Timeout: Set a custom timeout for the API connection.
        - Proxy Server and Credentials: Specify proxy settings if required.
        - Logging and Exception Handling: Adjust Request/Response logging and `Throw on Exception` as needed.

2. Execution
    - The activity executes asynchronously, establishing a connection to the AIForged API and initializing the connection context.
    - It uses the provided credentials and/or API key to authenticate and set up the context.
    - Automatic Context Propagation:
        - Any AIForged activity nested within the Initialize scope automatically has its Context set if its own Context property is left unset.
        - Explicit Context set on a child activity overrides the inherited Context.

3. Output
   - The activity outputs an `API.Context` object, which can be used in subsequent activities within the scope.
   - Additionally, it provides `User Info`, which contains details about the authenticated user.

## Considerations

- Security
    - Prefer secure strings for passwords and API keys.
    - Avoid storing secrets as plain text in source control or shared repositories.
- Authentication Choice
    - Use API key for service-to-service scenarios or non-interactive runs.
    - Use Username/Password for user-auth flows or when an API key is unavailable.
- Proxy Configuration
    - Ensure proxy settings are correct if your network requires proxy authentication.
- Error Handling
    - Control exception behaviour using `Throw on Exception`.
    - Consider workflow-level `Try/Catch` and `ContinueOnError` for fault tolerance.
- Context Scope & Overrides
    - Place Initialize at the start of the main sequence or library entry point.
    - Child activities inside the Initialize scope inherit Context automatically.
    - Activities outside the scope do not inherit Context—set their Context explicitly or add a local Initialize scope.
    - For parallel branches calling different Tenants/credentials, set explicit Context per branch to avoid unintended inheritance.
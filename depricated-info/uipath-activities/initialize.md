# Initialize

## About

The **Initialize** activity creates a connection context to AIForged with authenticated user information and token.

### Properties

### Display Name

Initialize

### Input

**Context** - Requires a context for the connection to **AIForged**. Includes connection configuration information, user information, and authentication information. This is a regular VB or C# expression.

**Password** – (deprecated) - AIForged.API Password used when creating your **AIForged** account. The variable type is **String**.

**SecurePassword** – The AIForged.API SecurePassword used when creating your **AIForged** account. The variable type is **SecureString**.

**Timeout** – API Connection timeout on queries. The variable type is **TimeSpan**.

**URL** – AIForged.API endpoint base URL. The variable type is **String**.

**Username** – AIForged.API username used when creating your **AIForged** account. The variable type is **String**.

### Misc

**Private** - If not selected, the values of variables and arguments are at the Verbose level.

**Result** - Returns AIForged.API.Context

### Output

**User** - It will return an output of **API.UserViewModel**. The **output** will contain all user information.

### Proxy

**ProxyPassword** - (deprecated) - AIForged.API **proxy** SecurePassword for the **proxy server**. The variable type is **SecureString**.

**ProxyServer** – This is the proxy server address. The variable type is **String**.

**ProxyUsername** - This is the proxy server address username. The variable type is **String.**

## Activity Preview

### Activity View

<figure><img src="../../.gitbook/assets/image (30) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

### Activity Property View

<figure><img src="../../.gitbook/assets/image (18) (6).png" alt=""><figcaption></figcaption></figure>

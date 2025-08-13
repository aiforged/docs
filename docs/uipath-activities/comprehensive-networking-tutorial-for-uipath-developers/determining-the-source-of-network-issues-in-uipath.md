# Determining the Source of Network Issues in UIPath

When a network issue arises, it can be challenging to determine whether it originates from the endpoint server or a proxy server. Here are some practical examples of how UIPath developers can use UIPath activities to diagnose the source of these issues:

**Example 1: Analyzing Response Headers**

UIPath can capture and analyze HTTP response headers, which often contain clues about the server handling the request. Here's how you can do this:

1. **Use the HTTP Request Activity:**
   * Drag the HTTP Request activity into your workflow.
   * Configure the request with the necessary URL, method, and headers.
2. **Capture Response Headers:**
   * Use the`Output`property of the HTTP Request activity to store the response.
   * Access the`Headers`property of the response object to analyze key headers like`Via`,`Server`, or`X-Cache`.
3.  **Example Workflow:**

    ```plaintext
    - HTTP Request: Send a request to the target URL.
    - Assign: responseHeaders = httpResponse.Headers
    - For Each header In responseHeaders
        - Log Message: Log header.Key & ": " & header.Value
    ```

    By reviewing the logged headers, you can identify if a proxy was involved (e.g., presence of

    `Via`or`X-Proxy-ID`headers).

**Example 2: Logging and Analyzing Error Messages**

UIPath workflows can log error messages from responses, which might indicate the source of the problem.

1. **Use Try-Catch Blocks:**
   * Surround your HTTP Request activity with a Try-Catch block to catch exceptions.
2. **Log Error Messages:**
   * In the Catch section, use the Log Message activity to log the exception message and details from the response body.
3.  **Example Workflow:**

    ```plaintext
    Try
        - HTTP Request: Send a request to the target URL.
    Catch Exception e
        - Log Message: Log "Error occurred: " & e.Message
        - Log Message: Log "Response Body: " & httpResponse.Content
    ```

    Reviewing the logged error messages can provide insights into whether the issue is with the endpoint or the proxy.

**Example 3: Using Traceroute with PowerShell**

UIPath can execute PowerShell scripts to perform a traceroute, helping identify if a proxy is causing delays.

1. **Invoke PowerShell Activity:**
   * Drag the Invoke PowerShell activity into your workflow.
2. **Configure Traceroute Script:**
   * Enter the script:`tracert -d [server address]`(omit DNS resolution for faster results).
3. **Log Traceroute Results:**
   * Capture the output and use the Log Message activity to log the traceroute results.
4.  **Example Workflow:**

    ```plaintext
    - Invoke PowerShell: CommandText = "tracert -d google.com"
    - Assign: tracerouteResult = output from PowerShell
    - Log Message: Log "Traceroute Results: " & tracerouteResult
    ```

    Analyze the traceroute results to identify where delays or failures occur, indicating potential proxy involvement.

**Example 4: Testing Direct and Indirect Access**

If possible, compare the results of requests sent directly to the endpoint versus through a proxy.

1. **HTTP Request Activity for Direct Access:**
   * Configure and send a request directly to the endpoint server (if accessible).
2. **HTTP Request Activity for Indirect Access:**
   * Configure and send a request through the proxy server.
3. **Compare Responses:**
   * Log and compare status codes and response times for both requests.
4.  **Example Workflow:**

    ```plaintext
    - HTTP Request (Direct): Send request to endpoint
    - Assign: directResponse = httpResponse
    - HTTP Request (Proxy): Send request through proxy
    - Assign: proxyResponse = httpResponse
    - Log Message: Log "Direct Status: " & directResponse.StatusCode
    - Log Message: Log "Proxy Status: " & proxyResponse.StatusCode
    ```

    Differences in status codes or response times can indicate whether the proxy is affecting the request.

***

By implementing these examples in UIPath workflows, developers can gain better insights into whether network issues stem from endpoint servers or proxy servers, allowing for more efficient troubleshooting and resolution.

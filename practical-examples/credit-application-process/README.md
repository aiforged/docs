# Credit Application Process

## The Process

This example will walk through the process of **Credit Application.** This process typically involves a client filling out a credit application form, specifying details about themselves, the request loan amount, and supplying supporting documentation, such as bank statements and proof of identification.

This example process will include the following steps:

1. Extracting data from a [**Credit Application Form**](https://app.gitbook.com/s/wGU031tORUeUkwcAHz0u/\~/changes/nbTVMuwVbF6EHEm97F34/practical-examples/step-3.-credit-application-form).
2. Extracting data from a corresponding [**Social Security card**](https://app.gitbook.com/s/wGU031tORUeUkwcAHz0u/\~/changes/nbTVMuwVbF6EHEm97F34/practical-examples/social-security-number-card).
3. Extracting data from a corresponding [**Bank Statement**](https://app.gitbook.com/s/wGU031tORUeUkwcAHz0u/\~/changes/nbTVMuwVbF6EHEm97F34/practical-examples/bank-statement).
4. Comparing results from step 1 with the results of step 2 and step 3, and ultimately [**approving or rejecting the application**](./#the-process).

## How to write Custom Code to compare values from the different services.

At this stage, all the data has been extracted from all the relevant documentation. The business logic to **approve or reject** the application should be implemented. In this example, we will compare the **Social Security number** written on the application form with what was extracted by our SSN service. Similarly, we will compare the **salary** that was written on the form, with what was extracted by our bank statement service.

If the Social Security numbers don't match, the application will be rejected. Similarly, if the salaries don't match within a threshold of 20 %, the application will be **rejected**. Otherwise, if both fields match the application will be **approved**.

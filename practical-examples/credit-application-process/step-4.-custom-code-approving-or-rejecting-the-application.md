# Step 4. Custom Code: Approving or rejecting the application

## How to write Custom Code to compare values from the different services.

At this stage, all the data has been extracted from all the relevant documentation. The business logic to **approve or reject** the application should be implemented. In this example, we will compare the **Social Security number** written on the application form with what was extracted by our SSN service. Similarly, we will compare the **salary** that was written on the form, with what was extracted by our bank statement service.

If the Social Security numbers don't match, the application will be rejected. Similarly, if the salaries don't match with a threshold of 20 %, the application will be rejected.

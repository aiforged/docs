---
title: Credit Application Process - Accept or Reject the Application
parent: Practical Examples
nav_order: 5
---

# Credit Application Process: Accept or Reject the Application

## The Process

This example will walk through the process of **Credit Application.** This process typically involves a client filling out a credit application form, specifying details about themselves, the request loan amount, and supplying supporting documentation, such as bank statements and proof of identification.

This example process will include the following steps:

1. Extracting data from a [**Credit Application Form**](credit-application-form.md).
2. Extracting data from a corresponding [**Social Security card**](social-security-number-card.md).
3. Extracting data from a corresponding [**Bank Statement**](bank-statement.md).
4. Comparing results from step 1 with the results of step 2 and step 3, and ultimately [**approving or rejecting the application**](credit-application-process-accept-or-reject-the-application.md#how-to-write-custom-code-to-compare-values-from-the-different-services.).

## How to write Custom Service Code to compare values from the different services.

At this stage, all the data has been extracted from all the relevant documentation. The business logic to **approve or reject** the application should be implemented. In this example, The **Social Security number** written on the application form will be compared with what was extracted by the **SSN service**. Similarly, the **salary** that was written on the form will be compared with what was extracted by the **Bank Statement Service**.

If the Social Security numbers don't match, the application will be rejected. Similarly, if the salaries don't match within a threshold of 20 %, the application will be **rejected**. Otherwise, if both fields match the application will be **approved**.

In order to write custom code that will execute after document data has been extracted, a **Custom Service Code** utility must be added to the service. Please see [**Custom Service Code**](../services/custom-service-code/) to add this utility and an overview of object data types and method prototypes.

## Code sample walkthrough (C#)

This section will discuss in detail the code that is required to implement the **rejection logic of the Credit Application** process, as explained in the [previous section](credit-application-process-accept-or-reject-the-application.md#how-to-write-custom-workflow-code-to-compare-values-from-the-different-services.).

1.  Check the number of docs linked to the service and skip **Custom Service Code** execution if no documents exist.

    ```csharp
    if (docs == null) return new AIForged.Services.ProcessResult(docs);
    ```
2.  Add some logging to indicate to the user that the processing has started by using **logger.LogInformation.**

    ***

    ```csharp
    logger.LogInformation("{stpd} Start", stpd.Name);
    ```
3.  Get the **Parameter Definitions** of the specific fields of interest specified on the [**Credit Application Form**](credit-application-form.md), and compare the extracted values with what is provided by the supporting docs, [**Bank Statements**](bank-statement.md)**,** and [**Social Security Card**](social-security-number-card.md). In this sample, it is required to iterate through the **transaction items** extracted from the **Bank Statement** service. To this end, the **Parameter Definitions** for the **Description** and **Amount** columns in the **Transactions Table** of the **Bank Statements** service. The **Parameter Definition** IDs of these columns can be used to retrieve the **Parameter Definition** objects by calling **module.FindParameters**.\


    ```csharp
    IParameterDef pdDescription = module.FindParameterDef(78090);    //Replace 78090 with your Paramdef ID
    IParameterDef pdCredit = module.FindParameterDef(78092);        //Replace 78092 with your Paramdef ID
    IParameterDef pdAccountHolderName = module.FindParameterDef(78148);    //Replace 78148 with your Paramdef ID
    ```
4.  In order to save the values of the **Parameters** defined by the **Parameter Definitions**, a **Custom Dataset** is created in order to share the extracted values between services. This dataset needs to be created using the **Settings View** of the **Parent Service** of the **Custom Service Code.**\
    ****

    <figure><img src="../.gitbook/assets/image (23).png" alt=""><figcaption></figcaption></figure>

    Click on **Create Custom Dataset** in the **Service Parameter** view.\


    <figure><img src="../.gitbook/assets/image (73).png" alt=""><figcaption></figcaption></figure>

    Enter a name for the new **Custom Dataset**, for instance "BankStatementsDataSet" and click **Submit**.

    <figure><img src="../.gitbook/assets/image (31).png" alt=""><figcaption></figcaption></figure>

    This will create a **Parameter Definition** for the **BankStatementsDataset Custom Dataset**. Note the ID of the **Parameter Definition**.\


    <figure><img src="../.gitbook/assets/image (71).png" alt=""><figcaption></figcaption></figure>
5.  Add column names for **Name** and **Salary** to the **Custom Dataset**. \*\*\*\* Double-click on the **BankStatementsDataset Custom Dataset** to open the dialogue.\


    <figure><img src="../.gitbook/assets/image (13) (1).png" alt=""><figcaption></figcaption></figure>

    Enter **Name** in the Column Name textbox, and click on **New Column** to add a column for **Name**. Repeat for the column name **Salary**.\


    <figure><img src="../.gitbook/assets/image (49).png" alt=""><figcaption></figcaption></figure>

    <figure><img src="../.gitbook/assets/image (67).png" alt=""><figcaption></figcaption></figure>
6.  As mentioned, this **Custom Dataset** was created for the **Parent Service** of the **Custom Service Code**. The **Parent Service** can be retrieved in code in order to access the **Custom Dataset** by calling **module.GetParentService**. The **Custom Dataset** object can be retrieved by calling **module.GetDataSetByDef**.\


    ```csharp
    var parentservice = module.GetParentService();
    ICustomDataSet dataset = module.GetDataSetByDef(parentservice, 78817, false, false, null, null, null, null); //ID 78817: BankStatementDataset
    ```
7.  To retrieve the column **Parameter Definitions** in a **Custom Dataset**, make use of **modulde.FindField**.\


    ```csharp
    ParameterDefViewModel name = dataset.FindField(78820);  // Name
    ParameterDefViewModel salary = dataset.FindField(78821);   // Salary
    ```
8.  Iterate through all the documents that was processed in the batch. Add a **try-catch** clause to handle any exceptions:\


    ```csharp
    foreach (IDocument doc in docs) 
    { 
      try 
      {
        // Custom Code logic per document comes here
        
      }
      catch (Exception ex) 
      {
        logger.LogError(ex, "{stpd} Cannot process {docid} {docfilename}\n{error}", stpd.Name, doc.Id, doc.Filename, ex.ToString());
      }
    }
    ```
9.  Try to find possible **Salary** entries from the **Bank Statement** by using the **Description** column parameter of the **Transactions Table** by calling **module.GetParameters**.\


    ```csharp
    List<IDocumentParameter> parDescriptions = module.GetParameters(doc, pdDescription, true, null);
    parDescriptions = parDescriptions.OrderBy(d => d.Id).ToList();
    ```

    \
    Add a zero-count check and return the **Custom Service Code** if no bank statement data was found. Otherwise, a comparison can't be done.\


    ```csharp
    if (parDescriptions.Count == 0)
    {
        logger.LogWarning("{stpd} No Bank Statement entries found!", stpd.Name);
        return;
    }
    ```


10. Iterate through each **Description Parameter**, get the text value extracted by the OCR, in either the Document **Parameter** or **Verification** value, and determine the **Levenshtein Confidence** between the parameter value, and the expected text for a salary entry on the bank statement. In this case, the text "Account Transfer In" is used to denote a salary deposit, and **Levenshtein Confidence** of 80 % (normalized as 0.8) is chosen.\


    ```csharp
    foreach (IDocumentParameter parDescription in parDescriptions)
    {
        if (parDescription?.Value == null || string.IsNullOrEmpty(parDescription?.Value))
        {
            continue;
        }
        
        IVerification verDescription = parDescription.Verifications.OrderBy(v => v.Id).LastOrDefault();            
        string descriptionText = parDescription?.Value ?? verDescription?.Value;
        
        var distance = LarcAI.Core.Utilities.LevenshteinDistance(descriptionText, "Account Transfer In");
        var conf = LarcAI.Core.Utilities.LevenshteinConfidence(descriptionText, distance, "Account Transfer In");
        
        if (conf >= 0.80)
        {
            // Add Logic based on the Levenshtein confidence value
        }
    }
    ```


11. If the **Levenshtein Confidence** is greater than 0.8, a parameter from the **Transactions Table** has been matched as a salary deposit entry. The next step is to get the extracted values from the corresponding **Credit** column from the **Transactions Table**. This is accomplished by using the table **Index** of the matched **Description** parameter, and findin the corresponding value extracted from the **Credit** column. This is done by calling **module.GetParameters** and specifying the **Credit Parameter Definition** and the table **Index**.\


    ```csharp
    IDocumentParameter parCredit = module.GetParameters(doc, pdCredit, true, parDescription.Index).OrderBy(d => d.Id).ToList().LastOrDefault();
    IVerification verCredit = parCredit.Verifications.OrderBy(v => v.Id).LastOrDefault();
    string creditText = parCredit?.Value ?? verCredit?.Value;
    logger.LogInformation("{stpd} {var} val {val}", stpd.Name, salary.Name, creditText);
    ```
12. The **Account Holder Name** parameter was also extracted from the bank statement and is used to build up the record to be added to the **Custom Dataset**.\


    ```csharp
    IDocumentParameter parName = module.GetParameters(doc, pdAccountHolderName, true, null).OrderBy(d => d.Id).ToList().LastOrDefault();
    IVerification verName = parName.Verifications.OrderBy(v => v.Id).LastOrDefault();
    string nameText = parName?.Value ?? verName?.Value;
    logger.LogInformation("{stpd} {var} val {val}", stpd.Name, name.Name, nameText);
    ```


13. If either of the **Account Holder Name** or **Credit** text could not have been extracted for the current document, then the document is skipped and the next document is processed.\


    ```csharp
    if(string.IsNullOrEmpty(creditText) || string.IsNullOrEmpty(nameText))
    {
        break;
    }
    ```

    \

14.
15.

## Code Sample (C#)

```csharp
//Custom Code: Please refer to documentation
if (docs == null) return new AIForged.Services.ProcessResult(docs);
logger.LogInformation("{stpd} Start", stpd.Name);

var parentservice = module.GetParentService();

IParameterDef pdDescription = module.FindParameterDef(78090);
IParameterDef pdCredit = module.FindParameterDef(78092);
IParameterDef pdAccountHolderName = module.FindParameterDef(78148);

// Get the dataset
ICustomDataSet dataset = module.GetDataSetByDef(parentservice, 78817, false, false, null, null, null, null); //78817: BankStatementDataset
ParameterDefViewModel name = dataset.FindField(78820);  // Name
ParameterDefViewModel salary = dataset.FindField(78821);   // Salary

logger.LogInformation("{stpd} No of Docs {no}", stpd.Name, docs.Count);

foreach (IDocument doc in docs)
{
    try
    {
        // Look for possible Salary entries
        List<IDocumentParameter> parDescriptions = module.GetParameters(doc, pdDescription, true, null);
        parDescriptions = parDescriptions.OrderBy(d => d.Id).ToList();

        if (parDescriptions.Count == 0)
        {
            logger.LogWarning("{stpd} No Bank Statement entries found!", stpd.Name);
            return;
        }

        // For each description in the Transactions table
        foreach (IDocumentParameter parDescription in parDescriptions)
        {
            if (parDescription?.Value == null || string.IsNullOrEmpty(parDescription?.Value))
            {
                continue;
            }

            IVerification verDescription = parDescription.Verifications.OrderBy(v => v.Id).LastOrDefault();            
            string descriptionText = parDescription?.Value ?? verDescription?.Value;

            var distance = LarcAI.Core.Utilities.LevenshteinDistance(descriptionText, "Account Transfer In");
            var conf = LarcAI.Core.Utilities.LevenshteinConfidence(descriptionText, distance, "Account Transfer In");

            if (conf >= 0.80)
            {
                // Get the corresponding Credit Value
                IDocumentParameter parCredit = module.GetParameters(doc, pdCredit, true, parDescription.Index).OrderBy(d => d.Id).ToList().LastOrDefault();
                IVerification verCredit = parCredit.Verifications.OrderBy(v => v.Id).LastOrDefault();
                string creditText = parCredit?.Value ?? verCredit?.Value;
                logger.LogInformation("{stpd} {var} val {val}", stpd.Name, salary.Name, creditText);

                // Get Account Holder Name
                IDocumentParameter parName = module.GetParameters(doc, pdAccountHolderName, true, null).OrderBy(d => d.Id).ToList().LastOrDefault();
                IVerification verName = parName.Verifications.OrderBy(v => v.Id).LastOrDefault();
                string nameText = parName?.Value ?? verName?.Value;
                logger.LogInformation("{stpd} {var} val {val}", stpd.Name, name.Name, nameText);

                if(string.IsNullOrEmpty(creditText) || string.IsNullOrEmpty(nameText))
                {
                    break;
                }

                // Add record to dataset
                ICustomDataSetRecord dsrec = new CustomDataSetRecord();
                dsrec.SetValue(name, nameText);
                dsrec.SetValue(salary, creditText);

                await module.SaveDataSetRecord(dataset, dsrec);

                logger.LogInformation("{stpd} Saving dataset record", stpd.Name);
                module.SaveChanges();
            }   
        }
    }
    catch (Exception ex) 
    {
        logger.LogError(ex, "{stpd} Cannot process {docid} {docfilename}\n{error}", stpd.Name, doc.Id, doc.Filename, ex.ToString());
    }
}
```

\\

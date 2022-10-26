---
description: >-
  This code sample demonstrates a simple technique utilizing a custom code
  utility service together with a custom dataset to prevent a service from
  processing duplicate documents.
---

# Custom Code Utility: Duplicate Document Check

This code sample will look at implementing an MD5 hash check against documents that will be processed by a service. Each document's MD5 hash will be checked against the MD5 hashes stored within a custom dataset. If a match is found, the offending document will be placed into an error state, removed from further processing, and a corresponding workflow item will be created. If a match is not found, then the document's MD5 hash will be stored in the custom dataset, and the document will be allowed to continue with processing.

To start, let's add a new **Custom Code utility service** to an existing **Email Scraping** service.\
The **Email Scraping** service includes a nested **Attachment** service by default that performs individual processing on attachments from scraped emails. This is the service where we will nest our **Custom Code** utility.

* First, open the **Service Detail View** for the **Email Scraping** service by clicking on its **Service Card** in your project.\
  ![](<../.gitbook/assets/image (12) (3).png>)
* Click on an empty space within the header of the nested **Attachment Service Card** to open the **Attachment** service's detail view:\
  ![](<../.gitbook/assets/image (15) (4).png>)
* Click on the **Add Utility** button in the **Command Bar**.\
  ![](<../.gitbook/assets/image (3) (3) (1).png>)
* Select **Custom Code** from the **Service Type Selection Dialog** under the **Utilities** section and then click on **Select** to confirm your selection.\
  ![](<../.gitbook/assets/image (21) (1) (1).png>)

Next, we need to add a **Custom Dataset** to our new **Custom Code utility service**. The **Custom Dataset** will store the MD5 hash strings for our non-duplicate documents.

1. To do this, open the **Configuration View** of our newly nested **Custom Code utility service** by clicking on the button with the **Gear Icon** in its nested service card.\
   ![](<../.gitbook/assets/image (10) (1).png>)
2. In the configuration view select the main definition for our **Custom Code utility service** (the first configuration line), and then click on **Create Custom Dataset.**\
   ![](<../.gitbook/assets/image (6) (1) (4).png>)
3. Enter **Duplicate History** as the name for our **Custom Dataset**, and click on **Submit**.\
   ![](<../.gitbook/assets/image (9) (4).png>)
4. **Double-click** on the newly created definition for our **Custom Dataset** to open the dataset editor:\
   ![](<../.gitbook/assets/image (16) (1).png>)\
   ![](<../.gitbook/assets/image (11) (1) (1).png>)

We are going to add two **Fields** to our **Custom Dataset**. **Fields** are visualized as **Columns** within our dataset editor. These **Fields** will contain an MD5 hash string as well as a unique document identifier for each document processed by our **Custom Code**.

To add these **Fields** to the **Custom Dataset**, enter the name of the column in the **Column Name** field in the editor and click on **New Column:**

* Add **MD5Hash** as a new column:\
  ![](<../.gitbook/assets/image (18) (4).png>)
* Add **DocumentId** as a new column.\
  ![](<../.gitbook/assets/image (19) (5).png>)

Click on **Save** to save the changes made to the **Custom Dataset**.\
![](<../.gitbook/assets/image (17) (1).png>)

Your **Custom Dataset** should now look as follows in the configuration view (you may need to refresh the view):\
![](<../.gitbook/assets/image (2) (5).png>)

Next, we need to add some code to our **Custom Code** utility.

Close the **Configuration View** for the **Custom Code** utility, and click on the **Code** button on the nested **Service Card**.\
![](<../.gitbook/assets/image (4) (3).png>)

* Select **C#** from the **Code Language** dropdown.\
  ![](<../.gitbook/assets/image (5) (1).png>)
* Copy and paste the following code into the code editor area:

```csharp
//Log the start of our custom code processing
logger.LogInformation("{stpd} Start", stpd.Name);

//Check that we have docs to process, if no documents are available to process skip running the rest of code
if (docs == null) 
{
    logger.LogInformation("{stpd} Found no docs, continuing...", stpd.Name);
    return new AIForged.Services.ProcessResult(docs);
}

//Get the parent service for our nested custom code service. This will be used in certain places within the code.
var parentservice = module.GetParentService();

logger.LogInformation("{stpd} Found {count} docs...", stpd.Name, docs.Count());

//Retrieve our Duplicate History custom dataset. Replace the Id of the dataset and its fields with the Ids from your dataset and fields
logger.LogInformation("{stpd} Get Custom History DataSet", stpd.Name);
ICustomDataSet dataset = module.GetDataSetByDef(stpd, /* Document History definition Id here */, false, false, null, null, null, null);
ParameterDefViewModel fieldDocId = dataset.FindField(/* DocumentId field definition Id here */);
ParameterDefViewModel fieldMD5Hash = dataset.FindField(/* MD5Hash field definition Id here */);

//Initialise list to store skipped docs
List<int> skippedDocIds = new List<int>();

//Get the various users that may be used in our work item creation
List<IProjectUser> adminusers = module.GetUsers(parentservice.Id, LinkType.Shared, new List<string> { "admin", "verifyadmin" })?.Where(u => u.Status == ProjectUserStatus.Approved && u.UserId == "03900e73-0d04-4d22-8061-c9e6f27773e5")?.ToList();
foreach (var usr in adminusers) 
{
    logger.LogInformation("{stpd} Admin User {id} {status} {role}", stpd.Name, usr.UserId, usr.Status, usr.Role);    
}

List<IProjectUser> doclayoutusers = module.GetUsers(parentservice.Id, LinkType.Shared, new List<string> { "doclayout" })?.Where(u => u.Status == ProjectUserStatus.Approved)?.ToList();
foreach (var usr in doclayoutusers) 
{
    logger.LogInformation("{stpd} Document Layout User {id} {status} {role}", stpd.Name, usr.UserId, usr.Status, usr.Role);    
}

List<IProjectUser> verifyusers = module.GetUsers(parentservice.Id, LinkType.Shared, new List<string> { "verifydoc" })?.Where(u => u.Status == ProjectUserStatus.Approved)?.ToList();
foreach (var usr in verifyusers) 
{
    logger.LogInformation("{stpd} Verification User {id} {status} {role}", stpd.Name, usr.UserId, usr.Status, usr.Role);    
}

//Step through each document and test whether or not it is a duplicate
foreach (IDocument childDoc in docs)
{
    try
    {
        //If the document is in an error state before we start our checks, something else may have gone wrong.
        //Create a work item to notify Human in the Loop of this problematic document.
        if (childDoc.Status == DocumentStatus.Error)
        { 
            logger.LogInformation("{stpd} Document is in error state: {docid}", stpd.Name, childDoc.Id);
            //This work item will be assigned to a verification user
            var usr = module.PickRandom(verifyusers, null);

            if (usr != null) 
            {
                //Create a new work item and pass the current document comment, which will contain the error message, as the work item message
                var wi = module.CreateWorkItem(usr, 
                    WorkItemType.Document, 
                    WorkItemStatus.Created, 
                    WorkItemAction.Verify, 
                    WorkItemMethod.Random, 
                    new TimeSpan(24,0,0), 
                    parentservice.Id, 
                    childDoc.MasterId, 
                    null, 
                    null, 
                    null, 
                    null, 
                    null, 
                    childDoc.Comment, 
                    childDoc.Result);            
                module.SaveChanges();
            }
            continue;
        }

        logger.LogInformation("{stpd} Process Document {docid} {docfilename}", stpd.Name, childDoc.Id, childDoc.Filename);
        logger.LogInformation("{stpd} Get document data", stpd.Name);
        
        //We need to get our document data / bytes in order to calculate an MD5 hash
        var docData = module.GetDocumentData(childDoc, null);

        if (docData == null)
        {
            logger.LogInformation("{stpd} Could not get document data", stpd.Name);
            module.SetDocumentStatus(childDoc, DocumentStatus.Error, "Could not get document data to calculate MD5 hash.", null, true, false, true);
            skippedDocIds.Add(childDoc.MasterId ?? childDoc.Id);
            module.SaveChanges();
            continue;
        }

        logger.LogInformation("{stpd} Get document MD5 hash.", stpd.Name);

        //Initialise byte array that will contain our MD5 hash
        byte[] docHash = null;

        using (var md5 = System.Security.Cryptography.MD5.Create())
        {
            //Calculate our MD5 hash from document's data byte array
            md5.TransformFinalBlock(docData.FirstOrDefault().Data, 0, docData.FirstOrDefault().Data.Length);
            docHash = md5.Hash;
        };

        //If the MD5 hash could not be calculated, log and skip
        if (docHash == null)
        {
            logger.LogInformation("{stpd} Could not calculate document's MD5 hash", stpd.Name);
            module.SetDocumentStatus(childDoc, DocumentStatus.Error, "Could not calculate document's MD5 hash", null, true, false, true);
            skippedDocIds.Add(childDoc.MasterId ?? childDoc.Id);
            module.SaveChanges();
            continue;
        }

        //Convert our hash byte array into a string representation
        var hashString = BitConverter.ToString(docHash).Replace("-", "");

        //Check if any matching hashes exist in our Document History dataset
        var checkHashes = module.GetDataSetRecords(dataset, fieldMD5Hash, hashString, false);

        if (checkHashes != null && checkHashes.Count() > 0)
        {
            //If a matching has is found, retrieve the document Id of the matching hash for logging purposes
            var checkHash = checkHashes.FirstOrDefault();
            var docId = checkHash.GetValue(fieldDocId).Value;

            //Log and create a work item to notify Human in the Loop of the duplcate document
            logger.LogInformation("{stpd} Document already processed: Previous document info: {docId}", stpd.Name, docId);
            module.SetDocumentStatus(childDoc, DocumentStatus.Error, $"Document already processed: Previous document info: {checkHash.GetValue(fieldDocId)}", null, true, false, true);
            var usr = module.PickRandom(verifyusers, null);
            if (usr != null) 
            {
                var wi = module.CreateWorkItem(usr, 
                    WorkItemType.Document, 
                    WorkItemStatus.Created, 
                    WorkItemAction.Verify, 
                    WorkItemMethod.Random, 
                    new TimeSpan(24,0,0), 
                    parentservice.Id, 
                    childDoc.MasterId, 
                    null, 
                    null, 
                    null, 
                    null, 
                    null, 
                    $"Document already processed: Previous document info: {docId}", 
                    $"Document already processed: Previous document info: {docId}");      
                module.SaveChanges();      
            }
            
            //Add the document to list of documents excluded from processing
            skippedDocIds.Add(childDoc.MasterId ?? childDoc.Id);
            continue;
        }

        //We could not find a matching record in the Document History dataset.
        //Let's store this document's MD5 hash to check duplicates against.
        //We create a new dataset record and set its values for the MD5 Hash and Document Id respectively
        logger.LogInformation("{stpd} This is a new document, creating hash record.", stpd.Name);
        var newHashRecord = dataset.CreateRecord(new Guid().ToString());

        newHashRecord.SetValue(fieldDocId.Id, $"Parent Doc Id: {childDoc.MasterId.ToString()} | Doc Id: {childDoc.Id.ToString()}" );
        newHashRecord.SetValue(fieldMD5Hash.Id, hashString);
        
        //Persist the dataset record to the Document History custom dataset
        await module.SaveDataSetRecord(dataset, newHashRecord);
        logger.LogInformation("{stpd} Hash record created. Continuing...", stpd.Name);

        //
        //Perform any additional processing here
        //

        module.SaveChanges();
    }
    catch (Exception ex)
    {
        logger.LogInformation("{stpd} An error occurred while processing document: {docid} \n {ex}.", stpd.Name, childDoc.Id, ex.ToString());
    }
}

//Remove any skipped documents from further processing
foreach (var skippedDocId in skippedDocIds)
{
    var skippedDoc = docs.FirstOrDefault(d => d.Id == skippedDocId);

    if (skippedDoc == null) continue;
    docs.Remove(skippedDoc);
}

//Return the list of documents that will continue processing
return new AIForged.Services.ProcessResult(docs);
```

* Replace **/\* Document History definition Id here \*/** with the unique identifier for the **Document History** custom dataset that you created.
* Replace **/\* DocumentId field definition Id here \*/** with the unique identifier for the **DocumentId** dataset field that you created.
* Replace **/\* MD5Hash field definition Id here \*/** with the unique identifier for the **MD5Hash** dataset field that you created.

For the MD5 Hash calculation to work, add the following assembly signature to the list of **Assemblies** referenced by your custom code:

* System.Security.Cryptography.Algorithms, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a\
  \
  ![](<../.gitbook/assets/image (114).png>)

Be sure to **Save** your custom code changes regularly by clicking on the **Save** button in the command bar.\
![](<../.gitbook/assets/image (8) (3) (3).png>)

To test that our **Custom Code** is working as designed we can send some duplicate documents to our **Email Scraping** service. If your custom code was setup correctly, then any duplicate documents will be placed into an error state, work items will be created and they will not be processed by any further nested services within the email scraping service.

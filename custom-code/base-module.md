---
layout: default
title: How To Install AIForged
nav_order: 21
---

# Base Module

#### The Base Service module is as follow.

```csharp
public interface IBaseModule
{
    public IProject Project { get; }
    public IParameterDef ServiceTypePD { get; }
    public int Stl { get; }
    public IParameterDef RootSetting { get; }
 
    (string value, float? distance, float? confidence) GetBestOption(string value, List<string> data, bool ignoreCase = true);
    (T value, float? distance, float? confidence)? GetBestOption<T>(string value,
        List<T> data,
        Func<T, string> getValue,
        bool ignoreCase = true)
        where T : notnull;
 
    IClasses GetClass(int classId);
    List<IClasses> GetClasses(IProject project);
    List<IClasses> GetClasses(int projectId);
    IClasses FindClassByName(int projectId, string name, LarcAI.Core.DictionaryLookupMethod? lookup = null, float minConfidence = 0.80F);
 
    List<IDocument> GetChildDocuments(IDocument doc, UsageType? usage, List<DocumentStatus> statuses);
    List<IDocument> GetChildDocuments(IDocument doc, int stpdId, UsageType? usage, List<DocumentStatus> statuses);
    List<IDocumentData> GetDocumentData(IDocument doc, List<DocumentDataType?> types);
    IDocument GetDocumentMaster(IDocument doc);
    IDocument SetDocumentStatus(IDocument doc,
        DocumentStatus status,
        string comment,
        string result,
        bool appendComment = true,
        bool appendResult = true,
        bool setMasterAlso = true);
 
    IDocument CopyDocument(IDocument doc, int stpdId, DocumentStatus status, UsageType usage, int? categoryId = null, bool? resetCategory = null);
    IDocument MoveDocument(IDocument doc, int stpdId, DocumentStatus status, UsageType usage, int? categoryId = null, bool? resetCategory = null);
 
    IParameterDef GetParentService();
    IParameterDef GetParentService(int id);
 
    IParameterDef FindParameterDef(int id);
    IParameterDef FindParameterDef(string name,
       int? parentId = null,
       int? classId = null,
       List<ParameterDefinitionCategory?> categories = null,
       List<GroupingType?> grouping = null,
       List<DAL.ValueType?> vtypes = null);
    IParameterDef FindParameterDef(string name,
        int stpdId,
        int? parentId = null,
        int? classId = null,
        List<ParameterDefinitionCategory?> categories = null,
        List<GroupingType?> grouping = null,
        List<DAL.ValueType?> vtypes = null);
    IParameterDef FindSetting(string name);
    IParameterDef FindSetting(IParameterDef stpd, string name, int? parentId);
 
    IDocumentParameter CreateParameter<T>(IDocument doc, IParameterDef pd, T value, int? index = null, int? parentId = null, byte[] data = null);
    IDocumentParameter CreateParameter<T>(int docId, int pdId, T value, int? index = null, int? parentId = null, byte[] data = null);
    IDocumentParameter FindParameter(int docId,
        int pdId,
        bool includeVerification = false,
        int? index = null);
    IDocumentParameter FindParameter(IDocument doc,
        int pdId,
        bool includeVerification = false,
        int? index = null);
 
    public List<IDocumentParameter> GetParameters(IDocument doc,
        IParameterDef pd,
        bool includeVerification = false,
        int? index = null);
    List<IDocumentParameter> GetParameters(IDocument doc,
        int pdId,
        bool includeVerification = false,
        int? index = null);
 
    List<IDocumentParameter> GetParameters(int docId,
        int pdId,
        bool includeVerification = false,
        int? index = null);
 
    List<IDocumentParameter> GetParameterChildren(IDocumentParameter par,
        bool includeParDefs = false,
        bool includeVerification = false);
 
    (int?, IParameterDef pd, IDocumentParameter par) FindParentIndex(IDocumentParameter par, int parentPdId);
    (int?, IParameterDef pd, IDocumentParameter par) FindParentIndex(IDocumentParameter par, string pdName);
 
    IDocumentParameter FindParameterByParentIndex(IDocumentParameter par,
        IParameterDef pd,
        IParameterDef parentPd,
        bool includeVerification = false);
 
    IDocumentParameter FindParameterByParentIndex(IDocumentParameter par,
        int pdId,
        int parentPdId,
        bool includeVerification = false);
 
    IDocumentParameter FindParameterByParentIndex(IDocumentParameter par,
        IParameterDef pd,
        string parentName,
        bool includeVerification = false);
 
    IDocumentParameter FindParameterByParentIndex(IDocumentParameter par,
        int pdId,
        string parentName,
        bool includeVerification = false);
 
    IDocumentParameter SetPassword(IDocument doc, string password);
    IDocumentParameter SetPassword(IDocument doc, IParameterDef parentPd, string password);
    IDocumentParameter SetPassword(IDocument doc, int? parentPdId, string password);
    IDocumentParameter GetVendorParameter(IDocument doc, string vendorParameterName = "VendorId");
    IDocumentParameter GetVendorParameter(int docId, string vendorParameterName = "VendorId");
    IDocumentParameter GetVendorParameter(IDocument doc, IParameterDef service, string vendorParameterName = "VendorId");
    IDocumentParameter GetVendorParameter(int docId, int serviceId, string vendorParameterName = "VendorId");
 
    List<IDocumentParameter> GetTrainedParameters(IParameterDef pd, int? classId = null);
    List<IDocumentParameter> GetTrainedParameters(int pdId, int? classId = null);
    public bool IsTrained(IParameterDef pd, int? classId = null, int minCount = 1);
 
    bool RequireVerification(IDocument doc);
    bool RequireVerification(int docId);
    int GetVerificationsCount(IDocument doc);
    int GetVerificationsCount(int docId);
    List<IDocumentParameter> GetVerificationParameters(IDocument doc);
    List<IDocumentParameter> GetVerificationParameters(int docId);
 
    (IDocumentParameter par, IVerification ver) FindVerification(IDocument doc, IParameterDef pd, int? index = null);
    (IDocumentParameter par, IVerification ver) FindVerification(IDocument doc, int pdId, int? index = null);
    (IDocumentParameter par, IVerification ver) FindVerification(int docId, int pdId, int? index = null);
    IVerification FindVerification(IDocumentParameter parameter);
    IVerification FindVerification(int? parameterId);
    List<IVerification> FindVerifications(IDocumentParameter parameter);
    List<IVerification> FindVerifications(int? parameterId);
    List<IVerification> FindVerifications(int? parameterId,
        VerificationType? type,
        VerificationStatus? status,
        string profider = null,
        string valuefilter = null,
        string infofilter = null,
        DateTime? fromDate = null,
        DateTime? toDate = null);
 
    IVerification FindVerification(int? parameterId,
        VerificationType? type,
        VerificationStatus? status,
        string profider = null,
        string valuefilter = null,
        string infofilter = null,
        DateTime? fromDate = null,
        DateTime? toDate = null);
 
    IVerification AddVerification(IVerification v, string result, string info = null);
    IVerification AddVerification(IVerification v, VerificationStatus status, string result, string info = null);
    IVerification AddVerification(IVerification v, VerificationStatus status, float? confidence, string result, string info = null);
    IVerification AddVerification(IVerification v,
        VerificationStatus status,
        float? confidence,
        string value,
        string result,
        string info,
        bool overridevalue,
        bool overrideconfidence,
        string provider = null,
        byte[] data = null);
 
    IVerification CreateVerification(IDocumentParameter par,
        VerificationStatus status,
        double? confidence,
        string value,
        string box = null,
        string result = null,
        string info = null);
 
    IVerification CreateVerification(IDocumentParameter par,
        VerificationStatus status,
        string box,
        double? confidence,
        string symbolsConfidence,
        string value,
        string result,
        string info,
        byte[] data,
        int? serviceId,
        int? settingId);
 
    Task<IVerification> ExecuteVerificationRuleAsync(IDocumentParameter p);
 
    List<(IDocumentParameter p, IVerification v)> FindHumanVerifications(IParameterDef pd, int count);
    List<(IDocumentParameter p, IVerification v)> FindHumanVerifications(int pdId, int count);
 
    Task<IApplicationUser> GetUserAsync(string userId);
    Task<List<IApplicationUser>> GetUsersAsync(IEnumerable<string> userIds);
    Task<IApplicationUser> GetUserAsync(IProjectUser pu);
    Task<List<IApplicationUser>> GetUsersAsync(IEnumerable<IProjectUser> pudata);
 
    List<IProjectUser> GetUsers(LinkType? type = null,
        List<string> roles = null,
        string permissions = null);
 
    List<IProjectUser> GetUsers(int projectId,
        int groupId,
        LinkType? type = null,
        List<string> roles = null,
        string permissions = null);
 
    IProjectUser PickRandom(List<IProjectUser> projectUsers, string excludeUserId);
 
    List<(string userid, int count, double avg)> GetUserKpi(WorkItemType type,
        DateTime fromDate,
        DateTime toDate,
        string excludeUserId,
        WorkItemStatus status,
        WorkItemAction action);
 
    List<(string userid, int count, double avg)> GetUserKpi(int projectId,
        int groupId,
        WorkItemType type,
        DateTime fromDate,
        DateTime toDate,
        string excludeUserId,
        WorkItemStatus status,
        WorkItemAction action);
 
    string GetHighThroughputUserId(DateTime fromDate,
        DateTime toDate,
        string excludeUserId,
        WorkItemType type,
        WorkItemAction action,
        WorkItemStatus status);
 
    string GetHighThroughputUserId(int projectId,
        int groupId,
        DateTime fromDate,
        DateTime toDate,
        string excludeUserId,
        WorkItemType type,
        WorkItemAction action,
        WorkItemStatus status);
 
    string GetHighThroughputUserId(string excludeUserId,
        WorkItemType type,
        WorkItemAction action,
        WorkItemStatus? status = null);
 
    string GetHighThroughputUserId(int projectId,
        int groupId,
        string excludeUserId,
        WorkItemType type,
        WorkItemAction action,
        WorkItemStatus? status = null);
 
    string GetIdleUserId(WorkItemType type,
       WorkItemAction action,
       DateTime fromDate,
       DateTime toDate,
       string excludeUserId,
       WorkItemStatus? status = null);
 
    string GetIdleUserId(int projectId,
        int groupId,
        WorkItemType type,
        WorkItemAction action,
        DateTime fromDate,
        DateTime toDate,
        string excludeUserId,
        WorkItemStatus? status = null);
 
    string GetIdleUserId(WorkItemType type,
        string excludeUserId,
        WorkItemAction action,
        WorkItemStatus? status = null);
 
    string GetIdleUserId(int projectId,
        int groupId,
        WorkItemType type,
        string excludeUserId,
        WorkItemAction action,
        WorkItemStatus? status = null);
 
    public IWorkItem CreateWorkItem(IProjectUser pu,
        WorkItemType type,
        WorkItemStatus status,
        WorkItemAction action,
        WorkItemMethod method,
        TimeSpan graceperiod,
        int? serviceId,
        int? documentId,
        int? shredId,
        int? defId,
        int? transactionId,
        int? verificationId,
        int? workItemId,
        string info,
        string comment);
 
    IWorkItem CreateWorkItem(int puId,
        WorkItemType type,
        WorkItemStatus status,
        WorkItemAction action,
        WorkItemMethod method,
        TimeSpan graceperiod,
        int? serviceId,
        int? documentId,
        int? shredId,
        int? defId,
        int? transactionId,
        int? verificationId,
        int? workItemId,
        string info,
        string comment);
 
    IWorkItem CreateWorkItem(string userId,
        WorkItemType type,
        WorkItemStatus status,
        WorkItemAction action,
        WorkItemMethod method,
        TimeSpan graceperiod,
        int? serviceId,
        int? documentId,
        int? shredId,
        int? defId,
        int? transactionId,
        int? verificationId,
        int? workItemId,
        string info,
        string comment);
 
    IWorkItem CreateWorkItem(IProjectUser pu,
        IDocument doc,
        string comment = null,
        TimeSpan? graceperiod = null);
 
    IWorkItem CreateWorkItem(IProjectUser pu,
        IDocument doc,
        WorkItemType type,
        int? defId = null,//for dataset or setting
        string comment = null,
        TimeSpan? graceperiod = null);
 
    IWorkItem CreateWorkItem(IProjectUser pu,
        IVerification ver,
        IDocumentParameter par,
        string comment = null,
        TimeSpan? graceperiod = null);
 
    Task SendWorkItemEmailAsync(IWorkItem wi);
    [Obsolete("Rather use SendWorkItemEmailAsync(IWorkItem wi);", false)]
    Task SendWorkItemEmailAsync(IProjectUser pu, IWorkItem wi);
 
    Task<List<IWorkItem>> FinalizeWorkflowAsync(IDocument doc, string userId);
 
    List<ICustomDataSet> GetDataSets();
    ICustomDataSet GetDataSetByName(string dataSetName, bool includeData, bool includeVerifications, int? pageNo, int? pageSize, int? sortFieldDefId, SortDirection? sortDirection, string searchField = null, string searchValue = null);
    ICustomDataSet GetDataSetByName(IParameterDef stpd, string dataSetName, bool includeData, bool includeVerifications, int? pageNo, int? pageSize, int? sortFieldDefId, SortDirection? sortDirection, string searchField = null, string searchValue = null);
    ICustomDataSet GetDataSetByName(int stpdId, string dataSetName, bool includeData, bool includeVerifications, int? pageNo, int? pageSize, int? sortFieldDefId, SortDirection? sortDirection, string searchField = null, string searchValue = null);
    ICustomDataSet GetDataSetByDef(IParameterDef pd, bool includeData, bool includeVerifications, int? pageNo, int? pageSize, int? sortFieldDefId, SortDirection? sortDirection, string searchField = null, string searchValue = null);
    ICustomDataSet GetDataSetByDef(int pdId, bool includeData, bool includeVerifications, int? pageNo, int? pageSize, int? sortFieldDefId, SortDirection? sortDirection, string searchField = null, string searchValue = null);
    ICustomDataSet GetDataSetByDef(IParameterDef stpd, IParameterDef pd, bool includeData, bool includeVerifications, int? pageNo, int? pageSize, int? sortFieldDefId, SortDirection? sortDirection, string searchField = null, string searchValue = null);
    ICustomDataSet GetDataSetByDef(IParameterDef stpd, int pdId, bool includeData, bool includeVerifications, int? pageNo, int? pageSize, int? sortFieldDefId, SortDirection? sortDirection, string searchField = null, string searchValue = null);
    ICustomDataSet GetDataSetByDef(int stpdId, int pdId, bool includeData, bool includeVerifications, int? pageNo, int? pageSize, int? sortFieldDefId, SortDirection? sortDirection, string searchField = null, string searchValue = null);
    ICustomDataSet GetDataSetByDoc(IDocument doc, bool includeData, bool includeVerifications, int? pageNo, int? pageSize, int? sortFieldDefId, SortDirection? sortDirection, string searchField = null, string searchValue = null);
    ICustomDataSet GetDataSetByDoc(int docId, bool includeData, bool includeVerifications, int? pageNo, int? pageSize, int? sortFieldDefId, SortDirection? sortDirection, string searchField = null, string searchValue = null);
    ICustomDataSet GetDataSetByDoc(IDocument doc, IParameterDef def, bool includeData, bool includeVerifications, int? pageNo, int? pageSize, int? sortFieldDefId, SortDirection? sortDirection, string searchField = null, string searchValue = null);
    ICustomDataSet GetDataSetByDoc(IDocument doc, int defId, bool includeData, bool includeVerifications, int? pageNo, int? pageSize, int? sortFieldDefId, SortDirection? sortDirection, string searchField = null, string searchValue = null);
    ICustomDataSet GetDataSetByDoc(int docId, int defId, bool includeData, bool includeVerifications, int? pageNo, int? pageSize, int? sortFieldDefId, SortDirection? sortDirection, string searchField = null, string searchValue = null);
    ICustomDataSet LoadDataSetData(ICustomDataSet datasset);
    List<ICustomDataSetRecord> GetDataSetData(ICustomDataSet datasset, int? pageNo, int? pageSize, int? sortFieldDefId, SortDirection? sortDirection, bool includeVerifications, string searchField = null, string searchValue = null);
    List<ICustomDataSetRecord> GetDataSetRecordsByKey(ICustomDataSet datasset, IDocumentParameter keyPar);
    List<ICustomDataSetRecord> GetDataSetRecordsByKey(ICustomDataSet datasset, int keyParId);
    ICustomDataSetRecord GetDataSetRecordByKey(ICustomDataSet datasset, int keyParId);
    List<ICustomDataSetRecord> GetDataSetRecordsByKey(ICustomDataSet datasset, string keyValue);
    ICustomDataSetRecord GetDataSetRecordByKey(ICustomDataSet datasset, string keyValue);
    List<ICustomDataSetRecord> GetDataSetRecordsByKeys(ICustomDataSet datasset, List<int> keyParIds);
 
    List<ICustomDataSetRecord> GetDataSetRecords(ICustomDataSet datasset, IParameterDef field, string fieldValue, bool isExactMatch);
    List<ICustomDataSetRecord> GetDataSetRecords(ICustomDataSet datasset, int fieldId, string fieldValue, bool isExactMatch);
    ICustomDataSetRecord GetDataSetRecord(ICustomDataSet datasset, IParameterDef field, string fieldValue, bool isExactMatch);
    ICustomDataSetRecord GetDataSetRecord(ICustomDataSet datasset, int fieldId, string fieldValue, bool isExactMatch);
    List<ICustomDataSetValue> GetDataSetFieldValues(ICustomDataSet dataset, IParameterDef field);
    List<ICustomDataSetValue> GetDataSetFieldValues(ICustomDataSet dataset, int fieldId);
 
    ICustomDataSetRecord LookupDataSetRecord(ICustomDataSet dataset, int fieldId, string fieldValue, bool regexMatch, bool isExactMatch);
    ICustomDataSetRecord LookupDataSetRecord(ICustomDataSet dataset, string fieldName, string fieldValue, bool regexMatch, bool isExactMatch);
    List<ICustomDataSetRecord> SearchDataSetRecords(ICustomDataSet datasset, List<(int fieldId, string fieldValue)> search, bool regexMatch, bool isExactMatch);
    List<ICustomDataSetRecord> SearchDataSetRecords(ICustomDataSet datasset, List<(string fieldName, string fieldValue)> search, bool regexMatch, bool isExactMatch);
    ICustomDataSetValue GetDataSetGetBestValue(ICustomDataSet dataset, int fieldId, string value, bool ignoreCase = true);
    ICustomDataSetRecord GetDataSetGetBestRecord(ICustomDataSet dataset, int fieldId, string value, bool ignoreCase = true);
 
    Task<List<ICustomDataSetRecord>> DeleteDataSetRecord(ICustomDataSetRecord record);
    Task<List<ICustomDataSetRecord>> DeleteDataSetRecord(List<ICustomDataSetRecord> records);
    Task<List<ICustomDataSetRecord>> DeleteDataSetRecord(ICustomDataSet dataset, string keyValue);
    Task<List<ICustomDataSetRecord>> DeleteDataSetRecord(ICustomDataSet dataset, int keyId);
    Task<int> SaveDataSetRecord(ICustomDataSet dataset, ICustomDataSetRecord record);
    Task<int> SaveDataSet(ICustomDataSet dataset, bool mergeData);
 
    //we use object instead of Microsoft.Graph.GraphServiceClient since UIPath cannot reference this
    //the rule developer must cast this object 
    object GetMicrosoftGraphClient();
 
    int SaveChanges();
    Task<int> SaveChangesAsync();
}
```

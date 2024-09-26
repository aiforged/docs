# General Methods

The following general methods are available when writing Custom Code for a service.

<table data-header-hidden><thead><tr><th width="252.33333333333331">Method Name</th><th>Description</th><th>Returns</th></tr></thead><tbody><tr><td><strong>GetClass</strong>(int classId)</td><td>Gets a class with the provided ID.</td><td>The class object.</td></tr><tr><td><strong>GetClasses</strong>(IProject project)</td><td>Gets all the classes defined in a project.</td><td>A list of classes.</td></tr><tr><td><strong>GetClasses</strong>(int projectId)</td><td>Gets all the classes defined in a project.</td><td>A list of classes.</td></tr><tr><td><strong>GetDocumentMaster</strong>(IDocument doc)</td><td>Gets the master document for a provided document.</td><td>The master document object.</td></tr><tr><td><strong>FindClassByName</strong>(int projectId, string name, LarcAI.DictionaryLookupMethod? lookup = null, float minConfidence = 0.80F)</td><td>Try to find a class by name.</td><td>The class object.</td></tr><tr><td><strong>GetParentService</strong>()</td><td>Gets the parent service of the current service.</td><td>The parent service parameter definition.</td></tr><tr><td><strong>GetParentService</strong>(int id)</td><td>Gets the parent service of the current service.</td><td>The parent service parameter definition.</td></tr><tr><td><strong>ParseDecimal</strong>(string str, out decimal amount)</td><td>Try to parse a string value to decimal.</td><td>True if successful, otherwise false.</td></tr><tr><td><strong>GetUserAsync</strong>(string userId)</td><td>Gets the current logged in user.</td><td>The application user.</td></tr><tr><td><strong>GetUsersAsync</strong>(IEnumerable userIds)</td><td>Gets all users via user ID.</td><td>A list of application users.</td></tr><tr><td><strong>GetUserAsync</strong>(IProjectUser pu)</td><td>Gets a user linked to a project.</td><td>The application user.</td></tr><tr><td><strong>GetUsersAsync</strong>(IEnumerable pudata)</td><td>Gets a user linked to a project.</td><td>The application user.</td></tr><tr><td><strong>GetUsers</strong>(LinkType? type = null, List roles = null, string permissions = null</td><td>Gets a list of all users with roles and permissions.</td><td>A list of project users.</td></tr><tr><td><strong>GetUsers</strong>(int serviceId, LinkType? type = null, List roles = null, string permissions = null)</td><td>Gets a list of all users with roles and permissions.</td><td>A list of project users.</td></tr><tr><td><strong>GetUsers</strong>(int projectId, int? groupId, LinkType? type = null, List roles = null, string permissions = null)</td><td>Gets a list of all users with roles and permissions.</td><td>A list of project users.</td></tr><tr><td><strong>GetUsers</strong>(int projectId, int serviceId, int? groupId, LinkType? type = null, List roles = null, string permissions = null)</td><td>Gets a list of all users with roles and permissions.</td><td>A list of project users.</td></tr><tr><td><strong>GetMicrosoftGraphClient</strong>()</td><td>Gets the MS Graph client.</td><td>The MS Graph client object.</td></tr><tr><td><strong>CallWebHookAsync</strong>(IDocument srcdoc, IDocument masterdoc = null, IDocumentParameter par = null, IParameterDef def = null, IVerification verification = null, IWorkItem wi = null, int? webHookServiceId = null)</td><td>Calls a webhook service to post data to an external system.</td><td>The webhook call result.</td></tr><tr><td><strong>SaveChanges</strong>()</td><td>Save any changes made to Entity Framework in the Custom Code.</td><td>The SaveChanges response.</td></tr><tr><td><strong>SaveChangesAsync</strong>()</td><td>Save any changes made to Entity Framework in the Custom Code.</td><td>The SaveChanges response</td></tr></tbody></table>
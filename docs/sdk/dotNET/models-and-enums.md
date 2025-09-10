# 🧩 AIForged SDK — Models and Enums

## Overview

This page lists all AIForged SDK models and enums in a consistent tabular format for quick reference and implementation.

## Models

### AccountBalanceItem
| Property | Type | Notes |
| --- | --- | --- |
| Id | Guid |  |
| Seq | int |  |
| ServiceId | int? | nullable |
| ServiceTypeId | int? | nullable |
| ProjectId | int? | nullable |
| GroupId | int? | nullable |
| BundleId | int? | nullable |
| IsTransfer | bool? | nullable |
| UserId | string |  |
| DT | DateTime? | nullable |
| Info | string |  |
| DRCount | decimal? | nullable |
| CRCount | decimal? | nullable |
| DRQty | decimal? | nullable |
| CRQty | decimal? | nullable |
| CRQry | decimal? | nullable |
| DR | decimal? | nullable |
| CR | decimal? | nullable |
| Balance | decimal? | nullable |
| Project | string |  |
| Service | string |  |
| ServiceType | string |  |
| Bundle | string |  |
| Name | string |  |
| UserName | string |  |
| TxIds | ObservableCollection<int> |  |

### AuditViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| UserId | string |  |
| Entity | AuditEntity |  |
| Access | AuditAccessType |  |
| KeyId | int |  |
| KeyValue | string | StringLength(256) |
| DT | DateTime |  |
| FromStatus | int? | nullable |
| ToStatus | int? | nullable |
| Field | string | StringLength(256) |
| Value | string | StringLength(256) |
| Address | string | StringLength(256) |
| Data | string | StringLength(450) |
| Comment | string | StringLength(450) |
| Project | ProjectViewModel |  |
| Service | ParameterDefViewModel |  |
| Document | DocumentViewModel |  |
| Def | ParameterDefViewModel |  |
| Parameter | DocumentParameterViewModel |  |
| Verification | VerificationViewModel |  |
| WorkItem | WorkItemViewModel |  |
| Transaction | TransactionsAuditViewModel |  |
| Event | ServiceEventViewModel |  |
| Group | GroupViewModel |  |
| UserName | string |  |
| UserFullName | string |  |

### BackgoundWorkItem
| Property | Type | Notes |
| --- | --- | --- |
| ConnId | string |  |
| UserId | string |  |
| Id | Guid |  |
| Info | string |  |
| Exception | string |  |
| Progress | float |  |
| Start | DateTime? | nullable |
| End | DateTime? | nullable |
| LastMsgDT | DateTime |  |

### BundlesViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int | Range(0, 2147483647) |
| Type | BundleType |  |
| Name | string | Required; StringLength(256, min 2) |
| Description | string | StringLength(450) |
| Count | int | Range(1, int.MaxValue) |
| Price | double |  |
| Discount | float |  |
| DTC | DateTime |  |
| DTM | DateTime |  |
| IsActive | bool |  |
| ExpiryDate | DateTime? | nullable |
| ProductCode | string | StringLength(100) |

### CategoryTrainingOptions
| Property | Type | Notes |
| --- | --- | --- |
| TrainingCustomTableNames | ObservableCollection<string> |  |
| ProcessTableNames | ObservableCollection<string> |  |
| UseInComposedModel | bool |  |
| ForceToPDF | bool |  |
| TrainingType | CategoryTrainingType? | nullable |
| ModelVersion | string |  |
| TableColumnRegexMap | Dictionary<string, Dictionary<string, string>> |  |

### ClassesViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| UserId | string |  |
| ProjectId | int |  |
| Name | string | StringLength(256) |
| Description | string | StringLength(450) |
| Comment | string | StringLength(450) |
| DTC | DateTime |  |
| DTM | DateTime |  |
| Type | ClassType? | nullable |
| Status | CategoryStatus? | nullable |
| Related | int? | nullable |
| Reference | string | StringLength(450) |
| Training | string | StringLength(450) |

### CloneChecks
| Property | Type | Notes |
| --- | --- | --- |
| ProjectExist | bool |  |
| DoNotCreatePD | bool |  |
| ReProcessDocumentDataOnly | bool |  |
| ReProcessDataSetDocument | bool |  |
| ReProcessInboxDocument | bool |  |
| ReProcessOutboxDocument | bool |  |
| ReProcessDefinitionDocument | bool |  |
| ReProcessTrainingDocument | bool |  |
| ReProcessLabellingDocument | bool |  |
| ParameterExists | bool |  |
| VerificationExists | bool |  |
| TransactionExists | bool |  |
| AuditExists | bool |  |
| WorkItemsExists | bool |  |
| LogsExists | bool |  |
| PaymentExists | bool |  |

### CloneOptions
| Property | Type | Notes |
| --- | --- | --- |
| Classes | bool |  |
| ProjectUsers | bool |  |
| Service | bool |  |
| ServiceRecursive | bool |  |
| ServiceDefSettings | bool |  |
| ParamDefSettings | bool |  |
| ParamDefCategories | ObservableCollection<ParameterDefinitionCategory?> | nullable items |
| Ratings | bool |  |
| Documents | bool |  |
| DocumentFromId | int? | nullable |
| DocumentToId | int? | nullable |
| DocumentDescending | bool? | nullable |
| DocumentIds | ObservableCollection<int> |  |
| DocumentCategoriesSrc | ObservableCollection<int?> | nullable items |
| DocumentCategoriesDst | ObservableCollection<int?> | nullable items |
| SkipDocs | Dictionary<UsageType, ObservableCollection<string>> |  |
| SkipStatus | Dictionary<DocumentStatus, ObservableCollection<string>> |  |
| DocumentMaxDegreeOfParallelism | int |  |
| DocumentsDeletedState | bool |  |
| DocumentsDataSet | bool |  |
| DocumentsInbox | bool |  |
| DocumentsOutBox | bool |  |
| DocumentsDefinitions | bool |  |
| DocumentsTraining | bool |  |
| DocumentsLabelling | bool |  |
| DocumentData | bool |  |
| Parameters | bool |  |
| Verifications | bool |  |
| RedoVerifications | bool |  |
| Work | bool |  |
| Audit | bool |  |
| Logs | bool |  |
| Transactions | bool |  |
| Payments | bool |  |
| ProviderProjects | bool |  |
| ProviderModels | bool |  |
| Checks | CloneChecks |  |

### ContactViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| UserId | string |  |
| Status | ContactStatus |  |
| Type | NotificationType |  |
| Address | string | StringLength(256) |
| Name | string | StringLength(256) |
| Comment | string | StringLength(450) |
| DTC | DateTime |  |
| DTM | DateTime |  |

### CustomDataSet
| Property | Type | Notes |
| --- | --- | --- |
| ProjectId | int |  |
| ServiceId | int |  |
| StpdId | int | Obsolete: Use ServiceId |
| DocId | int |  |
| KeyDefId | int |  |
| KeyDef | ParameterDefViewModel |  |
| Document | DocumentViewModel |  |
| Definitions | ObservableCollection<ParameterDefViewModel> |  |
| Data | ObservableCollection<CustomDataSetRecord> |  |
| Status | int |  |
| Info | string |  |
| IncludeData | bool |  |
| PageNo | int? | nullable |
| PageSize | int? | nullable |
| SortFieldDefId | int? | nullable |
| SortDirection | SortDirection? | nullable |
| IncludeVerifications | bool |  |
| SearchField | string |  |
| SearchValue | string |  |

### CustomDataSetRecord
| Property | Type | Notes |
| --- | --- | --- |
| KeyId | int |  |
| KeyDefId | int |  |
| KeyValue | string |  |
| Availability | Availability? | nullable |
| Values | ObservableCollection<CustomDataSetValue> |  |

### CustomDataSetValue
| Property | Type | Notes |
| --- | --- | --- |
| DefId | int |  |
| Id | int |  |
| ParentId | int? | nullable |
| Index | int? | nullable |
| Value | string |  |
| Availability | Availability? | nullable |
| VerificationId | int? | nullable |
| VerValue | string |  |
| DT | DateTime? | nullable |
| Confidence | float? | nullable |
| Type | VerificationType? | nullable |
| Status | VerificationStatus? | nullable |
| Provider | string |  |
| Result | string |  |

### DataTypeViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | ValueType |  |
| Name | string | Required; StringLength(256, min 1) |
| Description | string | StringLength(256) |
| Category | DataTypeCategory? | nullable |
| ValueTypeName | string |  |
| DefaultValue | string | StringLength(450) |
| Data | string |  |

### DocParamSummary
| Property | Type | Notes |
| --- | --- | --- |
| ProjectId | int? | nullable |
| ServiceType | int |  |
| ServiceId | int |  |
| Usage | UsageType |  |
| Status | DocumentStatus |  |
| Name | string |  |
| ClassId | int? | nullable |
| ClassName | string |  |
| ServiceName | string |  |
| FileType | string |  |
| DT | DateTime? | nullable |
| Count | int |  |
| LabelledCount | int? | nullable |
| PDId | int |  |
| ParamDefName | string |  |
| Category | ParameterDefinitionCategory? | nullable |
| Grouping | GroupingType? | nullable |
| ValueType | ValueType |  |
| Value | string |  |
| Index | int? | nullable |

### DocumentDataViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| DocumentId | int |  |
| BlobId | int? | nullable |
| Type | DocumentDataType? | nullable |
| Data | byte[] |  |
| Preview | byte[] |  |
| Text | string |  |
| Info | string |  |
| ContentType | string | StringLength(256) |
| ResultId | string | StringLength(256) |
| Index | int? | nullable |
| Width | double? | nullable |
| Height | double? | nullable |
| Resolution | double? | nullable |
| Availability | Availability? | nullable |

### DocumentExtraction
| Property | Type | Notes |
| --- | --- | --- |
| DocumentId | int |  |
| Id | int |  |
| ParentId | int? | nullable |
| Name | string |  |
| Label | string |  |
| Category | ParameterDefinitionCategory? | nullable |
| Grouping | GroupingType? | nullable |
| ValueType | ValueType |  |
| Index | int? | nullable |
| ParamId | int |  |
| ParentParamId | int? | nullable |
| ParamIndex | int? | nullable |
| ParamValue | string |  |
| VerificationId | int? | nullable |
| UserId | string |  |
| UserName | string |  |
| Value | string |  |
| DT | DateTime? | nullable |
| Confidence | float? | nullable |
| Type | VerificationType? | nullable |
| Status | VerificationStatus? | nullable |
| Charge | decimal? | nullable |
| Provider | string |  |
| Result | string |  |

### DocumentParameterViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| DocumentId | int |  |
| ParamDefId | int? | nullable |
| ParentId | int? | nullable |
| SourceId | int? | nullable |
| Value | string |  |
| Data | byte[] |  |
| Index | int? | nullable |
| ColIndex | int? | nullable |
| ColSpan | int? | nullable |
| RowIndex | int? | nullable |
| RowSpan | int? | nullable |
| Availability | Availability? | nullable |
| ParamDef | ParameterDefViewModel |  |
| Children | ObservableCollection<DocumentParameterViewModel> |  |
| Verifications | ObservableCollection<VerificationViewModel> |  |

### DocumentViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| UserId | string |  |
| ProjectId | int |  |
| ServiceId | int |  |
| Status | DocumentStatus |  |
| Usage | UsageType |  |
| ClassId | int? | nullable |
| ContentType | string | StringLength(256) |
| Filename | string | StringLength(450) |
| FileType | string | StringLength(256) |
| DTC | DateTime |  |
| DTM | DateTime |  |
| DocumentId | Guid? | nullable |
| ExternalId | string | StringLength(450) |
| MasterId | int? | nullable |
| Result | string |  |
| ResultId | string |  |
| ResultIndex | int? | nullable |
| Comment | string |  |
| Availability | Availability? | nullable |
| ResultParameters | ObservableCollection<DocumentParameterViewModel> |  |
| Data | ObservableCollection<DocumentDataViewModel> |  |
| Documents | ObservableCollection<DocumentViewModel> |  |
| Info | ObservableCollection<string> |  |
| LatestChildStatus | DocumentStatus? | nullable |
| OriginId | int? | nullable |
| CanVerify | bool |  |
| CanClassify | bool |  |
| CanTrain | bool |  |
| Trained | bool |  |
| LinkedDocsCount | int? | nullable |
| TrainingFieldCount | int? | nullable |
| TrainedParametersCount | int? | nullable |

### DocumentsSummary
| Property | Type | Notes |
| --- | --- | --- |
| ProjectId | int? | nullable |
| ServiceType | int |  |
| ServiceId | int |  |
| Usage | UsageType |  |
| Status | DocumentStatus |  |
| Name | string |  |
| ClassId | int? | nullable |
| ClassName | string |  |
| ServiceName | string |  |
| FileType | string |  |
| DT | DateTime? | nullable |
| Count | int |  |
| LabelledCount | int? | nullable |

### EnumDataViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| Type | EnumType |  |
| TypeName | string | Required; StringLength(256, min 1) |
| Name | string | Required; StringLength(256, min 1) |
| Value | int |  |
| Description | string | StringLength(450) |
| Info | string | StringLength(450) |
| Icon | string | StringLength(450) |
| Color | string | StringLength(256) |

### FileParameter
| Property | Type | Notes |
| --- | --- | --- |
| Data | Stream |  |
| FileName | string |  |
| ContentType | string |  |

### FileResponse
| Property | Type | Notes |
| --- | --- | --- |
| StatusCode | int |  |
| Headers | IReadOnlyDictionary<string, IEnumerable<string>> |  |
| Stream | Stream | Disposable |
| IsPartial | bool | True when StatusCode == 206 |

### GroupRoleUserViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| UserId | string | Required |
| GroupRoleId | int |  |
| Status | GroupRoleUserStatus |  |
| DTC | DateTime |  |
| DTM | DateTime |  |
| Start | DateTime? | nullable |
| End | DateTime? | nullable |
| UserName | string |  |
| FullName | string |  |
| DisplayName | string |  |
| UserEmail | string |  |

### GroupRoleViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| GroupId | int |  |
| ProjectId | int? | nullable |
| Type | GroupRoleType | Flags |
| Status | GroupRoleStatus |  |
| Name | string | StringLength(256) |
| DTC | DateTime |  |
| DTM | DateTime |  |
| Start | DateTime? | nullable |
| End | DateTime? | nullable |
| Group | GroupViewModel |  |
| Project | ProjectViewModel |  |
| Users | ObservableCollection<GroupRoleUserViewModel> |  |
| Related | ObservableCollection<GroupRoleViewModel> |  |
| DisplayName | string |  |

### GroupViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| Type | GroupType |  |
| Status | GroupStatus |  |
| UserId | string | Required; StringLength(450, min 1) |
| Name | string | StringLength(256) |
| DTC | DateTime |  |
| DTM | DateTime |  |
| Domain | string | StringLength(1024) |
| TenantId | int? | nullable |
| Info | string |  |
| Address | string |  |
| VATNo | string |  |
| TenantName | string |  |
| UserName | string |  |
| UserFullName | string |  |
| UserDisplayName | string |  |
| IsOwner | bool |  |
| IsAdmin | bool |  |
| IsPartner | bool |  |
| Rights | string |  |
| RoleCount | int |  |
| UserCount | int |  |
| ProjectCount | int |  |
| GroupCount | int |  |
| ConsolidateCount | int |  |
| Children | ObservableCollection<GroupViewModel> |  |
| Projects | ObservableCollection<ProjectViewModel> |  |
| Roles | ObservableCollection<GroupRoleViewModel> |  |

### LogEvent
| Property | Type | Notes |
| --- | --- | --- |
| Timestamp | DateTime |  |
| Level | string |  |
| Message | string |  |
| Exception | string |  |
| Context | string |  |

### LogViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| Type | LogType? | nullable |
| ProjectId | int? | nullable |
| ServiceId | int? | nullable |
| DocumentId | int? | nullable |
| DefId | int? | nullable |
| ParameterId | int? | nullable |
| VerificationId | int? | nullable |
| WorkItemId | int? | nullable |
| TransactionId | int? | nullable |
| EventId | int? | nullable |
| UserId | string |  |
| DTC | DateTime |  |
| Comment | string |  |
| StackTrace | string |  |
| ErrorMessage | string |  |
| Page | string | StringLength(256) |
| Project | ProjectViewModel |  |
| Service | ParameterDefViewModel |  |
| Document | DocumentViewModel |  |
| Def | ParameterDefViewModel |  |
| Parameter | DocumentParameterViewModel |  |
| Verification | VerificationViewModel |  |
| WorkItem | WorkItemViewModel |  |
| Transaction | TransactionsAuditViewModel |  |
| Event | ServiceEventViewModel |  |

### NotificationAttachmentViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| NotificationId | int |  |
| ContentType | string | StringLength(256) |
| ContentId | string | StringLength(450) |
| Data | byte[] |  |

### NotificationOption
| Property | Type | Notes |
| --- | --- | --- |
| Name | string |  |
| Settings | ObservableCollection<NotificationSetting> |  |

### NotificationPreferences
| Property | Type | Notes |
| --- | --- | --- |
| Preferences | Dictionary<NotificationArea, NotificationOption> |  |
| Map | Dictionary<NotificationArea, ObservableCollection<NotificationEvent>> |  |

### NotificationSetting
| Property | Type | Notes |
| --- | --- | --- |
| Name | string |  |
| Event | NotificationEvent |  |
| Type | NotificationType |  |
| Enabled | bool |  |
| Contacts | Dictionary<string, string> |  |
| ContactIds | ObservableCollection<int> |  |

### NotificationViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| UserId | string | Required |
| ProjectId | int? | nullable |
| ClassId | int? | nullable |
| ServiceId | int? | nullable |
| DocumentId | int? | nullable |
| WorkItemId | int? | nullable |
| ShredId | int? | nullable |
| VerificationId | int? | nullable |
| ContactId | int? | nullable |
| Type | NotificationType |  |
| Status | NotificationStatus |  |
| Area | NotificationArea |  |
| Event | NotificationEvent |  |
| Level | NotificationLevel |  |
| To | string | StringLength(450) |
| Address | string | StringLength(450) |
| Subject | string | StringLength(450) |
| ContentType | string | StringLength(256) |
| Body | string |  |
| Error | string | StringLength(2000) |
| DTC | DateTime |  |
| DTM | DateTime |  |
| Sent | DateTime? | nullable |
| Delivered | DateTime? | nullable |
| ReadDate | DateTime? | nullable |
| Contact | ContactViewModel |  |
| Attachments | ObservableCollection<NotificationAttachmentViewModel> |  |

### ParameterDefSettingViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| ParameterDefId | int |  |
| Type | SettingType |  |
| Status | SettingStatus |  |
| DTC | DateTime |  |
| DTM | DateTime |  |
| Comment | string |  |
| Info | string |  |
| Data | string |  |
| MinValue | string |  |
| MaxValue | string |  |
| Confidence | float? | nullable |
| MinConfidence | float? | nullable |
| MaxConfidence | float? | nullable |
| IsCaseSensative | bool |  |
| Invert | bool |  |
| OneLine | bool |  |
| OneWord | bool |  |
| IsHandwriting | bool |  |
| Orientation | Orientation? | nullable |
| Marking | MarkingType? | nullable |
| Cells | int? | nullable |
| ClearBefore | OptionStatusFlags | Flags |
| ClearAfter | OptionStatusFlags | Flags |
| CleanupValuesBefore | bool |  |
| CleanupValuesAfter | bool |  |
| ValidateValuesBefore | bool |  |
| ValidateValuesAfter | bool |  |
| AbortOnValidationError | bool |  |
| IsReplacementCaseSensative | bool |  |
| CompileResults | string |  |
| MaxRetry | int |  |
| Timeout | TimeSpan? | nullable |
| UserId | string |  |

### ParameterDefViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| ProjectId | int |  |
| ServiceTypeId | int |  |
| ServiceId | int? | nullable |
| ClassId | int? | nullable |
| ParentId | int? | nullable |
| Name | string |  |
| Label | string |  |
| Tags | string |  |
| Description | string |  |
| DTC | DateTime? | nullable |
| DTM | DateTime? | nullable |
| Status | ParameterDefinitionStatus |  |
| Category | ParameterDefinitionCategory? | nullable |
| Grouping | GroupingType? | nullable |
| ValueType | ValueType |  |
| ValueTypeName | string |  |
| DefaultValue | string |  |
| Required | RequiredOption | Flags |
| Index | int? | nullable |
| Info | string |  |
| Reference | string |  |
| Rating | float? | nullable |
| Availability | Availability? | nullable |
| Children | ObservableCollection<ParameterDefViewModel> |  |
| Settings | ObservableCollection<ParameterDefSettingViewModel> |  |
| TotalCharge | decimal? | nullable |
| UserCount | int |  |
| ParameterCount | int |  |
| DocumentCount | int |  |
| Validation | string |  |
| IsEnabled | bool |  |

### PaymentViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| UserId | string |  |
| ProjectId | int |  |
| BundleId | int? | nullable |
| Amount | decimal |  |
| Status | PaymentStatus |  |
| Reference | string | StringLength(256) |
| Description | string | StringLength(256) |
| ResultCode | string | StringLength(100) |
| Result | string | StringLength(450) |
| Reason | string | StringLength(450) |
| Error | string | StringLength(2000) |
| Data | string | StringLength(4000) |
| DTC | DateTime |  |
| DTM | DateTime |  |
| ProductCode | string | StringLength(100) |
| Processor | string | StringLength(100) |
| Project | ProjectViewModel |  |
| Bundle | BundlesViewModel |  |

### PermissionViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Name | string |  |
| Value | string |  |
| GroupName | string |  |
| Description | string |  |

### PortalResponse
| Property | Type | Notes |
| --- | --- | --- |
| StatusCode | int |  |
| Headers | IReadOnlyDictionary<string, IEnumerable<string>> |  |

### PortalResponse<TResult>
| Property | Type | Notes |
| --- | --- | --- |
| StatusCode | int |  |
| Headers | IReadOnlyDictionary<string, IEnumerable<string>> |  |
| Result | TResult | Generic payload |

### ProblemDetails
| Property | Type | Notes |
| --- | --- | --- |
| Type | string |  |
| Title | string |  |
| Status | int? | nullable |
| Detail | string |  |
| Instance | string |  |
| Extensions | Dictionary<string, object> |  |
| AdditionalProperties | IDictionary<string, object> | JsonExtensionData |

### ProjectViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| UserId | string |  |
| Status | ProjectStatus |  |
| Name | string | StringLength(256) |
| Description | string | StringLength(450) |
| Comment | string | StringLength(450) |
| Dtc | DateTime |  |
| Dtm | DateTime |  |
| Balance | AccountBalanceItem |  |
| TotalDocsCount | int? | nullable |
| Services | ObservableCollection<ParameterDefViewModel> |  |

### RatingViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| ParamDefId | int |  |
| ParameterId | int? | nullable |
| VerificationId | int? | nullable |
| Type | RatingType |  |
| Status | RatingStatus? | nullable |
| UserId | string |  |
| DT | DateTime |  |
| Value | double |  |
| Comment | string | StringLength(450) |
| UserName | string |  |

### RoleViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | string |  |
| Name | string | Required; StringLength(200, min 2) |
| Description | string |  |
| UsersCount | int |  |
| Permissions | ObservableCollection<PermissionViewModel> |  |

### ServiceChargeViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| ServiceId | int |  |
| Status | ChargeStatus |  |
| DTC | DateTime |  |
| DTM | DateTime |  |
| FromDate | DateTime |  |
| ToDate | DateTime? | nullable |
| Cost | decimal? | nullable |
| Charge | decimal? | nullable |
| Comment | string | StringLength(256) |
| UserId | string |  |

### ServiceEventViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| UserId | string |  |
| ProjectId | int |  |
| ServiceId | int? | nullable |
| EventType | ServiceEventType |  |
| Status | ServiceEventStatus |  |
| Description | string |  |
| DTC | DateTime |  |
| DTM | DateTime |  |
| Start | DateTime? | nullable |
| End | DateTime? | nullable |
| SourceType | ReferenceType? | nullable |
| SourceId | string |  |
| ResultType | ReferenceType? | nullable |
| ResultId | string |  |
| ResultBody | string |  |
| ResultCount | int? | nullable |
| ResultStatusId | int? | nullable |
| ResultClassId | int? | nullable |
| MasterId | int? | nullable |
| Master | ServiceEventViewModel |  |
| Related | ObservableCollection<ServiceEventViewModel> |  |

### ServiceTypeChargeViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| ServiceTypeId | int |  |
| Status | ChargeStatus |  |
| FromDate | DateTime |  |
| ToDate | DateTime? | nullable |
| Cost | decimal? | nullable |
| Charge | decimal? | nullable |
| Comment | string |  |
| UserId | string |  |

### ServiceTypeViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| Name | string | StringLength(256) |
| Description | string | StringLength(450) |
| Group | string | StringLength(256) |
| DTC | DateTime |  |
| DTM | DateTime |  |
| Status | ServiceTypeStatus |  |
| Options | ServiceOptions | Flags |
| Availability | Availability |  |
| Logo | string | StringLength(256) |
| Icon | string | StringLength(256) |
| Info | string | StringLength(450) |
| Help | string | StringLength(450) |
| Sample | string | StringLength(450) |
| Engine | string | StringLength(450) |
| Cost | decimal? | nullable |
| Charge | decimal? | nullable |
| ValueType | ValueType? | nullable |
| BillingDimension | string |  |
| BillingQuantityIncluded | int? | nullable |
| Charges | ObservableCollection<ServiceTypeChargeViewModel> |  |

### SettingViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| UserId | string |  |
| Name | string | StringLength(256) |
| Key | string | StringLength(256) |
| Description | string | StringLength(450) |
| Value | string |  |
| Status | SettingStatus |  |
| DTC | DateTime |  |
| DTM | DateTime |  |

### SwaggerException
| Property | Type | Notes |
| --- | --- | --- |
| StatusCode | int |  |
| Response | string |  |
| Headers | IReadOnlyDictionary<string, IEnumerable<string>> |  |

### SwaggerException<TResult>
| Property | Type | Notes |
| --- | --- | --- |
| StatusCode | int |  |
| Response | string |  |
| Headers | IReadOnlyDictionary<string, IEnumerable<string>> |  |
| Result | TResult | Generic payload |

### TransactionsAuditViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| ProjectId | int |  |
| ServiceId | int? | nullable |
| DocumentId | int? | nullable |
| BundleId | int? | nullable |
| PaymentId | int? | nullable |
| ChargeId | int? | nullable |
| RelatedTxnId | int? | nullable |
| Status | TransactionStatus |  |
| UserId | string | StringLength(450) |
| RunId | string | StringLength(256) |
| DTC | DateTime |  |
| DTM | DateTime |  |
| Qty | int |  |
| Price | double |  |
| Cost | decimal |  |
| Charge | decimal? | nullable |
| IsCredit | bool |  |
| CreditBalance | decimal? | nullable |
| Comment | string | StringLength(128) |
| ExternalId | string | StringLength(64) |
| ProjectName | string |  |
| IsBillingProject | bool |  |
| ServiceName | string |  |
| BundleName | string |  |
| UserName | string |  |
| AuditUserName | string |  |

### UserActivateViewModel
| Property | Type | Notes |
| --- | --- | --- |
| UserName | string | Required; StringLength(200, min 2) |
| Token | string | Required; StringLength(2147483647, min 2) |

### UserEditViewModel (inherits UserViewModel)
| Property | Type | Notes |
| --- | --- | --- |
| CurrentPassword | string |  |
| NewPassword | string | StringLength(min 8) |
| ConfirmPassword | string | StringLength(min 8) |
| CaptchaToken | string |  |

### UserInviteViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Email | string | Required; StringLength(256, min 5) |
| Message | string |  |
| RoleId | int |  |

### UserLoginInfo
| Property | Type | Notes |
| --- | --- | --- |
| LoginProvider | string |  |
| ProviderKey | string |  |
| ProviderDisplayName | string |  |

### UserPasswordResetViewModel
| Property | Type | Notes |
| --- | --- | --- |
| UserName | string | Required; StringLength(200, min 2) |
| Token | string | Required; StringLength(2147483647, min 2) |
| Password | string | Required; StringLength(2147483647, min 8) |
| ConfirmPassword | string | Required; StringLength(2147483647, min 8) |

### UserViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | string |  |
| UserName | string | Required; StringLength(200, min 2) |
| FullName | string |  |
| Email | string | Required(AllowEmptyStrings = true); StringLength(200) |
| JobTitle | string |  |
| PhoneNumber | string |  |
| Configuration | string |  |
| IsEnabled | bool |  |
| IsLockedOut | bool |  |
| FriendlyName | string |  |
| CreatedBy | string |  |
| UpdatedBy | string |  |
| CreatedDate | DateTime |  |
| UpdatedDate | DateTime |  |
| Roles | ObservableCollection<string> |  |
| ProjectCount | int |  |
| GroupCount | int |  |
| LinkedProjectCount | int |  |
| LinkedGroupCount | int |  |

### VerificationSummary
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| ParameterId | int |  |
| UserId | string |  |
| Value | string |  |
| DT | DateTime |  |
| Confidence | float? | nullable |
| SymbolsConfidence | string |  |
| Type | VerificationType |  |
| Status | VerificationStatus | Flags |
| Result | string |  |
| Box | string |  |
| Info | string |  |
| Data | byte[] |  |
| UserName | string |  |
| ServiceId | int? | nullable |
| ServiceDocId | int? | nullable |
| Provider | string |  |
| SettingId | int? | nullable |
| WorkItem | int? | nullable |
| TransactionId | int? | nullable |
| ReferenceDocId | int? | nullable |
| ReferenceParamId | int? | nullable |
| ReferenceDefId | int? | nullable |
| Charge | decimal |  |
| ParamDefId | int |  |
| ParamDefName | string |  |
| ProjectId | int |  |
| ProjectName | string |  |
| DocId | int |  |
| DocFileName | string |  |
| DocContentType | string |  |
| DocUsage | UsageType? | nullable |
| DocStatus | DocumentStatus? | nullable |
| ClassId | int? | nullable |
| ClassName | string |  |
| Year | int |  |
| Month | int |  |
| Day | int |  |
| DayOfWeek | DayOfWeek |  |
| Count | int |  |
| Average | float? | nullable |
| Min | float? | nullable |
| Max | float? | nullable |
| ParentParameterId | int? | nullable |

### VerificationViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| ParameterId | int |  |
| UserId | string |  |
| Value | string |  |
| DT | DateTime |  |
| Confidence | float? | nullable |
| SymbolsConfidence | string |  |
| Type | VerificationType |  |
| Status | VerificationStatus | Flags |
| Result | string |  |
| Box | string |  |
| Info | string |  |
| Data | byte[] |  |
| UserName | string |  |
| ServiceId | int? | nullable |
| ServiceDocId | int? | nullable |
| Provider | string |  |
| SettingId | int? | nullable |
| WorkItem | int? | nullable |
| TransactionId | int? | nullable |
| ReferenceDocId | int? | nullable |
| ReferenceParamId | int? | nullable |
| ReferenceDefId | int? | nullable |
| Charge | decimal |  |

### WorkFlowSummary
| Property | Type | Notes |
| --- | --- | --- |
| ProjectId | int? | nullable |
| UserId | string |  |
| UserName | string |  |
| ServiceId | int? | nullable |
| DefId | int? | nullable |
| DocId | int? | nullable |
| Filename | string |  |
| DocStatus | DocumentStatus? | nullable |
| DocUsage | UsageType? | nullable |
| DocClassId | int? | nullable |
| DocClassName | string |  |
| Action | WorkItemAction |  |
| Type | WorkItemType |  |
| Status | WorkItemStatus |  |
| Method | WorkItemMethod? | nullable |
| DT | DateTime? | nullable |
| Duration | TimeSpan? | nullable |
| ActiveDuration | TimeSpan? | nullable |
| Count | int |  |

### WorkItemViewModel
| Property | Type | Notes |
| --- | --- | --- |
| Id | int |  |
| ProjectId | int? | nullable |
| UserId | string |  |
| ServiceId | int? | nullable |
| DocumentId | int? | nullable |
| DefId | int? | nullable |
| ShredId | int? | nullable |
| VerificationId | int? | nullable |
| TransactionId | int? | nullable |
| WorkItemId | int? | nullable |
| Type | WorkItemType |  |
| Action | WorkItemAction |  |
| Status | WorkItemStatus |  |
| Method | WorkItemMethod? | nullable |
| Reason | WorkItemReason |  |
| ReasonLookup | int? | nullable |
| ReasonRecord | int? | nullable |
| ReasonCode | string |  |
| ReasonDescription | string |  |
| ReasonComment | string |  |
| Info | string |  |
| Comment | string |  |
| GroupId | int? | nullable |
| DTC | DateTime |  |
| DTM | DateTime |  |
| DueDate | DateTime |  |
| Open | DateTime? | nullable |
| Closed | DateTime? | nullable |
| Duration | TimeSpan? | nullable |
| Project | ProjectViewModel |  |
| Service | ParameterDefViewModel |  |
| Document | DocumentViewModel |  |
| Shred | DocumentParameterViewModel |  |
| Def | ParameterDefViewModel |  |
| Verification | VerificationViewModel |  |
| Parent | WorkItemViewModel |  |
| User | UserViewModel |  |
| DocCategory | string |  |

### Wizard
| Property | Type | Notes |
| --- | --- | --- |
| Index | int |  |
| Name | string |  |
| Description | string |  |
| Type | WizardType |  |
| State | WizardState |  |
| Info | string |  |
| Error | string |  |
| Warning | string |  |
| Information | string |  |
| STPD | ParameterDefViewModel |  |
| DependencyPD | ParameterDefViewModel |  |
| PD | ParameterDefViewModel |  |
| RemovePDId | int? | nullable |
| DocsCount | int |  |

## Enums

### AuditAccessType
| Value | Numeric Value |
| --- | --- |
| Create | 0 |
| Read | 1 |
| Update | 2 |
| Delete | 3 |
| Move | 4 |
| Copy | 5 |
| Clone | 6 |
| Elevate | 7 |
| Work | 8 |
| Init | 9 |
| Train | 10 |
| Process | 11 |
| UnDelete | 12 |
| Define | 13 |
| Verify | 14 |
| Link | 15 |
| Expire | 16 |
| Compile | 17 |
| Approve | 18 |
| Archive | 19 |

### AuditEntity
| Value | Numeric Value |
| --- | --- |
| Project | 0 |
| Service | 1 |
| Document | 2 |
| Work | 3 |
| Contact | 4 |
| Notification | 5 |
| Payment | 6 |
| Verification | 7 |
| DataSet | 8 |
| Reports | 9 |
| Group | 10 |
| ParamDef | 11 |
| Parameter | 12 |
| Audit | 13 |
| Account | 14 |
| Role | 15 |
| Bundle | 16 |
| Classes | 17 |
| UserSettings | 18 |
| Credit | 19 |
| ProjectUser | 20 |
| GroupRole | 21 |
| GroupRoleUser | 22 |

### Availability
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Private | 1 |
| Public | 2 |
| Marketplace | 3 |
| Inherit | 4 |
| Internal | 5 |
| Training | 6 |
| DataSet | 7 |
| Hidden | 9 |
| Readonly | 10 |
| Deleted | 99 |

### BundleType
| Value | Numeric Value |
| --- | --- |
| PrePaid | 1 |
| PostPaid | 2 |
| Gift | 3 |
| Signon | 4 |
| Marketplace | 5 |
| Transfer | 6 |
| Expired | 7 |
| Custom | 8 |

### CategoryStatus
| Value | Numeric Value |
| --- | --- |
| Enabled | 0 |
| Disabled | 1 |
| Deleted | 99 |

### CategoryTrainingType
| Value | Numeric Value |
| --- | --- |
| Layout | 1 |
| Neural | 2 |

### ChargeStatus
| Value | Numeric Value |
| --- | --- |
| Active | 0 |
| Deleted | 99 |

### ClassType
| Value | Numeric Value |
| --- | --- |
| System | 0 |
| Definition | 1 |
| Other | 2 |

### ContactStatus
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Active | 1 |
| Disabled | 2 |
| Deleted | 90 |

### DataTypeCategory
| Value | Numeric Value |
| --- | --- |
| None | 1 |
| Setting | 2 |
| Service | 4 |
| Statistics | 8 |
| Result | 16 |
| Dependency | 32 |
| Verification | 64 |
| PreProcessor | 128 |
| Processor | 256 |
| PostProcessor | 512 |

### DayOfWeek
| Value | Numeric Value |
| --- | --- |
| Sunday | 0 |
| Monday | 1 |
| Tuesday | 2 |
| Wednesday | 3 |
| Thursday | 4 |
| Friday | 5 |
| Saturday | 6 |

### DictionaryLookupMethod
| Value | Numeric Value |
| --- | --- |
| Exact | 0 |
| LevenshteinDistance | 1 |
| HammingDistance | 2 |
| RegEx | 3 |
| None | 4 |
| JaroWinkler | 5 |

### DocumentDataType
| Value | Numeric Value |
| --- | --- |
| Image | 0 |
| Result | 1 |
| Page | 2 |
| Backup | 3 |
| Definition | 10 |
| Training | 11 |

### DocumentStatus
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Received | 3 |
| Analyzed | 4 |
| Trained | 5 |
| Processing | 8 |
| Verification | 9 |
| Processed | 10 |
| Queued | 11 |
| Verifying | 12 |
| InterimProcessed | 13 |
| InsufficientBalance | 81 |
| Error | 90 |
| Archive | 98 |
| Deleted | 99 |
| CustomReceived | 103 |
| CustomBusy | 108 |
| CustomVerification | 109 |
| CustomProcessed | 110 |
| CustomVerified | 120 |
| CustomReleased | 121 |
| CustomExport | 122 |
| CustomError | 190 |

### EnumType
| Value | Numeric Value |
| --- | --- |
| EnumType | 0 |
| DataTypeCategory | 1 |
| CategoryStatus | 5 |
| ProjectStatus | 10 |
| ServiceOptions | 13 |
| ServiceStatus | 14 |
| LinkType | 16 |
| ConstraintType | 17 |
| ConstraintStatus | 18 |
| ConstraintIntervalType | 19 |
| DocumentStatus | 21 |
| UsageType | 22 |
| ParameterDefinitionCategory | 24 |
| ParameterDefinitionStatus | 26 |
| DocumentDataType | 27 |
| ChargeStatus | 29 |
| ServiceEventType | 30 |
| ServiceEventStatus | 31 |
| BundleType | 35 |
| PaymentStatus | 41 |
| TransactionStatus | 42 |
| VerificationStatus | 50 |
| FieldRequired | 51 |
| VerificationType | 52 |
| Availability | 55 |
| WorkItemType | 60 |
| WorkItemStatus | 61 |
| WorkItemAction | 62 |
| WorkItemMethod | 63 |
| NotificationType | 70 |
| NotificationStatus | 71 |
| NotificationEvent | 72 |
| SettingType | 80 |
| SettingStatus | 81 |
| MarkingType | 85 |
| Orientation | 86 |
| ReferenceType | 90 |
| ValueType | 91 |
| GroupingType | 92 |
| OptionStatusFlags | 95 |
| RatingType | 96 |
| RatingStatus | 97 |
| GroupType | 100 |
| GroupStatus | 101 |
| GroupRoleType | 102 |
| GroupRoleStatus | 103 |
| GroupRoleUserStatus | 104 |
| LogType | 110 |
| AuditEntity | 200 |
| AuditAccessType | 201 |
| WizardState | 1000 |
| WizardType | 1001 |
| SortField | 2000 |
| SortDirection | 2001 |

### GroupRoleStatus
| Value | Numeric Value |
| --- | --- |
| Active | 0 |
| Deleted | 99 |

### GroupRoleType
| Value | Numeric Value |
| --- | --- |
| Owner | 1 |
| Administrator | 2 |
| Partner | 4 |
| User | 8 |
| Projects | 32 |
| Train | 256 |
| Verify | 512 |
| Manage | 1024 |
| VerifyAdmin | 1536 |
| Download | 2048 |
| Delete | 4096 |
| PromptDesign | 8192 |
| ViewOnly | 32768 |
| Document | 65536 |
| VerifyDoc | 66048 |
| DocDownload | 67584 |
| Layout | 131072 |
| DocLayout | 196608 |
| DocLayoutTrain | 196864 |
| Shred | 262144 |
| VerifyShred | 262656 |
| ViewShred | 294912 |
| Billing | 524288 |
| BillingAdmin | 525312 |
| BillingView | 557056 |
| Workflow | 1048576 |
| WorkManage | 1049600 |
| WorkView | 1081344 |
| Rule | 2097152 |
| RuleManage | 2098176 |
| RuleView | 2129920 |
| DataSet | 4194304 |
| DataSetAdmin | 4195328 |
| DataSetView | 4227072 |
| Developer | 8326944 |

### GroupStatus
| Value | Numeric Value |
| --- | --- |
| Active | 0 |
| Deleted | 99 |

### GroupType
| Value | Numeric Value |
| --- | --- |
| Default | 0 |
| Partner | 1 |
| Tenant | 10 |
| Billing | 11 |
| Users | 12 |

### GroupRoleUserStatus
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Requested | 1 |
| Rejected | 2 |
| Approved | 3 |
| Deleted | 4 |
| Error | 99 |

### GroupingType
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Page | 1 |
| Cluster | 2 |
| Table | 3 |
| Row | 4 |
| Column | 5 |
| Paragraph | 7 |
| Line | 8 |
| Word | 9 |
| Array | 10 |
| Form | 11 |
| Field | 12 |
| Anchor | 13 |
| Unknown | 99 |

### LogType
| Value | Numeric Value |
| --- | --- |
| Info | 0 |
| Debug | 1 |
| Warning | 2 |
| Error | 3 |
| Exception | 4 |
| Critical | 5 |

### MarkingType
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Simple | 1 |
| Undelined | 2 |
| SimpleComb | 3 |
| TextInFrame | 4 |
| CombInFrame | 5 |
| PartitionedFrame | 6 |
| CharBox | 7 |
| GreyBox | 8 |

### NotificationArea
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Login | 1 |
| Project | 2 |
| Service | 3 |
| Document | 4 |
| Verification | 5 |
| Marketplace | 6 |
| Payment | 7 |
| Preferences | 8 |
| Settings | 9 |
| Support | 10 |
| WorkItem | 11 |
| Billing | 12 |
| System | 13 |
| Sales | 14 |
| Info | 15 |

### NotificationEvent
| Value | Numeric Value |
| --- | --- |
| Create | 1 |
| Update | 2 |
| Delete | 4 |
| Process | 8 |
| Training | 16 |
| Upload | 32 |
| Request | 64 |
| Invite | 128 |
| Approve | 256 |
| Error | 512 |
| Status | 1024 |
| Monitor | 2048 |
| Reset | 4096 |
| Bug | 8192 |
| Info | 16384 |
| Progress | 65536 |
| Toast | 131072 |
| Confirm | 262144 |
| Transfer | 524288 |
| Escelate | 1048576 |
| Verify | 2097152 |
| Linked | 4194304 |
| Reject | 8388608 |
| UnDelete | 16777216 |
| DeviceCode | 33554432 |

### NotificationLevel
| Value | Numeric Value |
| --- | --- |
| Error | 1 |
| Exception | 2 |
| Warning | 4 |
| Info | 8 |
| Debug | 16 |
| Trace | 32 |

### NotificationStatus
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Created | 1 |
| Sent | 2 |
| Delivered | 3 |
| Display | 4 |
| Ignore | 5 |
| Deleted | 90 |
| Error | 99 |

### NotificationType
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Email | 1 |
| SMS | 2 |
| WhatsApp | 3 |
| Bot | 4 |
| Application | 5 |

### OperationOption
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| All | 1 |
| Latest | 2 |

### OptionStatusFlags
| Value | Numeric Value |
| --- | --- |
| Required | 1 |
| Suspicious | 2 |
| DefaultUsed | 4 |
| Verified | 8 |
| Bypassed | 16 |
| Error | 32 |
| Done | 64 |
| Success | 128 |
| RangeProblem | 256 |
| IsValid | 512 |
| Warnings | 1024 |

### Orientation
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Horizontal | 1 |
| Vertical | 2 |
| VerticalReverse | 3 |

### PaymentStatus
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Captured | 10 |
| Authorization | 11 |
| Processing | 20 |
| Complete | 30 |
| Credit | 40 |
| Rejected | 50 |
| Declined | 60 |
| Error | 70 |
| Deleted | 90 |
| Unknown | 99 |

### ProjectStatus
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Active | 1 |
| Disabled | 2 |
| Billing | 3 |
| Deleted | 90 |
| Error | 99 |

### RatingStatus
| Value | Numeric Value |
| --- | --- |
| Enabled | 0 |
| Disabled | 1 |
| Deleted | 99 |

### RatingType
| Value | Numeric Value |
| --- | --- |
| User | 0 |
| Agerage | 1 |
| Error | 99 |

### ReferenceType
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Document | 1 |
| Index | 2 |
| Schedule | 3 |
| Expert | 4 |
| Extractor | 5 |
| Definition | 6 |
| Parameter | 7 |
| Verification | 8 |
| Work | 9 |
| Unknown | 99 |

### RequiredOption
| Value | Numeric Value |
| --- | --- |
| Required | 1 |
| Optional | 2 |
| UseDefault | 4 |
| UseBestFit | 8 |
| Hidden | 16 |
| Utility | 32 |
| VerificationService | 64 |
| Trained | 128 |
| Conditional | 256 |
| DataSet | 512 |

### ServiceEventStatus
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Start | 1 |
| End | 2 |
| Cancelled | 3 |
| Terminated | 4 |
| Error | 5 |
| Stats | 6 |

### ServiceEventType
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Classification | 1 |
| Extraction | 2 |
| Verification | 3 |
| Index | 4 |
| Expert | 5 |
| Extractor | 6 |
| Train | 10 |
| Define | 11 |
| Process | 12 |
| Workflow | 13 |
| Rule | 14 |
| Service | 15 |
| Stats | 16 |
| Code | 17 |

### ServiceOptions
| Value | Numeric Value |
| --- | --- |
| Billing | 1 |
| Definition | 2 |
| Training | 4 |
| Classification | 8 |
| Code | 16 |
| Verification | 32 |
| Scraping | 64 |
| Attachment | 128 |
| Indexing | 256 |
| Inbox | 512 |
| Outbox | 1024 |
| Processor | 2048 |
| Configure | 4096 |
| Classes | 8192 |
| Keys | 16384 |
| Speech | 32768 |
| Video | 65536 |
| Analysis | 131072 |
| Labelling | 262144 |
| Vendors | 524288 |
| BusinessUnits | 1048576 |
| PurchaseOrders | 2097152 |
| GLCodes | 4194304 |
| HintMatrix | 8388608 |
| QuestionMatrix | 16777216 |
| PromptMatrix | 33554432 |
| WorkFlowReason | 67108864 |

### ServiceTypeStatus
| Value | Numeric Value |
| --- | --- |
| Disabled | 0 |
| Enabled | 1 |

### SettingStatus
| Value | Numeric Value |
| --- | --- |
| Active | 0 |
| Disabled | 1 |
| Deleted | 99 |

### SettingType
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Setting | 1 |
| Rule | 2 |
| Dependency | 3 |
| Template | 9 |
| Runtime | 10 |

### SortDirection
| Value | Numeric Value |
| --- | --- |
| Ascending | 0 |
| Descending | 1 |

### SortField
| Value | Numeric Value |
| --- | --- |
| Id | 0 |
| Name | 1 |
| Description | 2 |
| Date | 3 |
| Status | 4 |
| Category | 5 |

### TransactionStatus
| Value | Numeric Value |
| --- | --- |
| Active | 0 |
| Transfered | 1 |
| Deleted | 99 |

### UsageType
| Value | Numeric Value |
| --- | --- |
| Definition | 0 |
| Training | 1 |
| Inbox | 2 |
| Outbox | 3 |
| Label | 4 |
| DataSet | 10 |
| System | 90 |
| Sample | 98 |
| Preview | 99 |

### ValueType
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| String | 1 |
| Number | 2 |
| Currency | 3 |
| Boolean | 4 |
| DateTime | 5 |
| TimeSpan | 6 |
| Email | 7 |
| Enum | 8 |
| Picture | 9 |
| Password | 10 |
| SecureString | 11 |
| Address | 12 |
| IDNo | 13 |
| Country | 14 |
| Code | 15 |
| TelephoneNo | 17 |
| GPS | 18 |
| ServiceType | 19 |
| Service | 20 |
| Project | 21 |
| Data | 90 |
| DataSet | 91 |
| System | 98 |
| Unknown | 99 |

### VerificationStatus
| Value | Numeric Value |
| --- | --- |
| Required | 1 |
| Suspicious | 2 |
| DefaultUsed | 4 |
| Verified | 8 |
| Bypassed | 16 |
| Error | 32 |
| Done | 64 |
| Success | 128 |
| RangeProblem | 256 |
| IsValid | 512 |
| Warnings | 1024 |
| Service | 2048 |
| Training | 4096 |
| Scripted | 8192 |
| Deleted | 16384 |
| Abort | 32768 |

### VerificationType
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Provider | 1 |
| System | 2 |
| User | 3 |
| Service | 4 |
| Training | 5 |
| RPA | 6 |
| API | 7 |
| DataSet | 8 |

### WizardState
| Value | Numeric Value |
| --- | --- |
| Complete | 0 |
| Error | 1 |
| Partial | 2 |
| Warning | 3 |

### WizardType
| Value | Numeric Value |
| --- | --- |
| Service | 0 |
| Dependency | 1 |
| Categories | 2 |
| Class | 3 |
| Definition | 4 |
| Training | 5 |
| Verification | 6 |
| Analysis | 7 |
| Labelling | 9 |
| Vendors | 10 |
| BusinessUnits | 11 |
| PurchaseOrders | 12 |
| PurchaseOrdersItems | 13 |
| GLCodes | 14 |
| DataSet | 15 |
| ChatGptDataSet | 17 |

### WizardValidation
| Value | Numeric Value |
| --- | --- |
| NA | 0 |
| Steps | 1 |
| Options | 2 |
| BeforeSave | 3 |
| AfterSave | 4 |

### WorkItemAction
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Verify | 1 |
| Investigate | 2 |
| Forensic | 3 |
| Fraudulant | 4 |
| Classify | 5 |
| QA | 6 |
| Reprocess | 10 |

### WorkItemMethod
| Value | Numeric Value |
| --- | --- |
| Random | 0 |
| HighThroughput | 1 |
| Idle | 2 |
| ProjectOwner | 3 |
| DocumentOwner | 4 |
| User | 5 |

### WorkItemReason
| Value | Numeric Value |
| --- | --- |
| NA | 0 |
| DataSet | 1 |
| Enum | 2 |
| Other | 3 |

### WorkItemStatus
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Created | 1 |
| Completed | 2 |
| EscalateTx | 3 |
| EscalateRx | 4 |
| Transfer | 5 |
| Received | 6 |
| Verified | 8 |
| RelatedVerified | 9 |
| Rejected | 10 |
| Deleted | 90 |
| DocumentDeleted | 91 |
| Error | 99 |

### WorkItemType
| Value | Numeric Value |
| --- | --- |
| None | 0 |
| Document | 1 |
| Shred | 2 |
| DataSet | 3 |
| Support | 4 |
| Error | 99 |
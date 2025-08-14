# Custom Dataset Related Methods

### Overview

These methods let you query, search, add, update, and delete records in Custom Datasets. Use them for lookups, enrichment, deduplication, and building reference/master data workflows. All methods are accessed via the module object in your custom code.

***

### Method Reference

#### GetDataSetRecord

Signature:  
`ICustomDataSetRecord GetDataSetRecord(ICustomDataSet dataset, int fieldId, string fieldValue, bool isExactMatch)`

Description: Returns a single dataset record where the specified field matches the given value (exact match or not).

Usage:

```csharp
var dataset = module.GetDataSetByDef(stpd, /* datasetId */, false, false, null, null, null, null);
var vatFieldId = /* field definition ID for VAT */;
var record = module.GetDataSetRecord(dataset, vatFieldId, inputVat, isExactMatch: true);
if (record != null)
{
    var companyName = record.GetValue(/* companyNameFieldId */).Value;
    logger.LogInformation("Found dataset record for VAT {vat}: {company}", inputVat, companyName);
}
```

When to use:

* Retrieve a single record by a unique key (e.g., customer ID, VAT number).
* Prefer exact matches when the field is a unique identifier.

***

#### GetDataSetFieldValues (by field definition)

Signature:  
`IEnumerable<ICustomDataSetValue> GetDataSetFieldValues(ICustomDataSet dataset, IParameterDef field)`

Description: Returns all distinct values for a given dataset field.

Usage:

```csharp
var field = dataset.FindField(/* fieldId */);
var values = module.GetDataSetFieldValues(dataset, field);
foreach (var v in values) logger.LogInformation("Value: {val}", v.Value);
```

When to use:

* Build dropdowns, validation lists, or quick existence checks for a field’s possible values.

***

#### GetDataSetFieldValues (by field ID)

Signature:  
`IEnumerable<ICustomDataSetValue> GetDataSetFieldValues(ICustomDataSet dataset, int fieldId)`

Description: Returns all distinct values for the specified dataset field ID.

Usage:

```csharp
var values = module.GetDataSetFieldValues(dataset, /* fieldId */);
```

Tip:

* Use the ID overload when you already have the field ID and don’t need the full definition object.

***

#### LookupDataSetRecord (by field ID)

Signature:  
`ICustomDataSetRecord LookupDataSetRecord(ICustomDataSet dataset, int fieldId, string fieldValue, bool regexMatch, bool isExactMatch)`

Description: Finds a single record by field ID using exact or regex matching (regexMatch takes precedence).

Usage:

```csharp
// Regex pattern example
var pattern = @"^support@.*\.com$";
var record = module.LookupDataSetRecord(dataset, /* emailFieldId */, pattern, regexMatch: true, isExactMatch: false);
```

When to use:

* When the field is known by ID and you need flexible (regex) searches.

***

#### LookupDataSetRecord (by field name)

Signature:  
`ICustomDataSetRecord LookupDataSetRecord(ICustomDataSet dataset, string fieldName, string fieldValue, bool regexMatch, bool isExactMatch)`

Description: Finds a single record by field name with exact or regex matching.

Usage:

```csharp
var record = module.LookupDataSetRecord(dataset, "CustomerID", "12345", regexMatch: false, isExactMatch: true);
```

Tip:

* Prefer the ID-based overload for robustness; name-based is convenient if names are stable.

***

#### SearchDataSetRecords (by field IDs)

Signature:  
`IEnumerable<ICustomDataSetRecord> SearchDataSetRecords(ICustomDataSet dataset, List<(int fieldId, string fieldValue)> search, bool regexMatch, bool isExactMatch)`

Description: Returns records that match all provided fieldId/value pairs (AND semantics), with regex and/or exact matching.

Usage:

```csharp
var search = new List<(int, string)>
{
    (/* vatFieldId */, inputVat),
    (/* countryFieldId */, "ZA")
};
var results = module.SearchDataSetRecords(dataset, search, regexMatch: false, isExactMatch: true);
```

When to use:

* Composite-key lookups across multiple fields.

***

#### SearchDataSetRecords (by field names)

Signature:  
`IEnumerable<ICustomDataSetRecord> SearchDataSetRecords(ICustomDataSet dataset, List<(string fieldName, string fieldValue)> search, bool regexMatch, bool isExactMatch)`

Description: Returns records that match all provided fieldName/value pairs (AND semantics), with regex and/or exact matching.

Usage:

```csharp
var search = new List<(string, string)>
{
    ("CustomerID", "12345"),
    ("Status", "Active")
};
var results = module.SearchDataSetRecords(dataset, search, regexMatch: false, isExactMatch: true);
```

Tip:

* Use field-name overload for readability; switch to ID-based for schema changes resilience.

***

#### GetDataSetGetBestValue

Signature:  
`ICustomDataSetValue GetDataSetGetBestValue(ICustomDataSet dataset, int fieldId, string value, bool ignoreCase = true)`

Description: Returns the best matching value for a field based on heuristic matching (e.g., case-insensitive similarity).

Usage:

```csharp
var best = module.GetDataSetGetBestValue(dataset, /* fieldId */, "acme ltd", ignoreCase: true);
if (best != null) logger.LogInformation("Best match: {val}", best.Value);
```

When to use:

* Suggest or auto-correct near matches for user-entered or OCR’d values.

***

#### GetDataSetGetBestRecord

Signature:  
`ICustomDataSetRecord GetDataSetGetBestRecord(ICustomDataSet dataset, int fieldId, string value, bool ignoreCase = true)`

Description: Returns the best matching record for a given field/value using heuristic matching.

Usage:

```csharp
var bestRecord = module.GetDataSetGetBestRecord(dataset, /* fieldId */, "acme ltd", ignoreCase: true);
```

Tip:

* Pair with verification or user confirmation for critical data paths.

***

#### DeleteDataSetRecord (single record)

Signature:  
`IEnumerable<ICustomDataSetRecord> DeleteDataSetRecord(ICustomDataSetRecord record)`

Description: Deletes the specified dataset record.

Usage:

```csharp
var deleted = module.DeleteDataSetRecord(record);
logger.LogInformation("Deleted {count} record(s)", deleted?.Count() ?? 0);
```

When to use:

* Remove a known record object you previously fetched.

***

#### DeleteDataSetRecord (multiple records)

Signature:  
`IEnumerable<ICustomDataSetRecord> DeleteDataSetRecord(List<ICustomDataSetRecord> records)`

Description: Deletes all provided records.

Usage:

```csharp
var deleted = module.DeleteDataSetRecord(records.ToList());
```

Tip:

* Batch deletions to reduce save cycles and improve performance.

***

#### DeleteDataSetRecord (by key value)

Signature:  
`IEnumerable<ICustomDataSetRecord> DeleteDataSetRecord(ICustomDataSet dataset, string keyValue)`

Description: Deletes a record using the dataset’s key value (the record’s unique key).

Usage:

```csharp
var deleted = module.DeleteDataSetRecord(dataset, keyValue: "3f8d5e8e-...");
```

When to use:

* When you know the dataset record’s key string but not the full object.

***

#### DeleteDataSetRecord (by key ID)

Signature:  
`IEnumerable<ICustomDataSetRecord> DeleteDataSetRecord(ICustomDataSet dataset, int keyId)`

Description: Deletes a record using the dataset’s key ID.

Usage:

```csharp
var deleted = module.DeleteDataSetRecord(dataset, keyId: 123);
```

Tip:

* Use keyId when your dataset uses integer keys rather than GUID/string.

***

#### SaveDataSetRecord

Signature:  
`int SaveDataSetRecord(ICustomDataSet dataset, ICustomDataSetRecord record)`

Description: Creates or updates a single dataset record; returns the number of field values saved.

Usage:

```csharp
var rec = dataset.CreateRecord(Guid.NewGuid().ToString());
rec.SetValue(/* fieldId */, "value");
var savedCount = await module.SaveDataSetRecord(dataset, rec);
```

When to use:

* Upsert (insert/update) individual records as part of enrichment or dedup logic.

***

#### SaveDataSet

Signature:  
`int SaveDataSet(ICustomDataSet dataset, bool mergeData)`

Description: Persists the dataset changes in bulk. When mergeData is true, merges with existing data where supported.

Usage:

```csharp
var count = module.SaveDataSet(dataset, mergeData: true);
logger.LogInformation("Saved dataset changes: {count}", count);
```

Tip:

* Use after multiple record updates to reduce round trips, when your flow supports bulk save.

***

### Best Practices

* Prefer field ID–based lookups for robustness; use field names only if your schema is stable.
* Cache dataset and field definitions within a run to minimize repeated lookups.
* For user-entered/OCR’d values, consider GetDataSetGetBestRecord/Value before falling back to exact.
* Always null-check records and values before accessing .Value to avoid exceptions.
* For high-volume operations, batch using SaveDataSet where appropriate; otherwise use SaveDataSetRecord for precise control.
* Log both hits and misses for auditability in production workflows.

### FAQ

* Q: What’s the difference between GetDataSetRecord and LookupDataSetRecord?
  * A: GetDataSetRecord targets a single field with exact/non-exact match; LookupDataSetRecord supports regex and name/ID field resolution.
* Q: When should I use SearchDataSetRecords?
  * A: Use it for composite-key matching across multiple fields (AND semantics).
* Q: How do I insert a new record?
  * A: Create a record via dataset.CreateRecord(key), set values with SetValue, then call SaveDataSetRecord.
* Q: What does SaveDataSet vs SaveDataSetRecord save?
  * A: SaveDataSetRecord saves one record’s values; SaveDataSet persists broader dataset state and can merge.



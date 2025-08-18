# ValueType

### Overview

The ValueType enum specifies the expected data type for a Parameter defined by a Parameter Definition. It guides the Rules Engine to run the correct ruleset before, during, and after processing.

Underlying type: int

***

### Quick usage

```csharp
// Resolve a field definition constrained to numeric/currency types
var def = module.FindParameterDef(
    "InvoiceTotal",
    stpdId: stpd.Id,
    vtypes: new List<ValueType?> { ValueType.Currency, ValueType.Number }
);

// Example: switch validation behavior by ValueType
switch (def.ValueType)
{
    case ValueType.Currency:
        // parse as money, apply currency-specific rules
        break;
    case ValueType.DateTime:
        // parse date with allowed formats
        break;
}
```

***

### Member Reference

#### None

Value: 0

Description: No data type specified.

***

#### String

Value: 1

Description: A string data type.

***

#### Number

Value: 2

Description: Numeric data type for values without alphabetic/special characters (e.g., IDs, counts).

***

#### Currency

Value: 3

Description: Monetary amounts/prices.

***

#### Boolean

Value: 4

Description: True/False indicators (e.g., checkmarks, toggles).

***

#### DateTime

Value: 5

Description: Dates and/or timestamps.

***

#### TimeSpan

Value: 6

Description: Durations/intervals (e.g., elapsed time, SLAs).

***

#### Email

Value: 7

Description: Email addresses.

***

#### Enum

Value: 8

Description: Enumerated values (select from a fixed list).

***

#### Picture

Value: 9

Description: Image content for specialized processing (e.g., signatures, object detection).

***

#### Password

Value: 10

Description: Sensitive password data.

***

#### SecureString

Value: 11

Description: Encrypted/secure string data.

***

#### Address

Value: 12

Description: Postal or physical addresses.

***

#### IDNo

Value: 13

Description: Identification numbers (national IDs, company registration numbers, etc.).

***

#### Country

Value: 14

Description: Country codes/names.

***

#### Code

Value: 15

Description: Custom code artifacts or code-generated values for advanced processing.

***

#### TelephoneNo

Value: 17

Description: Telephone numbers.

***

#### GPS

Value: 18

Description: Geolocation coordinates (latitude/longitude).

***

#### ServiceType

Value: 19

Description: Service type definition reference.

***

#### Service

Value: 20

Description: Service instance reference.

***

#### Data

Value: 90

Description: Raw/binary data (e.g., blobs).

***

#### DataSet

Value: 91

Description: Custom Dataset references/handles.

***

#### System

Value: 98

Description: System-level values.

***

#### Unknown

Value: 99

Description: Unknown or not-yet-classified data type.

***

### Best Practices

* Choose the most specific ValueType possible; it unlocks targeted validation rules and better auto-corrections.
* For numeric-like strings (e.g., invoice numbers with leading zeros), use String unless true arithmetic is required.
* Use Currency for amounts to enable currency-aware formatting and rounding rules.
* TimeSpan is for durations; DateTime is for absolute dates/times—don’t mix them.
* Treat Password and SecureString as sensitive: avoid logging values and enforce encryption at rest.
* Pair Enum with a controlled list of allowed values; validate upstream to prevent drift.

### FAQ

* Q: Why is there no value 16?
  * A: Enum values are versioned for compatibility; some slots may be intentionally unused.
* Q: Should phone numbers be Number or TelephoneNo?
  * A: Use TelephoneNo to enable formatting/validation rules specific to phone numbers.
* Q: When should I use Data vs Picture?
  * A: Use Picture for image-centric processing; use Data for generic binary payloads.


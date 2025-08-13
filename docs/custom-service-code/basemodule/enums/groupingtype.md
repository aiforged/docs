# GroupingType

### Overview

The GroupingType enum specifies the group a Parameter Definition belongs to. Use it to target operations at the right structural level (form, page, table, row/column, field, etc.) when processing parameters.

Underlying type: int

***

### Quick usage

```csharp
// Find a field definition by name and ensure it's a Field (not an Anchor or Table)
var def = module.FindParameterDef(
    "InvoiceNumber",
    stpdId: stpd.Id,
    grouping: new List<GroupingType?> { GroupingType.Field }
);
```

***

### Member Reference

#### None

Value: 0

Description: No grouping specified.

When to use:

* Default or placeholder when the grouping is not defined.

***

#### Page

Value: 1

Description: The definition relates to a Page. Parent for page element definitions like Paragraphs, Tables, Anchors, Fields, etc.

When to use:

* Page-level operations or as a container for page-scoped children.

***

#### Cluster

Value: 2

Description: The definition relates to a Cluster.

When to use:

* Logical grouping where elements are clustered (provider/model dependent).

***

#### Table

Value: 3

Description: The definition relates to a Table. Parent for all Row and Column definitions.

When to use:

* Custom table extraction or structured row/column processing.

***

#### Row

Value: 4

Description: The definition relates to a Row within a Table.

When to use:

* Iterating row instances or mapping row-level values.

***

#### Column

Value: 5

Description: The definition relates to a Column within a Table.

When to use:

* Column-driven validation, typing, or aggregation across rows.

***

#### Paragraph

Value: 7

Description: The definition relates to a Paragraph. Parent for Line definitions.

When to use:

* Block-level text processing or layout-aware grouping.

***

#### Line

Value: 8

Description: The definition relates to a Line. Parent for Word definitions.

When to use:

* Line-by-line parsing or position-based logic.

***

#### Word

Value: 9

Description: The definition relates to a Word.

When to use:

* Fine-grained text/position operations and OCR alignment.

***

#### Array

Value: 10

Description: The definition relates to an Array. Used for list elements that are not Custom Tables.

When to use:

* Repeating fields where a full table structure isn’t needed.

***

#### Form

Value: 11

Description: The definition relates to a Form. Parent for all Page definitions.

When to use:

* Top-level document template/container operations.

***

#### Field

Value: 12

Description: The definition relates to a Field. Typically used for custom labels on a document.

When to use:

* Most label/value extractions and validations.

***

#### Anchor

Value: 13

Description: The definition relates to an Anchor. Used internally to anchor Fields/Labels to locations.

When to use:

* Location anchoring and reference points for downstream field detection.

***

#### Unknown

Value: 99

Description: Unknown grouping type.

When to use:

* Fallback handling when group is not recognized or newly introduced.

***

### Best Practices

* Filter by GroupingType when resolving definitions to avoid ambiguity (e.g., prefer Field over Anchor).
* Use Table/Row/Column for structured extractions; use Array when list-like but not tabular.
* For layout-aware logic, step down the hierarchy: Form → Page → Paragraph → Line → Word.
* Treat Unknown as non-actionable until mapped; log for diagnostics.

### FAQ

* Q: What’s the difference between Field and Anchor?
  * A: Field represents the actual label/value definition; Anchor is a positional helper used to locate fields.
* Q: When should I use Array instead of Table?
  * A: Use Array for repeating values without a strict row/column structure; use Table for structured tabular data.
* Q: Why are there gaps in numeric values (e.g., no 6)?
  * A: Numeric values are versioned for compatibility; not all slots are used.

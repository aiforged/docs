# DictionaryLookupMethod

### Overview

The DictionaryLookupMethod enum defines how input text is matched to Dictionary entries for Parameter Definitions and other dictionary-driven features. Choose a method based on input quality and the structure of your dictionary.

Underlying type: `int`

***

### Member Reference

#### Exact

Value: `0`

Description:  
Requires an exact, character-for-character match between the input and the dictionary entry.

Usage:

```csharp
var cls = module.FindClassByName(projectId, "Invoices", DictionaryLookupMethod.Exact, minConfidence: 1.0F);
```

When to use:

* Deterministic mapping when input is normalized and consistent.
* Strict ID/code matching.

!!! tip
    Normalize casing and trim whitespace to reduce false negatives.

***

#### LevenshteinDistance

Value: `1`

Description:  
Uses edit distance (insertions, deletions, substitutions) to match near-equal strings; governed by a confidence threshold (0–1).

Usage:

```csharp
var cls = module.FindClassByName(
    projectId,
    "Invocies", // misspelling
    DictionaryLookupMethod.LevenshteinDistance,
    minConfidence: 0.85F
);
```

When to use:

* OCR or human-entered text with possible typos.
* Dictionaries with similar labels where fuzzy resolution helps.

!!! tip
    Start with minConfidence between 0.80 and 0.90; tune with real data.

***

#### HammingDistance

Value: `2`

Description:  
Measures substitution-only differences and requires strings of equal length.

Usage:

```csharp
var cls = module.FindClassByName(
    projectId,
    "INV000123",
    DictionaryLookupMethod.HammingDistance,
    minConfidence: 0.90F
);
```

When to use:

* Fixed-length identifiers where only substitutions are expected.

!!! tip
    Pre-normalize to identical lengths (padding/trimming) before using Hamming.

***

#### RegEx

Value: `3`

Description:  
Matches using a Regular Expression pattern evaluated against dictionary entries.

Usage:

```csharp
var cls = module.FindClassByName(
    projectId,
    @"^Invoice(s)?$",
    DictionaryLookupMethod.RegEx,
    minConfidence: 1.0F
);
```

When to use:

* Pattern-based grouping or variable naming conventions.

!!! tip
    Anchor your regex (^, $) for precision and performance.

***

#### None

Value: `4`

Description:  
Disables dictionary-based matching; input is not matched against dictionary entries.

Usage:

```csharp
var cls = module.FindClassByName(
    projectId,
    "Invoices",
    DictionaryLookupMethod.None,
    minConfidence: 0.0F
);
```

When to use:

* Diagnostics or when you need unaltered input handling.

!!! tip
    Useful as a control case when A/B testing fuzzy strategies.

***

### Best Practices

* Normalize input (case, whitespace) before matching to reduce noise.
* Use Exact for IDs/codes; prefer Levenshtein for noisy text.
* Validate equal length before HammingDistance.
* Keep regex specific and anchored to avoid partial, unintended matches.
* Log matches and misses and iterate on minConfidence thresholds with real-world data.
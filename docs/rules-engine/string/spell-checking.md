# Spell Checking (String Rule Type)

Spell Checking helps you detect and correct misspellings in free‑text fields governed by the String rule. It can improve accuracy post‑OCR and reduce the number of Human‑in‑the‑Loop (HITL) reviews required for simple typographical issues.

---

## Where to configure

Open the field’s configuration and select the String rule. In the Spelling section, choose the desired mode and options.

![String options: Spelling](../../assets/img-2025-08-28-10-33-24.png)

!!! tip "Combine with String validation"
    Use Spell Checking together with String validations (length, allowed characters, regex) to catch both structural issues and typographical errors.

---

## Modes

Choose how thorough the Spell Checking should be:

| Mode  | Description                                                                                          |
|-------|------------------------------------------------------------------------------------------------------|
| Spell | Lightweight word-level spell checking aimed at common typos and OCR confusions (e.g., O ↔ 0, I ↔ 1). |
| Proof | Deeper, context-aware checking that may consider surrounding words, capitalization, and punctuation.  |

!!! info "Choosing a mode"
    - Start with Spell for short labels, names, and headlines where you want minimal interference.  
    - Use Proof for longer sentences/paragraphs (notes, descriptions) where context improves suggestions.

---

## Options

Fine-tune Spell Checking behavior with optional context and language settings:

| Option         | What it does                                                                                                                           |
|----------------|----------------------------------------------------------------------------------------------------------------------------------------|
| Pre Context    | A short phrase that precedes the field value to improve context-sensitive suggestions.                                                  |
| Post Context   | A short phrase that follows the field value to improve context-sensitive suggestions.                                                   |
| Translate From | The source language of the text (if known); helps select the appropriate dictionary and rules.                                         |
| Translate To   | The language to translate into before checking (optional); useful if you expect the final text to be in a specific target language.    |

!!! example "Context in action"
    - Pre Context: “bike” + text: “petal” → suggestion leans toward “pedal”  
    - Post Context: text: “read” + Post Context: “carpet” → suggestion leans toward “red” (“red carpet”)

!!! tip "Keep context concise"
    Provide only a few words of context (1–4) to bias suggestions without overwhelming the checker.

!!! warning "When not to translate"
    If your field must remain in its original language for legal or operational reasons, leave Translate To unset. Translating might change domain-specific terminology.

---

## Suggested workflow

1. Select a mode  
    - Use Spell for short, discrete values; Proof for full sentences and paragraphs.

2. Set language(s)  
    - Provide Translate From when the source language is known.  
    - Use Translate To only when the target must be normalized to a specific language.

3. Add minimal context (optional)  
    - A short Pre/Post Context helps disambiguate homophones and OCR artifacts.

4. Decide on correction handling  
    - Flag only: mark likely misspellings for reviewer attention (HITL).  
    - Auto-correct low-risk issues: safe substitutions (e.g., double spaces → single, obvious OCR swaps) if aligned with your data policy.

5. Define escalation criteria  
    - Escalate when the number or severity of issues exceeds a threshold, or when uncertainty is high.

!!! tip "Protect brand and product names"
    Maintain a custom allow/ignore list for domain terms so they aren’t flagged or altered. Revisit the list as you add new products or partners.

---

## Best practices

- Use Spell mode for codes, part numbers, or short labels to avoid unnecessary alterations.  
- Pair Spell Checking with normalization (trim whitespace, collapse multiple spaces) before applying suggestions.  
- Keep context generic (avoid PII or sensitive text).  
- Test with real samples that include proper nouns, abbreviations, and domain jargon.  
- Document exceptions (e.g., case sensitivity) for reviewers in the field’s guidance.

---

## Examples

- Short label (minimal interference)
    - Mode: Spell  
    - Pre/Post Context: none  
    - Action: flag only  
    - Result: Misspellings flagged; no automatic replacement

- Paragraph description (context-aware)
    - Mode: Proof  
    - Pre Context: “Invoice note:”  
    - Post Context: none  
    - Action: auto-correct low-risk issues (extra spaces, obvious OCR letter swaps)  
    - Escalate if more than 3 flagged items remain

- Multilingual intake, English output
    - Mode: Proof  
    - Translate From: auto or specified (e.g., “Spanish”)  
    - Translate To: English  
    - Action: flag only (reviewer confirms terminology)  
    - Escalate if translation confidence is low (reviewer validates meaning)

---

## Testing checklist

- Validate a batch with common typos and OCR confusions (O/0, I/1, rn/m).  
- Include proper nouns, product names, and abbreviations; confirm your allow/ignore list behavior.  
- Try both modes on the same samples to compare signal vs. noise.  
- Confirm that translations (if enabled) preserve intended meaning and key terms.  
- Verify that HITL triggers only when needed (avoid review overload).

---

## Troubleshooting

- Too many false positives on proper nouns  
  Add them to the allow/ignore list; consider using Spell mode for short name fields.

- Incorrect auto-corrections for codes/IDs  
  Disable auto-correct and rely on flag-only; consider turning Spell Checking off for strictly structured identifiers.

- Mixed-language content flagged excessively  
  Specify Translate From, or disable Translate To; use Proof mode if longer context improves accuracy.

- Context isn’t influencing suggestions  
  Shorten Pre/Post Context or make it more relevant to the field’s domain.

!!! warning "Risk of over-correction"
    For identifiers or legal text, prefer flag-only mode. Auto-corrections can unintentionally change meaning.

---

## See also

- String rule overview (validation, normalization, Text Analysis)
- Field Rules (Rules Engine) – configuration entry points and general concepts
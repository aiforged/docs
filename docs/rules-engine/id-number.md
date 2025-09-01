# ID Number

Use the ID Number Rule Type when a field should contain a national identification number. Currently, this rule validates and derives details for South African IDs (ZA). It parses the value, validates structure and checksum, and exposes derived attributes (e.g., date of birth, gender).

![ID Number — base options](../../assets/img-2025-08-29-12-55-36.png)

---

## When to use

- Documents that contain a South African ID number (forms, KYC, HR, onboarding, invoices).
- Any field where you need to validate the ID and extract metadata like date of birth and gender.
- Workflows that must reject invalid IDs or route uncertain cases to review.

---

## Open Field Configuration

See [Field Rules (Rules Engine)](index.md) for how to open the field configuration:

- From the document overlay (supported services), or
- From the Fields panel on the right sidebar.

---

## Configure the ID Number rule

Core settings:

- Rule Type: IDNo
- Default Value: The value to return when nothing is extracted (e.g., Empty Text).
- Country (optional): Two‑letter country code indicating the ID’s origin.  
    - ZA (South Africa) is supported.  
    - You can link this to another field so the expected country is dynamic per document.

What the rule validates and derives (ZA):

- Length and shape checks for a 13‑digit ID.
- Date of birth segment validity (calendar-valid date).
- Checksum validation.
- Derived attributes:
    - Date of Birth (YYYY‑MM‑DD)
    - Age (computed from DOB)
    - Gender (based on sequence segment)
    - Citizenship flag (citizen vs permanent resident)
    - Checksum status (valid/invalid)

!!! tip "Dynamic country"
    Use the link icon next to Country to bind it to another field. This keeps validation consistent with each document’s origin.

---

## Input parsing and normalization (if applicable)

Recommended normalization before validation:

- Remove non‑digit characters (spaces, dashes, slashes).
- Trim leading/trailing whitespace.
- Correct obvious OCR substitutions cautiously (O ↔ 0, I/l ↔ 1) only if your data policy allows. When uncertain, prefer escalation over guessing.

Ambiguity handling:

- If multiple 13‑digit sequences are present, do not guess; escalate to review.
- If the DOB segment parses in multiple formats due to OCR errors, escalate.

!!! warning "Avoid over-correction"
    Over-aggressive character substitutions can turn an invalid value into a seemingly valid ID. Keep substitutions minimal and auditable.

---

## Output and formatting (if applicable)

- Output the normalized 13‑digit value without separators.
- Store derived attributes as metadata for downstream use (DOB, Age, Gender, Citizenship, ChecksumValid).
- If you need a masked representation for display, apply masking in your UI layer (e.g., XXXXXX… digits) and keep the stored value canonical.

!!! info "Data privacy"
    Treat IDs as sensitive data. Restrict visibility and consider masking in UI and logs, especially for support and audit screens.

---

## HITL triggers and reviewer guidance

Trigger review when:

- The value is not 13 digits after normalization.
- The date of birth segment is invalid (e.g., impossible date) or yields an out‑of‑policy age.
- Checksum validation fails.
- Multiple candidate IDs are found in the same field.
- Country is not ZA or is unknown (given current support scope).

!!! example "Suggested reviewer note (HITL)"
    “Verify the ID number. Ensure it is a single 13‑digit ZA ID (no spaces/dashes) and that the date of birth segment is correct. If multiple candidates appear, keep only the intended ID.”

---

## Examples

- Single clean ZA ID
    - Input: 8001015009087
    - Output: 8001015009087
    - Derived: DOB 1980‑01‑01; Gender Male; Citizenship (per digit); ChecksumValid = true

- ID with separators
    - Input: 800101 5009 087 → Normalized → 8001015009087 (validate and derive)

- Ambiguous content
    - Input contains two 13‑digit sequences → escalate to review with guidance

!!! tip "Structure refresher (ZA)"
    The ZA ID embeds DOB (YYMMDD), a sequence segment used to infer gender, a citizenship indicator, and a trailing checksum.

---

## Best practices

- Normalize to digits‑only before validation; keep the stored value canonical.
- Log validation failures with clear reasons (length, DOB invalid, checksum) to speed up reviews.
- Apply strict access controls and masking for PII.
- If you expect multiple geographies in the future, keep Country linked and plan for multi‑country validation.

---

## Testing checklist

- [ ] Valid 13‑digit IDs across several birth years (including leap years).  
- [ ] Inputs with spaces/dashes that should normalize correctly.  
- [ ] Invalid DOB segments (e.g., 991331…).  
- [ ] Checksum failures to confirm rejection paths.  
- [ ] Multiple 13‑digit sequences in one field (ensure escalation).  
- [ ] Age policy checks (e.g., minimum age) if your process requires it.

---

## Troubleshooting

- Value won’t validate (length)
  Ensure non‑digits are removed and that OCR didn’t split digits across lines.

- DOB parse errors
  Check for OCR digit swaps (e.g., 0/8, 1/7). If uncertain, escalate rather than auto‑correct.

- Checksum failures on many documents
  Inspect the extraction area and OCR settings; validate that Country is set to ZA.

- Derived gender/citizenship looks wrong
  Confirm the digit positions weren’t shifted by stray characters; re‑examine normalization.

---

## UI reference

- Base panel (Rule Type, Default Value, Country with link option)  
    ![ID Number — base options](../../assets/img-2025-08-29-12-55-36.png)

- Example of applied rule type in verification view 
    ![ID Number — derived info](../../assets/img-2025-08-29-13-01-41.png)
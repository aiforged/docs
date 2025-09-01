# Telephone Number

Use the Telephone Number Rule Type when a field should contain a phone number. The rule validates and normalizes the extracted value, optionally stripping noise, and can constrain matches using country code and network/prefix patterns.

---

## When to use

- Phone, mobile, or contact number fields on invoices, applications, KYC, and forms.
- Workflows where numbers must meet country/prefix policies (e.g., ZA mobile ranges).
- Any scenario that requires clean, consistently formatted numbers for dialing or CRM.

---

## Open Field Configuration

See [Field Rules (Rules Engine)](index.md) for how to open the field configuration:

- From the document overlay (supported services), or
- From the Fields panel on the right sidebar.

---

## Configure the TelephoneNo rule

![TelephoneNo — base options](../../assets/img-2025-09-01-10-42-34.png)

Core settings:

- Rule Type: TelephoneNo
- Default Value: The value to return when nothing is extracted (e.g., Empty Text).
- Remove Invalid Characters: Remove unrelated characters from the extracted value (recommended).

Validation helpers (optional):

- Country Code Pattern: Provide a pattern to constrain allowable country codes (e.g., “+27” for South Africa).
- Network Pattern: Provide a pattern to constrain allowable network/operator prefixes or number shapes (e.g., mobile prefixes).

!!! tip "Patterns are your policy"
    Keep patterns simple and explicit. Use them to enforce the exact country and/or number ranges you accept. When in doubt, validate broadly and escalate edge cases rather than over-restricting.

---

## Input parsing and normalization (if applicable)

Recommended normalization before/with validation:

- Trim whitespace.
- If Remove Invalid Characters is enabled, strip spaces, dashes, parentheses, and other non-number noise.
- Preserve a leading “+” when present (international format).
- Normalize common OCR artifacts cautiously (e.g., `O`→`0`, `l`→`1`) only when your data policy allows; otherwise, escalate.

Ambiguity handling:

- If multiple numbers are present (e.g., office + mobile), do not guess. Apply a selection policy (e.g., “first mobile-like match”) or escalate to review.

!!! warning "Extensions and shortcodes"
    If the value contains extensions (e.g., “x1234”, “ext 1234”) or short codes, decide whether to:
    - Strip the extension and store it separately, or
    - Escalate for human confirmation.
    Avoid silently discarding potentially important digits.

---

## Output and formatting (if applicable)

- Output the normalized number per your policy:
    - International (recommended): `+<country><national>` (E.164-like).
    - National: keep leading zero and local formatting (only when your systems require it).
- If you enforce E.164, ensure the Country Code Pattern requires a leading “+” and valid country digits.

!!! info "Downstream formatting"
    Store the canonical number (e.g., E.164) and render user-friendly formats (spaces, parentheses) in the UI or export layer.

---

## Country Code Pattern and Network Pattern

These fields let you constrain acceptable numbers via simple, readable patterns.

- Country Code Pattern (examples)
    - Exact ZA: `^\+27`
    - US/Canada NANP: `^\+1`
    - ZA or US: `^\+(27|1)`
    - National-only (discourage): `^0` (accepts numbers starting with 0) — use with care.

- Network Pattern (examples)
    - ZA mobile prefixes (082–084, 060–079, 061, 071, 072, etc.)  
        Example (simplified): `^(6[0-9]|7[1-9]|8[1-4])`
    - US NANP 10-digit (area code + exchange not starting with 0/1): `^[2-9]\d{2}[2-9]\d{6}$` (when country code already handled)
    - Custom office pattern: `^[1-9]\d{6}$` (7-digit internal numbers)

Notes:

- Apply Country Code Pattern to the full, leading portion of the number.
- Apply Network Pattern to the portion after the country code (or to the national portion if you store national format).
- Keep patterns aligned to the final stored representation (international vs national).

!!! tip "Order of operations"
    1) Normalize and optionally strip non-digit characters (preserve leading “+”).  
    2) Validate Country Code Pattern (if provided).  
    3) Remove the country code portion and validate Network Pattern against the remaining national digits.

---

## HITL triggers and reviewer guidance

Trigger review when:

- The value doesn’t satisfy Country Code Pattern or Network Pattern.
- The number is too short/long for your policy (e.g., not 11–15 digits for international).
- Multiple different numbers are present with no deterministic selection policy.
- OCR ambiguity is suspected (e.g., letter/digit confusion) and you choose not to auto-correct.

!!! example "Suggested reviewer note (HITL)"
    “Verify the telephone number. Ensure the correct country code and prefix are present and remove formatting characters. Expected output: a single, valid number (preferably international format, e.g., +27XXXXXXXXX).”

---

## Examples

- Normalize ZA mobile to international
    - Input: “(082) 123‑4567”
    - Remove Invalid Characters: On → “0821234567”
    - Country Code Pattern: `^\+27` (stored format requires +27)
    - Policy: Convert `0` national prefix to `+27`  
        Output: `+27821234567`

- Enforce NANP (US/CA) with 10-digit national
    - Input: “+1 (415) 555‑2671”
    - Country Code Pattern: `^\+1`
    - Network Pattern: `^[2-9]\d{2}[2-9]\d{6}$` (applied to `4155552671`)  
        Output: `+14155552671`

- Multiple numbers found (requires policy)
    - Input: “Tel: 021 555 1234, Mobile: 072 345 6789”
    - Policy: Prefer mobile-like prefixes → select `072 345 6789`  
        Output (ZA int’l): `+27723456789`  
        If no policy: escalate to HITL.

- Ambiguous OCR
    - Input: “O82 123 4S67”
    - If no auto-correction policy: escalate to HITL with note to confirm O/0 and 5/S.

---

## Best practices

- Choose one canonical storage format (prefer E.164-like) and stick to it.
- Use Country Code Pattern to prevent cross‑country misclassification.
- Keep Network Pattern simple; revisit as carriers change prefixes.
- Don’t silently drop extensions; store separately or escalate.
- Log validation failures (which pattern failed, length mismatch) to speed reviews.

---

## Testing checklist

- [ ] International vs national inputs (with/without “+”).  
- [ ] Variety of formatting: spaces, dashes, parentheses.  
- [ ] Country Code Pattern acceptance/rejection (positive and negative cases).  
- [ ] Network Pattern acceptance/rejection across allowed prefixes.  
- [ ] Multiple-number strings with your selection policy.  
- [ ] OCR confusion cases (O↔0, I/l↔1) and chosen handling (auto-correct vs HITL).

---

## Troubleshooting

- Number passes patterns but won’t dial correctly
    - Confirm you’re storing international format; ensure any national leading `0` is handled per country rules.

- Too many false rejections
    - Relax Network Pattern or broaden accepted prefixes; verify you’re applying it to the correct portion (post-country code).

- Numbers frequently missing the plus sign
    - Add a pre-processing step to convert national numbers to international using the known country context.

- Extensions pollute the number
    - Extract extensions into a separate field (regex), then validate the remaining core number.

---

## UI reference

- Base panel (Rule Type, Default Value, Remove Invalid Characters, Country Code Pattern, Network Pattern)  
    ![TelephoneNo — base options](../../assets/img-2025-09-01-10-42-34.png)
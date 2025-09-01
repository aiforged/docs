# Boolean

Use the Boolean Rule Type when a field should resolve to a true/false value. The rule maps common textual variants (e.g., “yes”, “no”, “on”, “off”, “1”, “0”) to a canonical Boolean, with customizable mappings and a safe default when nothing is extracted.

---

## When to use

- Checkbox-like fields extracted as text (e.g., “Yes/No”, “On/Off”).
- Flags in forms and applications (e.g., “Subscribed”, “Active”, “Paid”).
- Any scenario where varied textual inputs must be normalized to a strict Boolean.

---

## Open Field Configuration

See [Field Rules (Rules Engine)](index.md) for how to open the field configuration:

- From the document overlay (supported services), or
- From the Fields panel on the right sidebar.

---

## Configure the Boolean rule

![Boolean — base options](../../assets/img-2025-09-01-09-54-52.png)

Core settings:

- Rule Type: Boolean
- Default Value: The value to return when nothing is extracted (True/False). Use this to enforce a safe fallback for empty or missing inputs.

Value to Boolean Mappings:

- Define how specific input tokens should map to True or False.
- The UI provides an editable list. Typical preconfigured examples include:
    - True: yes, true, on, 1, enabled, y
    - False: no, false, off, 0, disabled, n
- Add additional keys as needed to fit your documents (e.g., “checked”, “unpaid”, “opt-in”, “opt-out”).

!!! tip "Treat mappings as a policy"
    Keep the list short and unambiguous. For domain-specific words (“active”, “closed”), align with business meaning and document the intent so reviewers know what to expect.

---

## Input parsing and normalization (if applicable)

Recommended normalization before mapping:

- Trim leading/trailing whitespace.
- Lowercase the input for case-insensitive matching.
- Remove surrounding punctuation or brackets if present (e.g., “[yes]”, “(no)”).
- Normalize common OCR artifacts (e.g., “y e s” → “yes”) only when confident; otherwise, escalate.

Ambiguity handling:

- If an input contains multiple tokens (e.g., “yes/no”), do not guess. Escalate to HITL unless your process defines a deterministic rule (e.g., first token wins).

!!! warning "Negations and double negatives"
    Phrases like “not applicable”, “not enabled”, or “no longer active” are context-dependent. Prefer explicit mappings (e.g., “not enabled” → False) or escalate if uncertain.

---

## Output and formatting (if applicable)

- The rule outputs a Boolean value (True/False).
- If downstream systems require string labels (e.g., “Yes”/“No”), perform that conversion in your export or UI layer, keeping the field’s stored value strictly Boolean.

!!! info "Stable downstream contracts"
    Keeping the field Boolean ensures reliable filtering, analytics, and integrations. Apply presentation conversions (e.g., localization) outside the rule.

---

## HITL triggers and reviewer guidance

Trigger review when:

- The input does not match any configured mapping.
- Multiple conflicting tokens are present (e.g., “yes/no”).
- The value is context-heavy and your mappings are intentionally conservative (e.g., “not currently active”).

!!! example "Suggested reviewer note (HITL)"
    “Verify the Boolean value. If the text is ambiguous (e.g., ‘yes/no’ or negations), select the correct interpretation based on the document context. Expected output: True or False.”

---

## Examples

- Basic mapping with defaults
    - Mappings: yes → True, no → False
    - Default Value: False
    - Inputs: “YES” → True; “no” → False; “” (empty) → False (default)

- Extended domain terms
    - Add: “active” → True, “inactive” → False, “opt-in” → True, “opt-out” → False

- Numeric toggles
    - Add: “1” → True, “0” → False
    - Input: “1” → True; “0” → False

- Ambiguous phrase (requires review)
    - Input: “not enabled yet”
    - If there’s no explicit mapping for this phrase, escalate to HITL.

---

## Best practices

- Keep mappings concise and unambiguous; review them with business stakeholders.
- Prefer explicit multi-word mappings for negations (e.g., “not enabled” → False) rather than relying on partial tokens.
- Log or surface the “unmapped” reason to speed reviewer decisions.
- Use a safe Default Value, but don’t let it mask frequent extraction gaps—monitor for empty inputs.

---

## Testing checklist

- [ ] Case-insensitivity: “YES/Yes/yes” all resolve the same way.  
- [ ] Whitespace/ punctuation handling: “ yes ”, “[no]”, “(on)” map correctly.  
- [ ] Domain phrases: confirm each custom term maps as intended (active/inactive, opt-in/opt-out).  
- [ ] Numeric toggles: “1/0” behave as expected.  
- [ ] Ambiguity scenarios route to HITL.  
- [ ] Empty value returns the configured Default Value.

---

## Troubleshooting

- Value won’t map (becomes unmapped)
    - Add the token to the mappings, ensuring it’s lowercased/trimmed as stored; check for hidden whitespace or punctuation.

- Conflicts between similar tokens
    - Remove or clarify overlapping entries; choose a single canonical token per meaning.

- Negation interpreted incorrectly
    - Add explicit multi-word mappings (e.g., “not applicable” → False). Avoid relying on partial token matches.

- Too many escalations
    - Expand mappings for common phrases seen in your documents; add guidance for reviewers on edge cases.

---

## UI reference

- Base panel (Rule Type, Default Value)
    ![Boolean — base options](../../assets/img-2025-09-01-09-54-52.png)

- Value to Boolean Mappings table
    ![Boolean — mappings](../../assets/img-2025-09-01-09-55-28.png)
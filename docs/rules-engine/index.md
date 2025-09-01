# 📑 Field Rules (Rules Engine)

Field Rules validate, normalize, and protect the values that a Service extracts from documents. After extraction, the AIForged Rules Engine evaluates each configured field against its Rule Type to ensure the value is correct and ready for downstream use.

What Field Rules help you do:

- Validate: enforce formats, ranges, and required patterns (dates, emails, phone numbers, codes).
- Normalize: auto-correct common OCR mistakes (e.g., O → 0, l → 1) and standardize formats.
- Escalate: route to Human‑in‑the‑Loop (HITL) review when conditions aren’t met or confidence is low.
- Protect: mark sensitive fields (e.g., passwords) and control visibility/handling.

---

## Opening Field Configuration

Configure rules for any field using either path:

### 1) From the document overlay (supported services)
1. Click the field directly on the document (bounding box).
2. Click the gear icon “Open field configuration”.
3. Configure the rule in the panel that opens.

![Open field configuration from overlay](../../assets/img-2025-08-28-08-55-19.png)

### 2) From the Fields panel (right sidebar)
1. In the Fields list, select the field.
2. Click the gear icon “Open field configuration”.
3. Configure the rule in the panel that opens.

![Open field configuration from Fields panel](../../assets/img-2025-08-28-08-55-43.png)

!!! note "Where to find these options"
    The overlay actions appear only for services that support the interactive document view. If you don’t see the overlay, use the Fields panel on the right.

---

## Configuring a Rule

1. Choose Rule Type  
   Select the Rule Type that best matches the expected value (e.g., DateTime, Number, Email Address).

2. Set validation conditions  
    - Required vs. optional  
    - Allowed patterns (presets or regex, where supported)  
    - Ranges, lengths, masks (e.g., min/max, decimal places, country formats)

3. Enable normalization (optional)  
    - Auto-correct common OCR substitutions (O↔0, I↔1)  
    - Trim whitespace, standardize casing  
    - Unify formats (e.g., YYYY‑MM‑DD for dates; consistent decimal/thousand separators)

4. Define HITL behavior  
    - Trigger review when validation fails or confidence is below a threshold  

5. Save and test  
    - Re-run validation on the current document  
    - Confirm the status (e.g., Passed checks, Suspicious, Required) and adjust as needed

---

## Available Rule Types

Assign one of the following Rule Types to a field. Each type includes targeted validation and optional normalization:

- Address
- Boolean
- Code
- Country
- Currency
- DateTime
- Email Address
- Enum
- GPS Coordinates
- ID Number
- Number
- Password
- Picture
- Secure String
- String
- Telephone Number
- Timespan

---

## Examples

- DateTime  
  Enforce YYYY‑MM‑DD and auto-normalize separators (/, -) to your standard.

- Number / Currency  
  Require a fixed number of decimal places; normalize comma/dot usage; reject alphabetic characters.

- Email Address  
  Must contain “@” and a valid domain; trim whitespace; lower-case domain part.

- Telephone Number  
  Normalize to a consistent format (e.g., E.164); ensure valid country code and digit length.

- Code / String  
  Use a regex such as `^INV-[0-9]{6}$` to enforce business identifiers.

---

## Best Practices

- Match the Rule Type to the business meaning of the field (not just the current value).
- Be strict on critical fields (amounts, dates, IDs) to reduce downstream corrections.
- Prefer normalization before escalation to fix common issues automatically.
- Pilot rules with a small, varied batch before broad rollout.

---

## Troubleshooting

- Don’t see the overlay action?  
  Use the Fields panel; overlay is available only in services that support the interactive document view.

- Rule didn’t trigger?  
  Check the assigned Rule Type, thresholds, and conditions; confirm the field value actually violates the rule.

- Unexpected corrections?  
  Review normalization settings; disable specific substitutions that conflict with your data patterns.

- Permission issues?  
  Ensure your role includes rights to edit field configurations within the current agent/service.
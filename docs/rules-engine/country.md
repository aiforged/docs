# Country

Use the Country Rule Type when a field should resolve to a standardized country. The Rules Engine parses the extracted text (e.g., “USA”, “U.S.A.”, “United States”) and normalizes it to ISO and UN M49 attributes you can store or use downstream.

![Country rule configuration](../../assets/img-2025-08-29-10-40-42.png)

---

## When to use

- Documents that contain a country name, code, or reference (invoices, IDs, shipping labels).
- Any field where you want a canonical country output (e.g., Alpha2, Alpha3, or region groupings).

---

## Open Field Configuration

See [Field Rules (Rules Engine)](index.md) for how to open the field configuration:

- From the document overlay (supported services), or
- From the Fields panel on the right sidebar.

---

## Configure the Country rule

Open the field configuration and select Rule Type = Country. Then set:

- Default Value  
  The value returned if nothing is extracted (e.g., leave as Empty Text or set a sensible default).

- Field to extract (optional)  
  Choose which attribute you want to return as the field’s value. By default, the original text is returned. Pick one of the standardized attributes below to return a normalized value.
    - Name — Official country name
    - Alpha2 — ISO 3166‑1 alpha‑2 code (e.g., US, ZA)
    - Alpha3 — ISO 3166‑1 alpha‑3 code (e.g., USA, ZAF)
    - CountryCode — ISO 3166‑1 numeric code for the country
    - Iso3166_2 — ISO 3166‑2 country root code (used for subdivisions such as US‑CA)
    - Region — UN M49 region name (e.g., Americas)
    - SubRegion — UN M49 subregion name (e.g., Southern Africa)
    - IntermediateRegion — UN M49 intermediate region name (where applicable)
    - RegionCode — UN M49 region numeric code
    - SubRegionCode — UN M49 subregion numeric code
    - IntermediateRegionCode — UN M49 intermediate region numeric code
    - None — Return nothing (useful when you only need analytics or metadata)

!!! tip "Choosing the best output"
    - Use Alpha2 for compact, widely supported codes.  
    - Use Alpha3 when your downstream systems expect three‑letter codes.  
    - Use Region/SubRegion to group documents for reporting (e.g., “EMEA” style rollups).

---

## Input parsing and normalization (if applicable)

- Case- and punctuation-insensitive matching (e.g., “U.S.A.”, “USA”, “U S A” → United States).
- Handles diacritics and language variants (e.g., “Côte d’Ivoire”, “Ivory Coast”, “España”, “Germany/Deutschland”).
- Normalizes common abbreviations and synonyms (e.g., “UK” → United Kingdom).
- Optional light spell tolerance for OCR artifacts (e.g., “Brazi1” → “Brazil”) — use conservatively to avoid misclassification.

!!! warning "Ambiguous inputs"
    Short or truncated tokens (e.g., “C.A.”, “SA”) may map to multiple countries. Keep these inputs for review unless strong context exists.

---

## Output and formatting (if applicable)

- The selected “Field to extract” determines the final field value (e.g., Alpha2 vs Alpha3).
- Advanced overrides:
    - Use Analytics Value: replace the extracted text with the normalized attribute value.
    - Use Analytics Confidence: replace the field’s confidence with the analytics confidence.

!!! info "Safe defaults for integrations"
    - Prefer Alpha2 when you integrate with most ERPs and shipping systems.  
    - Prefer Alpha3 when joining to datasets that use three‑letter codes (e.g., UN/WorldBank data).

---

## HITL triggers and reviewer guidance

Trigger review when:

- No country match is found.
- Confidence is below a defined threshold.
- The normalized value conflicts with other document fields (e.g., Address country vs Country field mismatch).
- The value is not in your allowed country list (if enforced).

!!! example "Suggested reviewer note (HITL)"
    “Verify the country value. If abbreviations or alternate names are present, select the correct country. Expected output: ISO Alpha2 or Alpha3 as configured.”

---

## Examples

- Input: “United States”  
    - Name: United States of America  
    - Alpha2: US  
    - Alpha3: USA

- Input: “South Africa”  
    - Name: South Africa  
    - Alpha2: ZA  
    - Alpha3: ZAF

- Input: “Côte d’Ivoire”  
    - Name: Côte d’Ivoire  
    - Alpha2: CI  
    - Alpha3: CIV

!!! tip "Restricting allowed countries"
    If the process should only accept a subset (e.g., shipping countries), validate the normalized output against an allowed list. For strict enforcement, consider pairing with an Enum rule downstream.

---

## Best practices

- Standardize on a single code format (Alpha2 or Alpha3) across systems to avoid mapping errors.
- Pair with Address or CountryCode fields from lookups to cross‑validate and reduce false matches.
- Keep a short alias list for your frequent variants (e.g., UK/Great Britain/United Kingdom) if your sources are noisy.
- Avoid aggressive auto-correction; prefer HITL for ambiguous or low‑confidence inputs.

---

## Testing checklist

- [ ] Provide samples with abbreviations, punctuation, and multiple languages (e.g., “U.S.A.”, “DE”, “Deutschland”).  
- [ ] Confirm normalization to your chosen attribute (Alpha2/Alpha3) is consistent.  
- [ ] Validate region mappings (Region/SubRegion) if used for reporting.  
- [ ] Verify HITL triggers on low confidence or invalid inputs.  
- [ ] Run a small batch across varied templates to confirm robustness.

---

## Troubleshooting

- Field returns raw text instead of a code  
    Set “Field to extract” (e.g., Alpha2) and enable “Use Analytics Value”.

- Unexpected country due to OCR noise  
    Reduce noise with String normalization or Spell Checking before resolution; review synonyms/aliases.

- Region/SubRegion doesn’t match internal groupings  
    Use UN M49 outputs and map to internal regions downstream.

---

## UI reference

- Configuration panel with advanced options  
    ![Country rule configuration](../../assets/img-2025-08-29-10-40-42.png)

- Field to extract dropdown (attributes)  
    ![Country attributes dropdown](../../assets/img-2025-08-29-10-42-22.png)
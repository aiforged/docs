# Address

Use the Address Rule Type when a field should contain a postal or physical address. The rule can validate and normalize the text, and verify it against a Maps Engine (Google or Azure) to return structured components and geolocation.

![Address — base options](../../assets/img-2025-09-01-08-37-55.png)

---

## When to use

- Addresses on invoices, statements, applications, delivery notes, and KYC documents.
- Situations where you want a canonical, validated address and/or coordinates (lat/lon).
- Workflows that need specific parts of an address (e.g., Postal Code, City) as the final field value.

---

## Open Field Configuration

See [Field Rules (Rules Engine)](index.md) for how to open the field configuration:

- From the document overlay (supported services), or
- From the Fields panel on the right sidebar.

---

## Configure the Address rule

Core settings:

- Rule Type: Address
- Default Value: The value to return when nothing is extracted (e.g., Empty Text).
- Maps Engine: Select the service used for verification/lookup (Google or Azure).
- Current Address Field (optional): Indicate what the extracted result represents (e.g., “Street Name”, “City”, “Postal Code”, “FreeForm”). Helps the Maps Engine target the lookup correctly.
- Address Field to Extract (optional): Choose which component should be returned as the field’s value (e.g., “Postal Code”, “CountryCodeIso3”, “FreeForm”, or “All”).

Supported components for “Current Address Field” and “Address Field to Extract”:

- **FreeForm** — The unstructured, canonicalized full address line. Use when your field holds a single-line address and you want the normalized string back.
- **All** — Returns the complete structured payload (all components) for metadata and downstream processing.
- **Street Number**
- **Street Name**
- **Suburb**
- **City**
- **Postal Code**
- **Municipality**
- **Province**
- **State**
- **Country**
- **Country Code** (alias: **CountryCode**; ISO 3166‑1 alpha‑2, e.g., US, ZA)
- **Country Code ISO3** (alias: **CountryCodeIso3**; ISO 3166‑1 alpha‑3, e.g., USA, ZAF)
- **Geolocation** (combined lat/lon)
- **Longitude**
- **Latitude**
- **Points of Interest** (alias: **POI**)

Notes and guidance:

- Current Address Field:
    - Use FreeForm when your extracted value is a single address line. If you already know which part the field represents (e.g., Postal Code), set that to help the Maps Engine target lookups more accurately.
- Address Field to Extract:
    - Choose a specific component (e.g., Postal Code, City, CountryCodeIso3) when the field must hold that exact value.
    - Select FreeForm to output the normalized single-line address as the field value.
    - Select All to capture the full structured response as metadata. Pair this with Use Analytics Value if you also want the field value set to a specific component.

!!! tip "ISO codes at a glance"
    - CountryCode: ISO 3166‑1 alpha‑2 (US, ZA).
    - CountryCodeIso3: ISO 3166‑1 alpha‑3 (USA, ZAF).
    Pick the one your downstream systems expect for consistent joins and validations.

Field Linking:

- Pass in additional, structured data to improve match accuracy. For example, link Country/CountryCode and Postal Code fields, even if your extracted value is just the street line.

![Address - Field Linking](../../assets/img-2025-09-01-08-39-49.png)

---

## Input parsing and normalization (if applicable)

Recommended normalization before verification:

- Trim whitespace and remove duplicate punctuation (commas, periods).
- Unwrap multi-line addresses into a single coherent line where appropriate.
- Standardize common abbreviations when safe (e.g., “Rd” → “Road”, “St” → “Street”), mindful of locale.
- Remove non-address prefixes like “Ship To:” or “Attention:”.

Using Field Linking to guide parsing:

- If you already capture parts like City or Postal Code separately, link them to provide context for the Maps Engine, increasing accuracy and reducing ambiguity.

!!! warning "Locale sensitivity"
    Abbreviations and formats vary by country (e.g., US “ZIP” vs. ZA “Postal Code”). Avoid aggressive substitutions unless you’re certain about the locale.

---

## Output and formatting (if applicable)

When verification is enabled, you can output:

- FreeForm — The normalized single-line address.
- A specific component (e.g., City, Postal Code, CountryCode, CountryCodeIso3).
- Geolocation — Latitude/Longitude (separate fields) or Geolocation (combined).
- All — The full structured response for metadata or downstream processing.

Advanced Options:

![Address - Advances Options](../../assets/img-2025-09-01-08-40-31.png)

- Use Analytics Value (optional): Override the extracted text with the verified/normalized value.
- Use Analytics Confidence (optional): Replace the field’s confidence with the verification confidence.

!!! info "Coordinates as output"
    If you need coordinates, set “Address Field to Extract” to Latitude and Longitude (in two fields) or Geolocation, then enable “Use Analytics Value”. Many systems prefer separate lat/lon fields.

---

## HITL triggers and reviewer guidance

Trigger review when:

- The Maps Engine returns multiple candidates with similar confidence (ambiguous match).
- Verification fails or confidence is below your threshold.
- The normalized country or postal code conflicts with other document fields (e.g., country mismatch).
- Required components are missing (e.g., no Postal Code) for your process or locale.

!!! example "Suggested reviewer note (HITL)"
    “Verify the address against the document. If multiple matches are suggested, select the exact address and confirm the country and postal code. Where available, include latitude and longitude.”

---

## Examples

- Single-line address to full canonical format (FreeForm)
    - Input: “12 Main Rd, Rondebosch, 7700”
    - Field Linking: Country = “South Africa”
    - Output (FreeForm): Normalized single-line address; Postal Code verified as 7700


- Output a specific component (Postal Code)
    - Current Address Field: “Street Name” (extracted)
    - Field Linking: City + Country
    - Address Field to Extract: “Postal Code”
    - Result: Field returns the verified Postal Code


- Country codes for downstream joining
    - Address Field to Extract: CountryCodeIso3
    - Result: “ZAF” (for South Africa), aligning to systems that expect alpha‑3 codes


- Capture full structured response (All) while setting a specific field value
    - Address Field to Extract (field value): Postal Code
    - Also store: All (structured metadata) → write City, Province, CountryCode, Latitude, Longitude to metadata


- Return geolocation for mapping
    - Maps Engine: Google
    - Address Field to Extract: Latitude (in one field) and Longitude (in another field)
    - Result: e.g., -33.9580, 18.4653

!!! tip "Disambiguation via linking"
    Adding Country/CountryCode and City via Field Linking often resolves issues where the same street exists in multiple regions.

---

## Best practices

- Always include Country (or Country Code) via Field Linking for accurate geocoding.
- If you only need a component (e.g., Postal Code), set the output to that component to keep downstream data clean.
- Use CountryCode (alpha‑2) vs CountryCodeIso3 (alpha‑3) consistently across your data pipelines.
- Maintain a short list of acceptable countries or regions if your process is restricted.
- Keep normalization conservative; rely on the Maps Engine to standardize where possible.
- Consider rate limits/quotas of the Maps Engine; batch-test with realistic volumes.

---

## Testing checklist

- [ ] Provide addresses across key regions/countries you support.  
- [ ] Test addresses with special characters/diacritics and local abbreviations.  
- [ ] Verify multi-line vs single-line inputs and the effect of normalization.  
- [ ] Check ambiguous cases (e.g., duplicate street names) and confirm HITL behavior.  
- [ ] Validate component outputs (Postal Code, City, CountryCode, CountryCodeIso3, Lat/Lon).  
- [ ] Confirm “Use Analytics Value/Confidence” behaves as expected.

---

## Troubleshooting

- Multiple candidates returned  
    Use Field Linking (City, Country) and re-test; raise confidence threshold or escalate for HITL selection.

- Address verifies to the wrong country/region  
    Ensure Country/Country Code is linked; check for misleading abbreviations in the raw text.

- Missing or incorrect postal code  
    Confirm locale; some regions don’t use postcodes consistently. Consider allowing empty but escalate when your process requires it.

- No geolocation returned  
    The address may be a PO Box or too vague. Provide more context (City, Country) or accept non-geocodable addresses with HITL.

- Inconsistent results between engines  
    Stick to one engine for a process if possible, or document expected differences and thresholds.

---

## UI reference

- Base panel (Rule Type, Default Value, Maps Engine, Current Address Field, Address Field to Extract)  
    ![Address — base options](../../assets/img-2025-09-01-08-37-55.png)

- Maps Engine selection and verification behavior  
    ![Address — Maps Engine selection](../../assets/img-2025-09-01-08-38-39.png)

- Dropdowns (include FreeForm, All, CountryCode, CountryCodeIso3 among other components)  
    ![Address - Field Dropdowns](../../assets/img-2025-09-01-08-41-35.png)
    Look for these options in both the “Current Address Field” and “Address Field to Extract” dropdowns in the configuration panel.

- Field Linking (Street Number/Name, Suburb, City, Postal Code, Municipality, Province/State, Country, CountryCode, CountryCodeIso3, Geolocation, Latitude, Longitude, Points of Interest)
    ![Address - Field Linking](../../assets/img-2025-09-01-08-39-49.png)

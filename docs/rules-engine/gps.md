# GPS Coordinates

Use the GPS Coordinates Rule Type when a field should contain a valid geographic coordinate (latitude and longitude). The rule parses common input styles (decimal degrees or degree/minute/second notations), validates ranges, and normalizes the output for downstream use.

![GPS — base options](../../assets/img-2025-08-29-12-44-24.png)

---

## When to use

- Documents that include a location stamp (e.g., inspection reports, delivery notes, photos with EXIF text).
- Fields expected to hold a single latitude/longitude pair for mapping, routing, or geotagging.
- Any scenario where you need a consistent, validated coordinate from varied text formats.

---

## Open Field Configuration

See [Field Rules (Rules Engine)](index.md) for how to open the field configuration:

- From the document overlay (supported services), or
- From the Fields panel on the right sidebar.

---

## Configure the GPS rule

Core settings:

- Rule Type: GPS
- Default Value: The value to return when nothing is extracted (e.g., Empty Text).

Validation performed by the rule includes:

- Detecting coordinate formats with degree symbols or decimal notation.
- Verifying latitude is within [-90, +90] and longitude within [-180, +180].
- Checking that a single, unambiguous coordinate pair is present.

!!! tip "Single coordinate pair"
    If your source may include multiple coordinates, pre-filter upstream or specify which one to keep; otherwise, escalate for review.

---

## Input parsing and normalization

The parser accepts multiple formats and normalizes them into a consistent coordinate pair.

Accepted patterns (examples):

- Decimal Degrees (DD)
    - 33.9249, 18.4241
    - -33.9249 18.4241
    - 33.9249° S, 18.4241° E → normalized to -33.9249, 18.4241
- Degrees Minutes Seconds (DMS)
    - 33°55'29.6"S 18°25'26.8"E
    - N 33° 55' 29.6", E 18° 25' 26.8"
- Degrees Decimal Minutes (DDM)
    - 33°55.493' S, 18°25.447' E

Normalization steps typically include:

- Interpreting N/S/E/W or sign prefixes (− for S/W).
- Converting DMS/DDM to decimal degrees.
- Removing labels and extra characters (e.g., parentheses, commas in the wrong place).
- Collapsing whitespace and standardizing separators.

!!! warning "Ambiguity and order"
    If the source doesn’t clearly indicate which value is latitude vs longitude (e.g., “18.4241, 33.9249”), confidence may be reduced. Prefer inputs that include N/S/E/W or specify order in surrounding text.

---

## Output and formatting

Standard output (recommended):

- Decimal degrees (DD) with dot decimal separator.
- Latitude first, then longitude, separated by a comma and space.
- A consistent number of decimal places (e.g., 5–6) based on your precision needs.

Examples:

- -33.92490, 18.42410
- 34.05223, -118.24368

!!! info "Precision guidance"
    - 5 decimal places ≈ 1.1 m precision.
    - 6 decimal places ≈ 0.11 m precision.
    Choose precision to match your data quality and downstream requirements.

---

## HITL triggers and reviewer guidance

Trigger review when:

- Either value falls outside valid ranges (lat not in [-90, 90] or lon not in [-180, 180]).
- Only one number is present (missing pair) or more than one plausible pair is detected.
- The format is ambiguous (no N/S/E/W and uncertain order).
- Precision is too low for your policy (e.g., fewer than 3 decimal places).

!!! example "Suggested reviewer note (HITL)"
    “Verify latitude/longitude order and hemisphere. Ensure the value is a single pair in decimal degrees: lat, lon (e.g., -33.92490, 18.42410). Correct if degrees/minutes/seconds were misread.”

---

## Examples

- DMS to decimal
    - Input: 33°55'29.6"S 18°25'26.8"E
    - Output: -33.92489, 18.42411

- Decimal with hemispheres
    - Input: 33.9249° S, 18.4241° E
    - Output: -33.92490, 18.42410

- Signed decimals with space
    - Input: -33.9249 18.4241
    - Output: -33.92490, 18.42410

- Ambiguous order (requires review if not policy-defined)
    - Input: 18.4241, 33.9249
    - Output: Confidence lowered; escalate unless order policy is known.

---

## Best practices

- Standardize output to decimal degrees with a fixed precision (e.g., 6 decimals).
- Prefer latitude first, then longitude, for consistency across systems.
- Preserve signs in output; don’t rely on cardinal letters in the final value.
- If inputs vary widely, document the expected order and any allowable symbols for your team.
- Avoid automatic guesses when both orders seem plausible—escalate instead.

---

## Testing checklist

- [ ] Provide examples for DD, DDM, and DMS formats.
- [ ] Include hemisphere indicators (N/S/E/W) and signed values (±).
- [ ] Test ambiguous cases without hemisphere markers.
- [ ] Validate range limits and out-of-range behavior.
- [ ] Confirm rounding and decimal precision in the final output.
- [ ] Ensure multiple-coordinate inputs trigger the expected HITL path.

---

## Troubleshooting

- Only one number parsed  
  Ensure the text truly contains both latitude and longitude; check for OCR splits across lines.

- Out-of-range values  
  Verify that S/W are correctly converted to negative signs; inspect for transposed numbers.

- Comma vs decimal confusion  
  Enforce dot as the decimal separator in output; strip thousand separators if any crept in.

- Order reversed  
  If a source consistently uses lon, lat, set a pre-processing step or policy to swap into lat, lon before finalization.

---

## UI reference

- Base panel (Rule Type, Default Value)  
    ![GPS — base options](../../assets/img-2025-08-29-12-44-24.png)
# Currency

Use the Currency Rule Type when a field should contain a monetary amount. The rule validates and normalizes the extracted value, applies culture-aware formatting, and optionally strips characters that don’t belong in a currency amount.

![Currency rule — base options](../../assets/img-2025-08-29-10-55-27.png)

---

## When to use

- Invoice totals, line-item amounts, taxes, fees, balances, and payments.
- Any field that must be parsed as a number and formatted as currency with consistent separators and decimals.

---

## Open the field configuration

See [Field Rules (Rules Engine)](index.md) for how to open the field configuration:

- From the document overlay (supported services), or
- From the Fields panel on the right sidebar.

---

## Configure the Currency rule

![Currency rule — overview](../../assets/img-2025-08-29-10-55-27.png)

Core settings:

- Rule Type: Currency
- Default Value: Value to return when nothing is extracted (e.g., Empty Text, 0, or a business default).
- Remove Invalid Characters: When enabled, removes non-numeric and non-currency characters from the extracted value.

!!! tip "Keep it clean"
    Enabling “Remove Invalid Characters” helps eliminate stray labels (e.g., “Total:”) and whitespace before parsing.

---

## Output Format

Define the culture and presentation of the final output.

![Currency rule — Output Format](../../assets/img-2025-08-29-10-55-46.png)

- Culture Language Code (optional)  
  Two-letter language code used for output (e.g., `en`, `fr`).

- Culture Country Code (optional)  
  Two-letter country code used for output (e.g., `US`, `ZA`).

- Currency Symbol  
  The symbol to render with the formatted value (e.g., `$`, `€`, `£`, `R`).  
  Leave blank to rely on culture defaults, or set explicitly for consistency.

- Decimal Digits  
  Number of fraction digits for output (e.g., 2 for cents).

- Decimal Separator  
  Character used for the decimal separator in output (e.g., `.`, `,`).

- Group Separator  
  Character used for the thousands separator in output (e.g., `,`, ` `).

!!! info "How culture and overrides interact"
    Culture provides sensible defaults for symbol and separators.  
    If you set Symbol/Separators explicitly, those take precedence over culture defaults.

!!! warning "Separator mix-ups"
    If the output uses `.` for decimals but the source uses `,`, parsing may fail or misinterpret values (e.g., 1.234 vs 1,234). Use “Additional Parsing Formats” to accept multiple input styles safely.

---

## Additional Parsing Formats

Accept more than one input style while still producing a single, consistent output.

![Currency rule — Additional Parsing Formats](../../assets/img-2025-08-29-10-56-07.png)

- Additional Cultures  
  Add culture codes the parser should accept on input (e.g., `de-DE`, `fr-FR`). This allows values like `1.234,56 €` to be understood even if your output uses a different style.

- Additional Currency Symbols  
  Add symbol variants the parser should accept on input, mapped by country/context (e.g., accept `ZAR`, `R`, `R` with/without spaces).

!!! tip "Parse wide, format narrow"
    Accept the common input variations you see (extra cultures/symbols), then standardize output with a single culture and explicit separators. This keeps downstream systems stable.

---

## Examples

- Standardize mixed inputs  
    - Inputs seen: `€1.234,50`, `1,234.50 USD`, `R 1 234,50`  
    - Additional Cultures: `de-DE`, `fr-FR`  
    - Additional Currency Symbols: add `USD`, `€`, `R`  
    - Output Format: Language `en`, Country `US`, Symbol `$`, Decimal Digits `2`, Decimal `.` Group `,`  
    - Result: All values are rendered as `$1,234.50`

- Keep local presentation  
    - Inputs seen: `1.234,50 €`  
    - Output Format: Language `de`, Country `DE`; use culture defaults  
    - Result: `1.234,50 €`

!!! example "Suggested reviewer note (HITL)"
    “Verify the amount and symbol. If separators look wrong, correct thousands/decimal separators before approving.”

---

## HITL triggers (recommended)

Trigger review when:

- The value cannot be parsed under any configured culture/symbol.
- The parsed value is negative where only positive amounts are allowed.
- The symbol parsed does not match the expected output or allowed list.
- Decimal digits exceed the configured limit (e.g., > 2).

---

## Testing checklist

- [ ] Test typical inputs from each source (e.g., `1,234.50`, `1.234,50`, `1 234,50`).  
- [ ] Verify that removing invalid characters does not remove valid signs or separators.  
- [ ] Confirm that the configured culture and separators produce the intended output.  
- [ ] Validate edge cases: zero values, negatives (if allowed), and very large numbers.  
- [ ] Ensure Additional Cultures/Symbols cover the formats you actually receive.

---

## Troubleshooting

- Amount renders with wrong separators  
  Check Output Format separators; if input differs, add the input culture under Additional Cultures.

- Symbol is missing or incorrect  
  Set Currency Symbol explicitly in Output Format.  
  If input symbols vary, add them to Additional Currency Symbols for parsing.

- Value won’t parse  
  Enable “Remove Invalid Characters”; ensure the input is covered by Additional Cultures/Symbols; confirm that thousands and decimal separators aren’t conflicting.

- Unexpected decimals (e.g., 3+ fraction digits)  
  Set Decimal Digits to the required precision; escalate when inputs exceed it.

---

## UI reference

- Overview  
    ![Currency rule — overview](../../assets/img-2025-08-29-10-55-27.png)

- Output Format  
    ![Currency rule — Output Format](../../assets/img-2025-08-29-10-55-46.png)

- Additional Parsing Formats  
    ![Currency rule — Additional Parsing Formats](../../assets/img-2025-08-29-10-56-07.png)
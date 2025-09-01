# TimeSpan

Use the TimeSpan Rule Type when a field should contain a duration (e.g., hours and minutes). The rule parses common duration formats, validates them, and normalizes the result for downstream use.

![TimeSpan — base options](../../assets/img-2025-09-01-10-50-03.png)

---

## When to use

- Durations on timesheets, SLAs, call logs, and process timings.
- Any field expected to hold elapsed time rather than a date or clock time.
- Normalizing diverse inputs like “1h 30m”, “90 mins”, or “01:30” into a consistent output.

---

## Open Field Configuration

See [Field Rules (Rules Engine)](index.md) for how to open the field configuration:

- From the document overlay (supported services), or
- From the Fields panel on the right sidebar.

---

## Configure the TimeSpan rule

![TimeSpan — base options](../../assets/img-2025-09-01-10-50-03.png)

Core settings:

- Rule Type: TimeSpan
- Default Value: The value to return when nothing is extracted (e.g., Empty Text).

This rule has a simple configuration. All behavior focuses on recognizing common duration inputs and returning a normalized result.

---

## Input parsing and normalization

Accepted patterns (examples):

- Colon formats
    - HH:mm (e.g., 02:15)
    - HH:mm:ss (e.g., 02:15:30)
    - H:mm or m:ss (e.g., 8:05, 3:07)
- Unit-based text
    - “1h 30m”, “1 hr 30 min”, “90m”, “90 minutes”, “2 hours”
    - “5400s”, “45 sec”, “45 seconds”
- Mixed
    - “1h 30”, “1:30h”, “01:30 hours” (where units are present)

Normalization rules:

- Whitespace and punctuation noise are trimmed.
- Unit variants are standardized (e.g., hr, h → hours; m, min → minutes; s, sec → seconds).
- If seconds are omitted, they normalize to 00.
- Ambiguities like “1:30” are interpreted as HH:mm by default.

!!! warning "Ambiguous inputs"
    Inputs such as “1:30” can mean 1 hour 30 minutes or 1 minute 30 seconds depending on context. By default, they are parsed as HH:mm. If your process expects mm:ss, set a review policy for these cases.

---

## Output and formatting

Standard output (recommended):

- Canonical string in HH:mm:ss (zero‑padded), for example:
    - 00:45:00
    - 02:15:30
    - 36:00:00 (durations can exceed 24 hours if the source implies longer spans)

Alternative outputs (downstream):

- Store the canonical HH:mm:ss, then derive totals where needed:
    - TotalMinutes (integer/decimal)
    - TotalSeconds (integer)
    - Human‑readable labels (“2h 15m” for UI)

!!! info "Why HH:mm:ss?"
    A uniform, zero‑padded HH:mm:ss travels well across systems, avoids locale surprises, and is easy to convert into totals.

---

## HITL triggers and reviewer guidance

Trigger review when:

- The value cannot be parsed as a duration (unknown pattern or conflicting units).
- The value is clearly out of policy (e.g., negative duration, or unexpectedly large if your process caps durations).
- Ambiguous formats appear (e.g., “1:30” with no context and your policy requires explicit units).

Reviewer note suggestion:

- “Confirm the duration format. If ambiguous (e.g., 1:30), interpret as HH:mm unless the document indicates mm:ss. Normalize to HH:mm:ss.”

---

## Examples

- Hours and minutes
    - Input: “1h 30m” → Output: 01:30:00
    - Input: “01:30” → Output: 01:30:00

- Hours, minutes, seconds
    - Input: “2:15:30” → Output: 02:15:30

- Minutes only
    - Input: “90 minutes” → Output: 01:30:00

- Seconds only
    - Input: “5400s” → Output: 01:30:00

- Long span (allowed)
    - Input: “36 hours” → Output: 36:00:00

- Ambiguous (consider review)
    - Input: “1:30” → Default interpretation: 01:30:00; escalate if your process expects mm:ss.

---

## Best practices

- Standardize on HH:mm:ss for storage; convert to totals or human‑readable strings at the edges.
- Decide how to handle ambiguous “m:ss” vs “H:mm” and write it into your reviewer guidance.
- If your workflow has min/max limits, document them and route out‑of‑range values to HITL.
- Avoid auto-correcting suspect OCR (e.g., “l:30” vs “1:30”) unless you have high confidence.

---

## Testing checklist

- [ ] HH:mm, HH:mm:ss, and H:mm inputs across typical ranges.  
- [ ] Unit-based inputs (h/hr, m/min, s/sec), including pluralization and spacing variants.  
- [ ] Large durations (>24h) if your process expects them.  
- [ ] Ambiguous values (e.g., 1:30) and your chosen handling policy.  
- [ ] Negative or zero durations if applicable to your process (e.g., disallow negatives).  

---

## Troubleshooting

- Won’t parse
    - Check for unsupported symbols/typos; ensure units are recognizable or provide a colon format.

- Interpreted as mm:ss instead of HH:mm (or vice versa)
    - Add reviewer guidance or pre‑classification to disambiguate; prefer explicit units in source templates if possible.

- Unexpectedly large or small output
    - Confirm the source didn’t mix units (e.g., “1m 90s” expected → 02:30). Add HITL when totals exceed expected ranges.

---

## UI reference

- Base panel (Rule Type, Default Value)
    ![TimeSpan — base options](../../assets/img-2025-09-01-10-50-03.png)
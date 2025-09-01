# Email

Use the Email Rule Type when a field should contain a valid email address. The rule validates the structure, optionally enforces an expected domain, and can normalize common OCR-induced issues before routing downstream systems.

![Email — base options](../../assets/img-2025-08-29-12-37-03.png)

---

## When to use

- Contact details on invoices, forms, onboarding documents, and correspondence.
- Fields expected to contain a single email address for notifications or routing.
- Scenarios where the email domain should match a known organization or tenant.

---

## Open Field Configuration

See [Field Rules (Rules Engine)](index.md) for how to open the field configuration:

- From the document overlay (supported services), or
- From the Fields panel on the right sidebar.

---

## Configure the Email rule

Core settings:

- Rule Type: Email
- Default Value: The value to return when nothing is extracted (e.g., Empty Text).
- Domain (optional): Set an expected domain to validate against (e.g., example.com).  
    - You can also link this to another field so the expected domain is dynamic (e.g., supplier domain).

Validation performed by the rule includes:

- Presence of a single “@” separating local part and domain.
- At least one “.” in the domain portion.
- Basic character checks and shape validation to reduce false emails.

!!! tip "Dynamic domain validation"
    Use the link icon next to Domain to bind it to another field (e.g., “Company Domain”), so each document is validated against the correct expected domain.

---

## Input parsing and normalization (if applicable)

Recommended normalization steps before/with validation:

- Trim leading/trailing whitespace.
- Remove wrapping characters from display names (e.g., “John Doe <john@example.com>” → john@example.com).
- Normalize obvious OCR artifacts:
    - Replace “(at)” or “[at]” → “@”
    - Replace “(dot)” or “[dot]” → “.”
    - Remove spaces around “@” and “.” (e.g., “john @ example . com” → “john@example.com”)
- Convert domain to lowercase; keep local part as-is (local-part is technically case-sensitive, but most systems treat it case-insensitively).

!!! warning "Ambiguous or multiple values"
    If the field may contain multiple emails, split and choose the first valid one or escalate to review. The Email rule expects a single address.

---

## Output and formatting (if applicable)

- Preserve the local part as entered (unless your policies require lowercasing).
- Lowercase the domain for consistency.
- Store the final value without display names or comments (just local@domain).

!!! info "Internationalized domains"
    If you receive non‑ASCII domains (IDNs), convert to a consistent representation (e.g., punycode) in a downstream step if your target systems require it.

---

## HITL triggers and reviewer guidance

Trigger review when:

- The extracted value fails basic structure checks.
- The domain does not match the configured/linked expected domain.
- The value contains disallowed characters or looks obfuscated after normalization (e.g., “name at domain dot com” still unresolved).
- Multiple emails are present and an automatic selection policy isn’t defined.

!!! example "Suggested reviewer note (HITL)"
    “Verify the email address. If display names or extra text are present, extract only the mailbox (local@domain). Expected domain: example.com.”

---

## Examples

- Basic enforcement with fixed domain
    - Domain: example.com
    - Input: “Sales <sales@example.com>” → Output: sales@example.com (passes)
    - Input: “info@examples.com” → Escalate (domain mismatch)

- Normalizing obfuscated input
    - Input: “john (at) example (dot) com” → Normalize → john@example.com (passes)

- Removing display name and trailing punctuation
    - Input: “Accounts Payable <ap@example.com>.” → Output: ap@example.com (passes)

---

## Best practices

- Keep the field single‑valued; handle multiple addresses upstream or via a dedicated parsing step.
- Use a dynamic Domain link when the expected domain varies by document (supplier/customer).
- Normalize domain casing; avoid altering the local part unless your systems require lowercasing.
- Treat obvious OCR substitutions conservatively; escalate when uncertain rather than guessing.
- Log the reason for failures (e.g., invalid domain) to speed reviewer decisions.

---

## Testing checklist

- [ ] Typical valid addresses (john@example.com, jane.doe@example.co.uk).  
- [ ] Display name formats (“Jane Doe <jane@example.com>”).  
- [ ] Obfuscated patterns (“name [at] domain [dot] com”).  
- [ ] Edge cases: consecutive dots, leading/trailing dots, missing TLD.  
- [ ] Domain mismatch behavior when an expected domain is set or linked.  
- [ ] Unicode/IDN scenarios if applicable to your documents.

---

## Troubleshooting

- Value fails validation unexpectedly  
  Check for hidden characters or spaces; ensure normalization removes display names and comments.

- Frequent domain mismatches  
  Verify the configured Domain or linked field; some emails may be from third‑party providers (e.g., gmail.com) rather than the entity’s corporate domain.

- Multiple emails in one field  
  Add a pre‑processing step to split and select, or escalate when multiples are found.

- Obfuscated text still not recognized  
  Expand your normalization patterns (e.g., variants of “at”/“dot”) or send to HITL with clear reviewer guidance.

---

## UI reference

- Base panel (Rule Type, Default Value, Domain with link option)  
    ![Email — base options](../../assets/img-2025-08-29-12-37-03.png)
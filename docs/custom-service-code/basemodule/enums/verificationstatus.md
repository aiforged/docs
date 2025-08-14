# VerificationStatus

### Overview

The VerificationStatus enum is a bit flag set that tracks the state of a field/parameter’s verification across system rules and Human-in-the-Loop (HITL) actions. Multiple statuses can be combined to reflect real-world verification journeys.

Underlying type: int Flags: Yes (combine with bitwise OR)

***

### Quick usage

```csharp
// Combine flags when updating status
verification.Status |= VerificationStatus.Required | VerificationStatus.Suspicious;

// Check if a specific flag is set
bool needsVerification = (verification.Status & VerificationStatus.Required) != 0;

// Clear a flag (e.g., once a reviewer confirms it’s okay)
verification.Status &= ~VerificationStatus.Suspicious;

// Example: mark verified and successful
verification.Status |= VerificationStatus.Verified | VerificationStatus.Success;
```

***

### Member Reference

#### Required

Value: 1

Description: Verification on a field/document is required.

***

#### Suspicious

Value: 2

Description: Suspicious field value; verification is required to clear this flag.

***

#### DefaultUsed

Value: 4

Description: A default value was used for the parameter.

***

#### Verified

Value: 8

Description: This field value has been verified by a user.

***

#### Bypassed

Value: 16

Description: Verification was bypassed by the Rules Engine.

***

#### Error

Value: 32

Description: An error occurred during verification.

***

#### Done

Value: 64

Description: The verification is done.

***

#### Success

Value: 128

Description: The Rules Engine verified the field successfully.

***

#### RangeProblem

Value: 256

Description: The value is outside configured minimum/maximum ranges.

***

#### IsValid

Value: 512

Description: The field value is valid based on configured rules (often used with Anchor fields).

***

#### Warnings

Value: 1024

Description: Not in use.

***

#### Service

Value: 2048

Description: A Verification Service was invoked to assist verification.

***

#### Training

Value: 4096

Description: This field participates in training workflows.

***

#### Scripted

Value: 8192

Description: This field was verified via Custom Code.

***

#### Deleted

Value: 16384

Description: The field has been deleted.

***

### Best Practices

* Treat this enum as a flags set: combine related states with bitwise OR and check with bitwise AND.
* Clear transient flags (e.g., Suspicious) once a user or rule confirms the value to keep state clean.
* Log transitions to and from Error, Required, and Success for strong auditability.
* Avoid overloading “Done” to mean “Successful”—use Done + Success together for clarity.
* If you expose statuses to UI, map them to user-friendly labels and tooltips.

### FAQ

* Q: Can a field be both Verified and Error?
  * A: Yes, flags can combine; use combinations to represent nuanced states (but consider clearing Error once Verified is set).
* Q: What’s the difference between Verified and Success?
  * A: Verified indicates a human confirmed it; Success indicates the Rules Engine passed it. Use both when applicable.
* Q: Should I use HasFlag?
  * A: You can, but bitwise checks are often faster: (status & VerificationStatus.Required) != 0.


# Create Verification

## About

### Display Name

Create Verification

### Input

**Context** - Requires a context for the connection to AIForged. Includes connection configuration information, user information and authentication information. This is a regular VB or C# expression.

**Document ID -** \<Int32> Document ID

**Document Parameter ID -** \<Int32> The unique identifier of the parameter to create the verification for

**Info Text -** \<String> Optional text that provide information regarding the result

**Previous verification -** \<AiForged.API.DocumentViewModel> A previous verification object for the specified document parameter. The new verification result will utilize the block info and confidence value from this object

**Result text -** \<String> Optional text that describes the result

**Value - \<String> -** The value of the verification result

**Verification Status -** \<AiForged.API.VerificationStatus> the status flag/s of the verification result

### Misc

**Private -** If not selected, the values of variables and arguments are at Verbose level.

**Result**

## Activity Preview

### Activity View

<figure><img src="../../.gitbook/assets/image (107) (1).png" alt=""><figcaption></figcaption></figure>

### Activity Property View

<figure><img src="../../.gitbook/assets/image (82) (1).png" alt=""><figcaption></figcaption></figure>

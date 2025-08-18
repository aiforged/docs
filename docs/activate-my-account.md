# ✅ Activate my account

## Overview

New AIForged users receive an activation email when their account is created by a Tenant administrator or AIForged consultant. Activation links finalize your account setup so you can sign in securely.

!!! warning
    If you have not received an activation email within 30 minutes of your account being created, check your spam/junk folder. If it’s still missing, ask your Tenant administrator or AIForged consultant to resend the invite.

---

## Before you begin

- Confirm you’re expecting an activation email from AIForged.
- Make sure you are using the correct Studio URL for your environment:
    - Production: https://studio.aiforged.com
    - Your organization’s internal Studio URL (for on‑prem or private deployments)
- If you’re on a corporate network, ensure outbound access to the AIForged Studio URL is allowed.

---

## Activate via email link

1. Open the activation email
    - Look for the subject referencing “Activate your AIForged account.”
    - If you can’t find it, check spam/junk.

2. Click Activate My Account
    - The link opens AIForged Studio’s activation page in your browser.
    - Your Username/Email and Activation Token may be pre‑filled.

3. Verify your details
    - Ensure the Username/Email matches your work address.
    - If the Activation Token is not pre‑filled, copy it from the email and paste it into the field.

4. Submit to activate
    - Click the activation button to complete setup.
    - You’ll see a confirmation once activation succeeds.

![Activation screen example](assets/image%20%2826%29%20%281%29%20%281%29.png)

!!! tip
    After activation, proceed to Login and set up Multi‑factor Authentication for improved security.

---

## If the activation link doesn’t work

- Copy the activation URL directly
    - Right‑click the button in the email and copy the link address.
    - Paste it into your browser’s address bar.

- Enter the token manually
    - Open the activation page in Studio.
    - Paste the Activation Token from your email if it isn’t pre‑filled.

- Try another browser or clear cache
    - Some extensions or cached sessions can block redirects.

---

## Common issues and fixes

- Activation email not received
    - Wait up to 30 minutes and check spam/junk.
    - Ask your Tenant administrator or consultant to resend the invite.
    - Confirm the correct email address was used.

- Activation link expired
    - Request a fresh activation email from your Tenant administrator.
    - If your account already exists, you can use Forgot Password to set credentials.

- Invalid or mismatched token
    - Use the most recent activation email (older tokens may be invalidated).
    - Copy/paste the token without extra spaces.

- “This account is already active”
    - Go to Login and sign in.
    - If you can’t sign in, use Forgot Password.

- Network or environment errors
    - Ensure you’re using the correct Studio URL (Production vs on‑prem).
    - Ask your network admin to allow outbound access to your Studio endpoint.

!!! info
    If your organization uses a Single Sign‑On (External Account) approach, your user still needs to be created and linked to the correct Tenant by an administrator. Once linked, you can sign in with your organization’s identity provider from the Login page.

---

## Next steps

1. Login
    - Sign in at https://studio.aiforged.com (or your internal Studio URL).
    - Guide: [Login](login.md)

2. Set up Multi‑factor Authentication (recommended)
    - Protect your account with MFA.
    - Guide: [Multi‑factor Authentication](multi-factor-authentication.md)

3. Select the correct Tenant
    - Use the Tenant selector (top‑right in Studio) to switch to your company’s Tenant.

4. Personalize your profile
    - Update your name, avatar, locale, and notification preferences.
    - Guide: [User Profile](user-profile.md)

!!! tip
    If you plan to configure agents and services, ensure you have the right role in the correct Tenant (Owner, Administrator, or Developer).

---

## Related links

- How to access AIForged: [Click Here](how-to-install-aiforged.md)
- Register (how new users get accounts): [Click Here](register.md)
- Login: [Click Here](login.md)
- Multi‑factor Authentication: [Click Here](multi-factor-authentication.md)
- Forgot Password: [Click Here](forgot-password.md)
- User Profile: [Click Here](user-profile.md)
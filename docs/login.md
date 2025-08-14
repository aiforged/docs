# 🔐 Login

## Overview

Sign in to AIForged using your AIForged credentials or a supported external account (Single Sign-On). After login, select the correct Tenant to ensure your roles and permissions apply to the work you’re doing.

!!! tip
    If you plan to add or configure services, make sure you have the right role in the correct Tenant: Owner, Administrator, or Developer.

---

## Sign in with your AIForged account

1. Open AIForged Studio
    - Go to https://studio.aiforged.com (or your company’s internal Studio URL).

2. Enter your credentials
    - Use your registered Username or Email and your Password.

3. Complete Multi‑Factor Authentication (if prompted)
    - Approve the sign‑in using your configured authenticator.
    - Guide: [Multi-factor Authentication](multi-factor-authentication.md)

4. Choose the correct Tenant
    - Use the Tenant selector in the top‑right of Studio to switch to your company’s Tenant.

5. You’re in
    - Continue to your agents and services.

!!! tip
    If you haven’t activated your account yet, check your inbox for the activation email. Guide: [Activate My Account](activate-my-account.md)

---

## Sign in with an External Account (SSO)

AIForged supports sign‑in with external identity providers. You can log in directly with a provider or link a provider to an existing AIForged account.

Supported providers

- Microsoft
- Facebook
- Google
- Twitter
- GitHub
- LinkedIn
- Azure Active Directory (via Microsoft)

First‑time use (no existing AIForged account)
- If you haven’t registered or logged in before, signing in with an external account will create an AIForged account using publicly available profile details from the provider.

Existing users (link and use SSO)
- Link an external account to your existing AIForged account in your User Profile. Once linked, you can log in using either your AIForged credentials or the external provider.

### Link an external account (recommended before using SSO)

1. Open your profile
    - In Studio, go to User menu → [User Profile](user-profile.md)

2. Link a provider
    - Find the External Accounts section and select a provider (e.g., Microsoft, Google).
    - Complete the provider’s consent screen.

3. Confirm the link
    - Your provider is now associated with your AIForged account.

4. Use SSO next time
    - On the login screen, choose your linked provider to sign in.

!!! info
    Linking SSO ensures your work stays tied to your existing AIForged account, preserving roles, access, and history.

---

## Select the correct Tenant

Most users belong to:

- A personal Tenant (created with your account), and
- Your company’s Tenant (added by your company admin).

After login:

- Use the Tenant selector in the top‑right of Studio.
- Switch to your company’s Tenant before creating agents or configuring services.

!!! warning
    Working in the wrong Tenant can lead to missing permissions, hidden projects, or disabled actions. If something seems unavailable, check your Tenant first.

---

## Security best practices

- Enable and use MFA for all user accounts.
- Prefer SSO with your organization’s identity provider where available.
- Sign out from shared machines and close your browser when done.
- Review your linked external accounts regularly in your profile.

---

## Troubleshooting

- I can’t log in
    - Verify your internet connection.
    - Confirm you’re using the correct environment (https://studio.aiforged.com vs any internal/beta URLs).
    - If you deployed AIForged on‑premises, use your internal Studio URL.
- Network access issues (enterprise networks)
    - Ask your network admin to allow outbound access to your AIForged Service Endpoint URL (visible in Studio → Settings).
- I forgot my password
    - Use [Forgot Password](forgot-password.md) to reset.
- MFA problems
    - Ensure your device time is set to automatic and in sync; then retry.
    - If still blocked, contact your Tenant administrator to reset MFA.
- I can sign in but can’t see my team’s agents/services
    - Switch to your company’s Tenant using the top‑right selector.
    - Confirm your role (Owner, Administrator, Developer) with your admin.
- External login fails
    - Make sure the external account is linked in your profile.
    - If you manage multiple work/personal identities, confirm you selected the intended account at the provider’s prompt.
- Still stuck?
    - Try a different browser or clear cache; then retry.
    - Contact your AIForged administrator or consultant for assistance.

---

## FAQ

- Can I change my password?
    - Yes. Use Forgot Password if you can’t sign in, or change it from your profile when signed in.
- Can multiple external providers be linked?
    - Yes. You can link more than one provider and choose any of them at sign‑in.
- Is MFA required?
    - MFA is strongly recommended and may be required by your organization’s policy.
- Why don’t I see my company’s Tenant?
    - Your company admin must add you as a member. Ask them to invite you to the correct Tenant.
- How do I sign out from all sessions?
    - Sign out in Studio, then revoke active sessions with your identity provider (for SSO). Your admin can also reset sessions if needed.

---

## Related links

- How to access AIForged: [Click Here](how-to-install-aiforged.md)
- Register (how new users get accounts): [Click Here](register.md)
- Activate my account: [Click Here](activate-my-account.md)
- Forgot Password: [Click Here](forgot-password.md)
- Multi‑Factor Authentication: [Click Here](multi-factor-authentication.md)
- User Profile: [Click Here](user-profile.md)
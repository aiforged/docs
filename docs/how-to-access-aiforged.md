# 📬 How to access AIForged

## Overview

AIForged Studio is where you configure agents and services, manage users and roles, and oversee wallets and billing. You can also access our REST APIs via Swagger for programmatic automation.

!!! tip
    No cloud-provider keys or regional setup required. AIForged is a unified single access layer—authenticate with your AIForged account and we take care of provider configuration behind the scenes.

---

## AIForged Studio

Use Studio for day‑to‑day configuration, operations, and monitoring.

- Production
    - https://studio.aiforged.com
    - Or your company’s internal Studio URL (if applicable)

- Beta and Dev builds
    - https://beta.studio.aiforged.com
    - Intended for early feature evaluation and testing only

!!! warning
    Beta/Dev builds are not production‑ready and should not be used to manage production agents. No liability is accepted for production use of Beta/Dev builds.

### Tenants and roles

Most users belong to a personal Tenant and to their company’s Tenant. Make sure you’re working in the correct Tenant so your roles (Owner, Administrator, Developer) apply when creating or configuring agents and services.

- Switch Tenant: In Studio, use the Tenant selector in the top‑right at any time.
- If options appear disabled, you may be in your personal Tenant—switch to your company Tenant and try again.

---

## API endpoints (Swagger/OpenAPI)

Access the AIForged REST APIs via Swagger:

- Production: https://portal.aiforged.com/swagger
- Dev: https://dev.aiforged.com/swagger
- Sandbox: https://sandbox.aiforged.com/swagger

Authentication
- Use your AIForged account to obtain an access token (OAuth/Bearer patterns).
- No provider‑specific keys are required—AIForged manages underlying services for you.

---

## Getting into your account

- New users
    - Register: [register.md](register.md)
    - Activate: [activate-my-account.md](activate-my-account.md)

- Existing users
    - Login: [login.md](login.md)
    - Multi‑Factor Authentication (recommended): [multi-factor-authentication.md](multi-factor-authentication.md)

- Can’t sign in?
    - Reset password: [forgot-password.md](forgot-password.md)

- Personalize your profile
    - Update your name, avatar, locale, and notifications: [user-profile.md](user-profile.md)

!!! tip
    Planning to configure services today? Confirm your role (Owner, Administrator, or Developer) in the target Tenant; these roles govern service administration.

---

## Troubleshooting access

- I can’t see my team’s agents or services
    - Switch to your company Tenant using the top‑right selector in Studio.

- I can’t add or configure services
    - Ask a Tenant admin to grant you the Owner, Administrator, or Developer role.

- MFA issues
    - Ensure your authenticator time is in sync and retry; if needed, contact your admin to reset MFA.

- Still stuck?
    - Try a different browser or clear cache; verify you’re on the right environment (Production vs Beta/Dev).
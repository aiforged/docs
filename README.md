# AIForged Documentation (MkDocs Material)

This repository contains the public AIForged documentation site built with MkDocs Material.

- Live preview locally with hot reload
- Clear authoring conventions (images, links, admonitions, tabs)
- One-command setup scripts for Windows, macOS, and Linux
- Strict builds to catch broken links and anchors

---

## Quick start (local preview)

Pick your platform:

### Windows (PowerShell)
1) Clone the repo:
   - git clone https://github.com/aiforged/docs.git
   - cd <repo>
2) Start the docs server:
   - Double-click Start-Docs-Server.cmd
   - Or run: .\scripts\dev.ps1 serve
3) Open http://127.0.0.1:8000 and start editing files under docs/. Changes auto-reload.

### macOS / Linux
1) Clone the repo:
   - git clone https://github.com/aiforged/docs.git
   - cd <repo>
2) Make the script executable (first time only):
   - chmod +x scripts/dev.sh
3) Start the docs server:
   - ./scripts/dev.sh serve
4) Open http://127.0.0.1:8000 and start editing files under docs/. Changes auto-reload.

Notes
- First run bootstraps a .venv, installs MkDocs + plugins, then starts the server.
- Use ./scripts/dev.sh build or .\scripts\dev.ps1 build for a strict build check (same as CI).

---

## Authoring basics

- All documentation lives under docs/.
- Section “home” pages must be named index.md (not README.md).
- Use kebab-case for file names, e.g., payment-methods.md.
- Use relative links and point directories to index.md (not trailing slashes):
  - Good: [Services](../services/index.md)
  - Avoid: ../services/ or README.md targets
- Prefer short sentences and one topic per page/section where possible.

### Images and assets
- Place all images under docs/assets/.
- Link with a relative path from your page:
  - ![](assets/example.png)
- If you paste images frequently, we recommend the VS Code “Paste Image” extension and add these settings (Workspace settings.json):
  ```json
  // .vscode/settings.json
  {
      "ipynb.pasteImagesAsAttachments.enabled": true,
      "pasteImage.basePath": "${projectRoot}",
      "pasteImage.path": "${projectRoot}/docs/assets",
      "pasteImage.forceUnixStyleSeparator": true,
      "pasteImage.insertPattern": "![](../../assets/${imageFileName})",
      "pasteImage.namePrefix": "img-",
      "pasteImage.filePathConfirmInputBoxMode": "onlyName",
      "pasteImage.pasteOnPaste": true,
  }
  ```

### Admonitions (tips, notes, warnings)
Use MkDocs Material admonitions:
```markdown
- !!! info "Optional title"
    Indented content (4 spaces)
- !!! warning
    Be careful with...
```

Important: Indent every content line under the !!! header with 4 spaces (1 tab).

### Tabs
Tabbed content example:
```markdown
- === "Tab A"
    Content for A
- === "Tab B"
    Content for B
```

Again, indent the tab body with 4 spaces (1 tab).

---

## Navigation (sidebar)

The navigation is defined in mkdocs.yml under nav:. To add a page, add an entry pointing to the file under docs/. Example:

```yaml
nav:
  - 📣 Release Notes: release-notes.md
  - 📃 Documents:
    - Overview: documents/index.md
    - Document Types: documents/documemt-types.md
```

YAML is indentation-sensitive:
- Use two spaces per indent.
- Quote titles that contain a colon (:) if you hit parsing errors.

---

## Theming

Material for MkDocs supports both built-in and custom themes.

Quick change (built-in colors) in mkdocs.yml:
```yaml
theme:
  palette:
    - scheme: slate
      primary: teal
      accent: indigo
    - scheme: default
      primary: teal
      accent: indigo
```

Custom brand colors via CSS:
1) Edit or create docs/assets/theme.css with your CSS variables:
```css
:root {
  --md-primary-fg-color: #0b6d53;
  --md-accent-fg-color: #ff6f00;
}
[data-md-color-scheme="slate"] {
  --md-primary-fg-color: #13a085;
  --md-accent-fg-color: #ff8f1a;
}
```
2) Reference it in mkdocs.yml:
```yaml
extra_css:
  - assets/theme.css
```

---

## Project scripts

We provide cross-platform scripts to avoid manual setup:

- Windows: .\scripts\dev.ps1 [setup|serve|build|clean]
  - Example: .\scripts\dev.ps1 serve
- macOS/Linux: ./scripts/dev.sh [setup|serve|build|clean]
  - Example: ./scripts/dev.sh serve
- Double-click launcher (Windows): Start-Docs-Server.cmd

What serve does:
- Creates/uses a local .venv
- Installs dependencies
- Starts mkdocs serve with live reload

---

## Build and deploy

Local strict build:
- Windows: .\scripts\dev.ps1 build
- macOS/Linux: ./scripts/dev.sh build

Continuous deployment:
- GitHub Actions builds the site and deploys to GitHub Pages (see .github/workflows/).
- On merge to main, CI publishes the site to the configured Pages branch.

---

## Repository structure

```yaml
- mkdocs.yml                # Site configuration (theme, nav, plugins)
- requirements.txt          # Pinned Python dependencies
- docs/
  - index.md                # Site home (Release notes)
  - assets/                 # Images and static assets
  - services/               # Section example (each with index.md)
  - ...                     # Other sections (see nav)
```

---

## Conventions and gotchas

- Use index.md for section landing pages (MkDocs doesn’t use README.md in subfolders).
- Encode spaces and parentheses in image file names if needed (editor/automation handles this).
- Avoid trailing slash markers (\ or /) at end of lines — these were GitBook soft-breaks.
- For directory links, always point to index.md:
  - Good: ../custom-service-code/index.md
- Anchors are case-insensitive but avoid trailing punctuation in the URL.
- Keep CI green by running a strict build locally: mkdocs build --strict.

---

## Optional: VS Code setup

Recommended extensions:
- Markdown All in One
- markdownlint
- YAML (Red Hat)
- Paste Image

We also provide tasks under .vscode/ (if present):
- Docs: Serve (MkDocs)
- Docs: Build (strict)

---

## Contributing workflow

1) Create a feature branch from main:
   - git checkout -b docs/my-change
2) Run local preview and edit:
   - Windows: .\scripts\dev.ps1 serve
   - macOS/Linux: ./scripts/dev.sh serve
3) Keep nav updated in mkdocs.yml if you add new pages.
4) Run a strict build before pushing:
   - mkdocs build --strict
5) Commit, push, and open a PR.

---

## Troubleshooting

- Python not found:
  - Install Python 3.10+ and ensure it’s on PATH (python or python3).
- PowerShell script blocked:
  - Start PowerShell as Administrator: Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
- Port in use:
  - mkdocs serve -a 127.0.0.1:8081
- YAML error “mapping values are not allowed here”:
  - Usually a colon in a title not quoted, or bad indentation in mkdocs.yml.
- Images not showing:
  - Confirm files exist under docs/assets and links are relative (assets/filename.png).

---

## License

Copyright © Larc Technologies (Pty) Ltd. All rights reserved.
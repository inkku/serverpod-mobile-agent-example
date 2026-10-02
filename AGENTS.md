# Agent instructions

Operate the development tools for the owner. Start with README.md, docs/TESTER_GUIDE.md and docs/VALIDATION.md. State the target environment and acceptance behavior. Preserve pending work and repository visibility.

Use `bash tool/control.sh` for setup, build, start, status, logs, preview and checks. Keep preview port 9995 private. The preview backend is this demo's isolated development database, never the original private product. Do not ask the phone user to type terminal commands.

Use Serverpod generation for models/endpoints and generated client/test tools. Create a migration for schema changes. Do not manually edit generated files. Run appropriate analysis/tests and rebuild the release Flutter preview after changes. Verify behavior in the browser, not just compilation.

The Launch button opens Cloud signup; it does not deploy. Obtain the intended existing account and explicit target project before invoking Cloud launch. Use the supported CLI authentication flow, and handle Codespaces localhost callbacks deliberately. Keep secret entry in the browser's secure auth flow. The owner handles account terms, credentials and billing decisions.

Report local checks, preview interaction, signup navigation, CLI authentication and deployment as separate milestones. Never invent a live-app URL, screenshot, successful command or one-click claim. Include encountered rough edges in the validation record.

Do not commit password files, runtime data, tokens, private project bindings or original product history. When publishing, audit the exact staged file list and content.

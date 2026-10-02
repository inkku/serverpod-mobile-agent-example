# Agent-operated walkthrough

These commands were exercised in an existing Codespace during packaging on 2026-10-02. The developer communicates through chat; the agent operates this terminal. The included fresh devcontainer recipe has not yet been rebuilt and verified.

From the repository root, the agent runs:

```sh
bash tool/control.sh setup
bash tool/control.sh build
bash tool/control.sh start
bash tool/control.sh status
bash tool/control.sh check
bash tool/control.sh preview
```

Setup installs the pinned Serverpod CLI, resolves the Flutter workspace and creates local secrets if absent. Build creates a release Flutter web app with the private preview API URL. Start runs the Serverpod development stack with migrations and the HTTP preview gateway. Status distinguishes running processes from a successfully rendered app. Check runs server analysis/integration tests and Flutter analysis. Preview prints the exact port-forwarded URL, or localhost outside Codespaces.

The agent opens the printed private URL and verifies the page and backend behavior. Local development verification codes are in the private server log. Use the secure authentication workflow for the owner; never include codes in issues or screenshots.

After changing server models or endpoints, the agent exercised:

```sh
cd rememberby_demo_server
serverpod generate
serverpod create-migration
dart analyze
dart test
```

Flutter changes need another release build before they appear. The Launch button was clicked in the rendered preview and opened `https://console.serverpod.dev/auth/signup`. It does not authenticate the CLI or start a deployment.

## Deployment boundary

`tool/control.sh launch` contains the supported `serverpod cloud launch` command. That script's completed deployment has **not** been exercised. The CLI's help was inspected, and an authentication attempt on the original private project timed out without a token. This release has no Cloud project binding. The agent must authenticate and confirm the intended project before continuing.

The standard generated Serverpod Flutter-build hook remains in the server pubspec. Cloud packaging, serving the deployed Flutter app and Cloud persistence must be verified with the tester's own project; no working deployed-app URL is supplied.

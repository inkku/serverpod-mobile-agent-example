# Preview first, launch when ready

The demo must let the developer use a running preview before choosing deployment. The agent operates the Codespace and tools; the developer can remain on a phone.

## Intended experience

1. Start the app and open its private Codespaces preview. Identify the backend and data environment before testing.
2. Offer **Launch to Serverpod Cloud** as a separate action.
3. For a new Cloud user, open https://console.serverpod.dev/auth/signup. Existing users choose Sign in and the account that owns their Cloud project.
4. The developer completes authentication and any account/terms steps. The agent resumes the supported CLI authentication flow, verifies the selected account and project, and launches only to that target.
5. Show a deployed app link only after deployment succeeds and the running app is verified. Opening signup alone is not deployment.

Do not require Cloud signup merely to inspect the Codespace preview. Do not silently deploy to an existing private or production project. The signup link alone does not provide the CLI with credentials; its authentication callback must also complete.

## Evidence and remaining work

On 2026-10-02 the Cloud console Sign up link was exercised in Cloud Browser and reached the Create an account screen at the URL above. No account was created and no terms were accepted.

The existing private project passed Flutter analysis and all five Flutter tests. The Cloud CLI requested authentication, then timed out without a token. Google authentication returned 502 Bad Gateway / Connection refused before account selection, including on one reload. Deployment did not start.

This document specifies the demo flow. The Launch UI was subsequently exercised as recorded below; completed CLI authentication and successful deployment remain unverified. Do not describe this as one-click deployment. Keep repository visibility, pending private work and secrets intact.

## Packaging update

The public demo now includes the Launch button. On 2026-10-02 it was clicked in the running private preview and opened the real Cloud signup URL in a new tab. Backend integration tests and analysis passed. Email signup on a real device, a fresh devcontainer boot and completed Cloud deployment remain tester tasks.

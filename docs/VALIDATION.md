# Validation record — 2026-10-02

This record separates the public example from the original private app. The example was generated independently with Serverpod 4.0.0; no private Git history or production credentials were imported. Flutter 3.44.4 / Dart 3.12.2 were installed in the existing Codespace.

| Check | Result |
| --- | --- |
| Generated Items API/client and migration | Passed |
| Server analysis | No issues found |
| Backend integration suite | All five tests passed |
| Persistence/order test | Passed: trimmed rows retrieved newest first |
| Account isolation test | Passed using authenticated test sessions |
| Anonymous access rejection | Passed for list and add |
| Empty/oversized input | Rejected |
| Flutter analysis | No issues found |
| Release web build | Passed, 79.2 seconds |
| Development server/migration | Running; migration applied |
| Private preview gateway | Running; app rendered in Cloud Browser |
| Launch button | Clicked in preview; opened real Cloud signup in new tab |
| Demo email signup and reload from a real device | Tester task; not yet exercised end to end |
| Fresh public-repo devcontainer boot | Tester task; not yet exercised |
| Completed Cloud deployment | Not verified |
| Native mobile app | Not tested |

Backend tests use Serverpod authenticated session overrides and a separate PostgreSQL test database. They establish endpoint behavior, not end-to-end email verification or token refresh. No Flutter widget tests are claimed. The generated empty widget-test placeholder was removed.

## Useful rough edges

1. The installed Serverpod 4 database API requires `t.id.desc()` for descending order; the older `orderDescending` find parameter failed generation. It was corrected and tests passed.
2. The unused generated Flutter driver dependency resolved as a non-SDK package and blocked dependencies. The unused driver entry point/dependency was removed; dependency resolution, analysis and web build then passed.
3. Google sign-in for the original private launch attempt returned **502 Bad Gateway / Connection refused** before account selection. One reload had the same result. The CLI never received an authentication token and deployment did not start. The Cloud signup page itself opened successfully.
4. Cloud CLI authentication uses a localhost callback on the development machine. An agent-controlled remote browser needs the corresponding private Codespaces route. Opening signup alone is not enough.

Screenshots should document the actual preview, actual Cloud signup and actual Google error. The preview screenshot shows a sign-up screen, not a logged-in or deployed application.

## Publication handoff

The original Codespace could not push to the separate public repository (403, repository-scoped Git credentials). The audited code source was uploaded through the existing GitHub browser session, then unpacked and published from a temporary Codespace attached only to the public repo. This avoided expanding the original private Codespace's Git permissions. The temporary workspace booted with GitHub's default image; that does not establish that the included Flutter devcontainer recipe has been exercised.

The generated Docker Compose file was removed because this demo uses Serverpod's local PostgreSQL dataPath. No Docker bootstrap passwords are included. The new CI workflow is intended to run the same setup, checks and web build; its remote result is recorded separately.

The article draft is withheld for owner review and is not part of this public release.

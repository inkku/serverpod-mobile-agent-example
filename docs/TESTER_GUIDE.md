# Try the commute test

Use your own fork or Codespace and development data. Do not ask for access to the original private project.

## From your phone

1. On the repository page, choose Code → Codespaces and create a Codespace. Allow time for the environment build. Fresh devcontainer startup has not yet been verified.
2. Give an agent browser/terminal access to the Codespace. Ask it to read AGENTS.md, start the app, run checks and open the port 9995 preview. Keep the port private.
3. Register a throwaway development email account. Local Serverpod writes the verification code to its private server log instead of emailing it. Have the agent assist through your secure sign-in flow; never post the code publicly.
4. Save two items, reload, and check that the newest is first. Sign out, sign back in, and confirm persistence.
5. Use a second test account and confirm that it cannot see the first account's items.
6. Ask for one small change, such as a text filter or due dates. Have the agent update generated code and migrations as needed, run checks, rebuild and show the preview.
7. Tap Launch to Serverpod Cloud. It should open Cloud signup in a new browser tab. Existing users choose Sign in with the account that owns their Cloud project. Merely opening this page does not deploy anything.
8. If you want to test actual deployment, explicitly name your own target project and authorize the agent to use it. Stop at any account terms or billing decision for the owner to complete. Verify the deployed app and persistence before calling launch successful.

## Send useful feedback

Open a tester-feedback issue with your device/browser, the step attempted, expected behavior, actual behavior and whether you used preview or Cloud. Include the commit tested and only redacted screenshots/log excerpts.

Especially useful: first Codespace boot, private forwarding on mobile, email verification, refresh/persistence, account isolation, Launch tab opening, CLI authentication callbacks and a completed Cloud deployment.

## Known gaps

- No published hosted app.
- No completed Cloud launch from this experiment. Google OAuth in the agent's Cloud Browser returned 502 before account selection. This does not establish that Google sign-in fails on your device.
- The Cloud CLI callback points to localhost in the development machine. An agent opening it in a remote browser must handle the private Codespaces callback route deliberately; signup alone does not authenticate the CLI.
- The release preview is rebuilt after Flutter changes. It is not hot reload.
- A Flutter web preview does not establish native-device behavior.
- This demo has no edit/delete reminders, production hardening, quotas or abuse controls. Use test data.

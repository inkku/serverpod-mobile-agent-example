# How the pieces fit

Flutter uses the generated Dart client and Serverpod JWT authentication. The Items endpoint requires login, derives ownership from the authenticated session, trims and bounds item text, and queries only the caller's rows. PostgreSQL stores the items. A client never chooses an owner ID for inserts.

The private Codespaces preview gateway serves the release Flutter build on port 9995 and forwards HTTP `/api/` traffic to the development API on 8280. The client is built with that same private HTTPS origin. This avoids cross-origin GitHub forwarding authentication. It is an HTTP preview gateway, not a WebSocket proxy or production reverse proxy.

Development PostgreSQL uses Serverpod's local dataPath and port 8290. Test PostgreSQL uses a separate dataPath and database. These are excluded from Git. Auth and password files are generated locally and excluded too.

Cloud signup is an external navigation from the demo UI. Deployment runs in the agent's development environment through the supported Cloud CLI after authentication and target selection. Do not add an endpoint that accepts Cloud credentials from the app.

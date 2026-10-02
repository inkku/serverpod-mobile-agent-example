#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
export PATH="$HOME/.local/state/Dart/install/bin:$HOME/.pub-cache/bin:/opt/flutter/bin:$PATH"
state=.runtime
mkdir -p "$state"
alive() { test -f "$state/$1.pid" && kill -0 "$(cat "$state/$1.pid")" 2>/dev/null; }
preview_url() {
  if test -n "${CODESPACE_NAME:-}"; then
    echo "https://$CODESPACE_NAME-9995.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN:-app.github.dev}/"
  else echo 'http://localhost:9995/'; fi
}
case "${1:-status}" in
  setup)
    flutter pub get
    dart pub global activate serverpod_cli 4.0.0
    dart tool/create_secrets.dart
    ;;
  build)
    url="$(preview_url)api/"
    (cd rememberby_demo_flutter && flutter build web --release --dart-define=SERVER_URL="$url")
    ;;
  start)
    dart tool/create_secrets.dart
    test -f rememberby_demo_flutter/build/web/index.html || bash tool/control.sh build
    if ! alive server; then
      (cd rememberby_demo_server && exec serverpod start --no-tui --no-flutter -- --apply-migrations) > "$state/server.log" 2>&1 & echo $! > "$state/server.pid"
    fi
    if ! alive preview; then
      dart tool/preview.dart > "$state/preview.log" 2>&1 & echo $! > "$state/preview.pid"
    fi
    preview_url
    ;;
  stop)
    for service in preview server; do
      if alive "$service"; then kill "$(cat "$state/$service.pid")"; fi
    done
    ;;
  restart) bash tool/control.sh stop; bash tool/control.sh build; bash tool/control.sh start ;;
  status)
    for service in server preview; do
      if alive "$service"; then echo "$service: running"; else echo "$service: stopped"; fi
    done
    preview_url
    ;;
  logs) tail -n 35 "$state/server.log" "$state/preview.log" ;;
  preview) preview_url ;;
  check)
    (cd rememberby_demo_server && dart analyze && dart test)
    (cd rememberby_demo_flutter && flutter analyze)
    ;;
  launch)
    echo 'Authenticate with the intended Cloud account and select your target project.'
    (cd rememberby_demo_server && serverpod cloud launch)
    ;;
  *) echo 'Usage: bash tool/control.sh setup|build|start|stop|restart|status|logs|preview|check|launch'; exit 2 ;;
esac

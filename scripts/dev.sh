#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/dev.sh [setup|serve|build|clean] [--no-browser]
TASK="${1:-serve}"
NO_BROWSER="${NO_BROWSER:-false}"
if [[ "${2:-}" == "--no-browser" ]]; then NO_BROWSER=true; fi

HOST="${HOST:-127.0.0.1}"
PORT="${PORT:-8000}"

# Move to repo root (parent of this script's folder)
cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."

python_cmd() {
  if command -v python3 >/dev/null 2>&1; then echo python3; else echo python; fi
}

ensure_venv() {
  if [ ! -d ".venv" ]; then
    "$(python_cmd)" -m venv .venv
  fi
}

use_venv() {
  # shellcheck disable=SC1091
  set +u
  source .venv/bin/activate
  set -u
}

ensure_requirements() {
  python -m pip install --upgrade pip
  if [ -f requirements.txt ]; then
    pip install -r requirements.txt
  else
    pip install mkdocs mkdocs-material
  fi
}

ensure_config() {
  if [ ! -f mkdocs.yml ]; then
    echo "Error: mkdocs.yml not found in $(pwd)" >&2
    exit 1
  fi
}

case "$TASK" in
  setup)
    ensure_venv
    use_venv
    ensure_requirements
    ensure_config
    echo "Setup complete."
    ;;

  serve)
    ensure_venv
    use_venv
    ensure_requirements
    ensure_config

    URL="http://${HOST}:${PORT}/"

    # Start server in background, capture PID (logs still print to this terminal)
    python -m mkdocs serve -a "${HOST}:${PORT}" &
    MKDOCS_PID=$!

    # Readiness probe: wait up to 120s for HTTP to respond
    deadline=$((SECONDS + 120))
    ready=0
    while [ $SECONDS -lt $deadline ]; do
      if command -v curl >/dev/null 2>&1; then
        if curl -sf -m 2 -H 'Cache-Control: no-cache' "$URL" >/dev/null; then
          ready=1; break
        fi
      elif command -v wget >/dev/null 2>&1; then
        if wget -q --timeout=2 --header='Cache-Control: no-cache' -O - "$URL" >/dev/null; then
          ready=1; break
        fi
      else
        # No curl/wget available; fallback to a short sleep
        sleep 1
      fi
      sleep 1
    done

    if [ $ready -eq 1 ]; then
      echo "MkDocs is up at $URL"
      if [ "$NO_BROWSER" != "true" ]; then
        if command -v xdg-open >/dev/null 2>&1; then xdg-open "$URL" >/dev/null 2>&1 || true; fi
        if command -v open >/dev/null 2>&1; then open "$URL" >/dev/null 2>&1 || true; fi
      fi
    else
      echo "Warning: MkDocs didn't become ready within 120s at $URL" >&2
    fi

    # Cleanly terminate background server on Ctrl+C
    trap 'kill $MKDOCS_PID 2>/dev/null || true; exit 0' INT TERM
    wait $MKDOCS_PID
    ;;

  build)
    ensure_venv
    use_venv
    ensure_requirements
    ensure_config
    python -m mkdocs build --strict
    echo "Site built in ./site"
    ;;

  clean)
    rm -rf site
    echo "Cleaned build output."
    ;;

  *)
    echo "Usage: $0 [setup|serve|build|clean] [--no-browser]"
    echo "Env: HOST=127.0.0.1 PORT=8000 NO_BROWSER=true"
    exit 1
    ;;
esac
#!/usr/bin/env bash
# Deploy des committeten HEAD auf das Vercel-Projekt ws-carrysolutions.
#
# Warum die temporäre Kopie: läuft die CLI im Git-Repo, hängt sie die Commit-
# Metadaten an, und der Hobby-Plan blockt den Deploy aus einem privaten Repo
# ("commit author doesn't have permission"). Ein git-freier Export von HEAD
# umgeht das, ohne die Git-Integration zu verbinden.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SCOPE="mrueb-8674s-projects"

if [ ! -f "$ROOT/.vercel/project.json" ]; then
  echo "Nicht verknüpft. Erst: vercel link --yes --project ws-carrysolutions --scope $SCOPE" >&2
  exit 1
fi
if [ -n "$(git -C "$ROOT" status --porcelain)" ]; then
  echo "Achtung: nicht committete Änderungen werden NICHT deployt (es geht HEAD raus)." >&2
fi

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

git -C "$ROOT" archive HEAD | tar -x -C "$TMP"
mkdir -p "$TMP/.vercel"
cp "$ROOT/.vercel/project.json" "$TMP/.vercel/project.json"

cd "$TMP"
vercel deploy --prod --yes --scope "$SCOPE"

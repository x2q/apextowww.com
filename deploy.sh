#!/usr/bin/env bash
# Deploy apextowww.com to Cloudflare Pages (project: apextowww).
#
# Stages production files into dist/ (excluding drafts, docs, and build
# inputs), then runs `wrangler pages deploy`. The site is a direct-upload
# Pages project — nothing deploys automatically on git push unless the
# GitHub Action in .github/workflows/deploy.yml runs this for you.
#
# Usage:
#   ./deploy.sh              stage + deploy (needs wrangler auth)
#   ./deploy.sh --stage-only stage into dist/ without deploying (used by CI)

set -euo pipefail
cd "$(dirname "$0")"

DIST=dist
ACCOUNT_ID=52fe7b63866613b05024e887e45da5e1
PROJECT=apextowww

rm -rf "$DIST"
mkdir -p "$DIST"

rsync -a \
  --exclude '.git' \
  --exclude '.github' \
  --exclude '.claude' \
  --exclude '.wrangler' \
  --exclude "$DIST" \
  --exclude 'node_modules' \
  --exclude '.DS_Store' \
  --exclude '.gitignore' \
  --exclude 'new.html' \
  --exclude 'new-v2.html' \
  --exclude 'DESIGN.md' \
  --exclude 'BACKLINK_SUBMISSIONS.md' \
  --exclude 'tailwind.input.css' \
  --exclude 'package.json' \
  --exclude 'package-lock.json' \
  --exclude 'deploy.sh' \
  ./ "$DIST/"

echo "Staged $(find "$DIST" -type f | wc -l | tr -d ' ') files into $DIST/"

if [[ "${1:-}" == "--stage-only" ]]; then
  exit 0
fi

CLOUDFLARE_ACCOUNT_ID="$ACCOUNT_ID" wrangler pages deploy "$DIST" \
  --project-name "$PROJECT" \
  --branch master

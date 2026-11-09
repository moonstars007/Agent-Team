#!/usr/bin/env bash
# Restore the project term DOMAIN.md after a skills update.
# Upstream mattpocock/skills uses GLOSSARY.md. This project uses DOMAIN.md.
# Run after `npx skills update` or `npx skills experimental_install --force`.

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skills_dir="$repo_root/.agents/skills"
domain_doc="$repo_root/docs/agents/domain.md"

mapfile -t files < <(grep -rl "GLOSSARY" "$skills_dir" "$domain_doc" 2>/dev/null || true)

if [[ ${#files[@]} -eq 0 ]]; then
  echo "already consistent: DOMAIN.md"
  exit 0
fi

for file in "${files[@]}"; do
  sed -i \
    -e 's/GLOSSARY-MAP\.md/DOMAIN-MAP.md/g' \
    -e 's/GLOSSARY\.md/DOMAIN.md/g' \
    -e 's/GLOSSARY-FORMAT/DOMAIN-FORMAT/g' \
    -e 's/GLOSSARY/DOMAIN/g' \
    "$file"
done

for dir in domain-modeling teach; do
  if [[ -f "$skills_dir/$dir/GLOSSARY-FORMAT.md" ]]; then
    mv "$skills_dir/$dir/GLOSSARY-FORMAT.md" "$skills_dir/$dir/DOMAIN-FORMAT.md"
  fi
done

node "$repo_root/scripts/sync-skills-lock.mjs" "$repo_root"

echo "replaced GLOSSARY with DOMAIN in ${#files[@]} file(s)"

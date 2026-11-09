#!/usr/bin/env bash
# Link the repository copy of the global writing rules into OpenCode.
# Run after cloning the repository or after moving it.

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source_file="$repo_root/docs/agents/writing-rules.md"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/opencode"
target="$config_dir/AGENTS.md"

if [[ ! -f "$source_file" ]]; then
  echo "missing source file: $source_file" >&2
  exit 1
fi

mkdir -p "$config_dir"

if [[ -L "$target" ]] && [[ "$(readlink -f "$target")" == "$(readlink -f "$source_file")" ]]; then
  echo "already linked: $target"
  exit 0
fi

if [[ -e "$target" && ! -L "$target" ]]; then
  backup="$target.backup.$(date +%Y%m%d-%H%M%S)"
  mv "$target" "$backup"
  echo "backed up existing file: $backup"
fi

ln -sfn "$source_file" "$target"
echo "linked: $target -> $source_file"

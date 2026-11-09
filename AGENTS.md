# Agent Team

Vendor-independent harness that runs cloud LLM/CLI agents through spec → isolated execution → independent verification → human-approved merge.

## Workspace

This repository is the design and implementation workspace for Agent Team itself.
A session here helps build the system; it does not automatically act as the future Worker or Architect.

Keep two kinds of instructions apart:

- instructions for working on this repository;
- instructions that the finished Harness will send to its own agents.

Treat the second kind as product content. Do not mix it with this file.

## Requirements

Project context, constraints, MVP scope and open questions: `docs/context/` — read the newest `Agent_Team_Context_v*.md` before planning or architecture changes.

## Technical notes

Tool behavior, setup steps, and workarounds: `docs/technical/` — read the note for a tool before troubleshooting it, and add a note after you resolve a non-obvious issue.

## Agent skills

Skills: `.agents/skills/` — read a skill's `SKILL.md` before use.

### Issue tracker

Issues live in GitHub Issues of `moonstars007/Agent-Team`; use `gh`. See `docs/agents/issue-tracker.md`.

### Triage labels

Standard labels: `needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`, `wontfix`. See `docs/agents/triage-labels.md`.

### Domain docs

Single-context layout: the domain glossary is `GLOSSARY.md` at the repo root; ADRs live in `docs/adr/`. See `docs/agents/domain.md`.

## Global writing rules

Canonical text: `docs/agents/writing-rules.md`.
The script `scripts/link-global-rules.sh` links this file to `~/.config/opencode/AGENTS.md`.
Run the script after cloning the repository or after moving it.
OpenCode loads the link as global rules in every session.

## Inbox

`Input/` is the intake queue; rules in `Input/README.md`.

## Sources

`Resources/` holds local source material: links, articles, docs, PDFs. It is not committed; rules in `Resources/README.md`.


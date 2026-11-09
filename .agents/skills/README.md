# Project skills

The 27 skill directories are copies of [mattpocock/skills](https://github.com/mattpocock/skills)
at commit `a496f5513d4a4cf889bc48e189e579f4b0bdf6aa` (committed 2026-10-29).
The upstream MIT license is in `LICENSE.mattpocock`.

## Runtime

Codex and OpenCode discover project skills in `.agents/skills`.
Claude Code needs a `.claude/skills` link to this folder; the project does not have one yet.

Root `AGENTS.md` and `docs/agents/` own the project rules.
A skill reaches them through a pointer line, not through a copy of the rule text.

## Adaptations

None. Every file matches upstream `a496f55` byte for byte.
The project glossary keeps the upstream name `GLOSSARY.md`.
The owner decided on 10 November 2026 to drop the earlier `DOMAIN.md` rename.

When a project rule and a skill differ, the project rule wins.
Record the rule in `docs/agents/` and add at most one pointer line to the skill.

## Lock file

`skills-lock.json` records the source path and a content hash for each skill.
Recompute the hashes after any edit:

```sh
node scripts/sync-skills-lock.mjs .
```

## Update

1. Update the copies with the `skills` CLI: `npx skills update`.
2. Compare each skill with upstream: `diff -r <upstream>/skills/<group>/<skill> .agents/skills/<skill>`.
3. Recompute the lock file.
4. Update the commit in this file when the upstream revision changes.

## Missing skills

`ship` exists only in `KirillSachkov/ai-first-platform`; it is not upstream.
Upstream groups `deprecated`, `in-progress`, and `misc` are not installed.

# Skill naming: DOMAIN.md instead of GLOSSARY.md

The project calls its glossary `DOMAIN.md`.
Upstream `mattpocock/skills` renamed this file to `GLOSSARY.md`.
The project copies in `.agents/skills/` keep the project name.

## Cause

`npx skills update` installs upstream text without project changes.
A fresh install or a forced restore writes `GLOSSARY.md` and `GLOSSARY-MAP.md`.

## Workaround

Run the naming script after every skill install or update.

```sh
scripts/apply-domain-naming.sh
```

The script replaces the upstream names in `.agents/skills/` and
`docs/agents/domain.md`. It also renames `GLOSSARY-FORMAT.md` to
`DOMAIN-FORMAT.md` and recomputes `skills-lock.json`.

## Verification

No upstream name must remain.

```sh
grep -rn GLOSSARY .agents/skills docs/agents AGENTS.md
```

The command prints nothing when the naming is consistent.

## Limits

- The upstream name is `GLOSSARY.md`; a later update restores it. Run the script again.
- `npx skills check` can report updates while the project name differs from upstream.
- Do not run `npx skills update` without the script afterwards.

# Technical notes

This folder stores technical nuances: behavior, limits, and workarounds for
tools in the project.

## What belongs here

- observed tool behavior that is not obvious from documentation;
- setup steps that a new session must repeat;
- platform limits and their workarounds;
- verification commands and their expected output.

Do not store product requirements, design decisions, or task specifications here.
Use `docs/context/`, `docs/adr/`, and `docs/specs/` for those.

## Format

Create one Markdown file per topic.
Start the file with a short result statement.
Then give symptoms, cause, workaround, and verification.
Name the tool and its version when they matter.

## Index

- [opencode-global-rules.md](opencode-global-rules.md) — global rules loading, link dependency, and precedence limits.
- [agent-skills-naming.md](agent-skills-naming.md) — project keeps `DOMAIN.md` while upstream skills use `GLOSSARY.md`; run the naming script after updates.

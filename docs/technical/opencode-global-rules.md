# OpenCode global rules: technical limits

Global writing rules reach a session as instructions, not as a system prompt.
Three limits follow from this behavior.

## Rules load after the system prompt

Cause: OpenCode assembles context in a fixed order.
The order is: agent system prompt, Code Mode guidance, skill guidance, global
and project `AGENTS.md`, configured instructions, then environment context.

Consequence: a project file cannot replace the system prompt.
A project file can only add instructions with equal weight.
If two files conflict, OpenCode combines them and does not resolve the conflict.

Workaround: state priority explicitly in the rule text.
Use short directives that do not depend on file order.

## The link depends on the repository path

Cause: `~/.config/opencode/AGENTS.md` is a symbolic link.
The link points to `/home/kirill/projects/Agent-Team/docs/agents/writing-rules.md`.

Consequence: moving or renaming the repository breaks the link.
OpenCode then loads no global rules.

Workaround: run the script after every move.

```sh
scripts/link-global-rules.sh
```

Verification: the script prints `already linked` or `linked: <target> -> <source>`.

```sh
readlink -f ~/.config/opencode/AGENTS.md
```

## Coverage follows the global config location

Cause: OpenCode reads the global config from `$XDG_CONFIG_HOME/opencode` or
`~/.config/opencode`.

Consequence: a session under another user or another config directory does not
load these rules.

Workaround: run the script as the user who starts OpenCode, or set
`XDG_CONFIG_HOME` before the run.

Verification: the link exists in the active config directory.

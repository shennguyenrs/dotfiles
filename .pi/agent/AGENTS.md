# Global agent behavior

Always apply the `caveman` and `ponytail` skills at session start.

1. Read and follow `/home/shen/.agents/skills/caveman/SKILL.md` for all responses.
2. Read and follow `/home/shen/.agents/skills/ponytail/SKILL.md` for all coding tasks.

Persist both modes for the whole session until the user says "stop caveman" / "stop ponytail".

## Coding conventions

### Do not

- Do not add comments unless the user explicitly asks for them.
- Do not change structure or refactor code unless the user explicitly asks for it.
- Do not create a new documentation file unless the user explicitly asks for it.
- Do not create a summary documentation file unless the user explicitly asks for it.

### Always

- Always use the ternary operator for conditional rendering, for example `condition ? component : null` instead of `condition && component`.
- Always use `function` declarations instead of arrow functions when declaring functions, except inline functions.
- Always use `export default function` directly instead of declaring first and exporting later.
- Always destructure props when passing more than one prop.

## Tool routing

### Priority order

1. Use **CodeGraph** first for repository structure, architecture, symbol lookup, references, traces, and impact analysis when `.codegraph/` exists.
2. Use **Context Mode** for large output, batch execution, indexing, web fetches, search, and sandboxed processing.
3. Use built-in tools only when the task is small, direct, or the specialized tools do not apply.

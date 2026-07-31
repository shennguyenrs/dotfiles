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
3. Use Gemini built-in tools only when the task is small, direct, or the specialized tools do not apply.

### CodeGraph
- If the CodeGraph MCP server is available and the project contains a `.codegraph/` index, prefer CodeGraph tools first for:
  - Architecture questions
  - “How does X work?”
  - Symbol lookup
  - Dependency or call tracing
  - Impact analysis
  - “Where is X defined or referenced?”
- Use CodeGraph to answer these questions in a few focused tool calls before using broad file reads, grep, or recursive exploration.
- Do not re-derive codebase structure with many raw file reads when CodeGraph can answer it directly.
- If no `.codegraph/` index exists, suggest running `codegraph init -i`.
- Do not call `codegraph_explore` directly in the main session unless deep exploration is actually needed.
- If CodeGraph conflicts with raw assumptions, trust CodeGraph and the current repository state.

### Context Mode
- Context-mode MCP tools are available, and these routing rules are mandatory.
- Use Context Mode for:
  - Large command output
  - Large file or grep output
  - Web fetches and indexing
  - Bulk data processing
  - Searchable session-local context
- Context Mode is the execution and compaction layer, not the source of truth for repository structure when CodeGraph is available.

### Think in code
- For tasks that analyze, count, filter, compare, search, parse, or transform data, use `mcp__context-mode__ctx_execute(language, code)` instead of reading raw data into context.
- Output only the answer with `console.log()`.
- Program the analysis instead of manually reasoning over raw data in context.
- Use pure JavaScript with Node.js built-ins only, such as `fs`, `path`, and `child_process`.
- Use `try/catch` and handle `null` or `undefined` safely.
- One script should replace many low-value tool calls whenever possible.

### Blocked actions
- Do not use shell `curl` or `wget`; they are intercepted and blocked.
- Do not retry blocked commands.
- Use `mcp__context-mode__ctx_fetch_and_index(url, source)` or `mcp__context-mode__ctx_execute(language: "javascript", code: "const r = await fetch(...)")` instead.
- Do not use inline HTTP calls such as `fetch('http`, `requests.get(`, `requests.post(`, `http.get(`, or `http.request(` directly.
- These are intercepted and blocked as well.
- Use `mcp__context-mode__ctx_execute(language, code)` so that only stdout enters context.
- Do not use WebFetch or generic web browsing tools directly.
- Use `mcp__context-mode__ctx_fetch_and_index(url, source)` followed by `mcp__context-mode__ctx_search(queries)` instead.

### Redirected actions
- Use shell directly only for `git`, `mkdir`, `rm`, `mv`, `cd`, `ls`, `npm install`, and `pip install`.
- For shell tasks that may return more than 20 lines of output, use `mcp__context-mode__ctx_batch_execute(commands, queries)` or `mcp__context-mode__ctx_execute(language: "shell", code: "...")` instead.
- Use `read_file` when reading a file in order to edit it.
- If the goal is to analyze, explore, or summarize file contents, use `mcp__context-mode__ctx_execute_file(path, language, code)` instead.
- For large grep or search output, use `mcp__context-mode__ctx_execute(language: "shell", code: "grep ...")` in the sandbox.

### Tool selection order
1. **Code truth first:** If the task depends on repository structure, symbol references, architecture, or code flow, use CodeGraph when `.codegraph/` exists.
2. **Gather safely:** Use Context Mode to run commands, fetch content, and index large outputs without flooding context.
3. **Process in sandbox:** Use `mcp__context-mode__ctx_execute(...)` or `mcp__context-mode__ctx_execute_file(...)` for transformations, analysis, and summarization.
4. **Web safely:** Use `mcp__context-mode__ctx_fetch_and_index(...)` and then search the indexed content.
5. **Ask the user last:** Only ask the user for context after checking the repository and Context Mode session context.

### Parallel I/O
- For multi-URL fetches or multi-API calls, always include `concurrency: N` where `N` is between 1 and 8.
- Use `mcp__context-mode__ctx_batch_execute(commands: [3+ network commands], concurrency: 5)` for parallel network-style command batches.
- Use `mcp__context-mode__ctx_fetch_and_index(requests: [{url, source}, ...], concurrency: 5)` for batch URL fetching.
- Use concurrency 4 to 8 for I/O-bound work such as network calls or API queries.
- Keep concurrency at 1 for CPU-bound work such as tests, builds, and linting, or for commands that share state like ports, lock files, or same-repo writes.
- For GitHub API calls through `gh`, cap concurrency at 4 to reduce rate-limit risk.

### Output rules
- Write artifacts to files instead of inlining them in the conversation.
- Return the file path and a one-line description.
- Use descriptive source labels so later searches by source remain clear.

### Session continuity
- Skills, roles, and decisions persist for the entire session.
- Do not abandon them as the conversation grows.

### Resume rules
- On resume, check Context Mode search for recent session-local context, compaction summaries, constraints, and rejected approaches.
- Do not ask “what were we working on?” before checking available session context.
- If search returns nothing useful, proceed as a fresh session.
- If session context conflicts with the current repository state, trust the repository state.

### `ctx` commands
- `ctx stats`: Call the `stats` MCP tool and display the full output verbatim.
- `ctx doctor`: Call the `doctor` MCP tool, run the returned shell command, and display the result as a checklist.
- `ctx upgrade`: Call the `upgrade` MCP tool, run the returned shell command, and display the result as a checklist.
- `ctx purge`: Call the `purge` MCP tool with `confirm: true`; warn before wiping the knowledge base.
- After `/clear` or `/compact`, the knowledge base and session stats are preserved.
- Use `ctx purge` only when a full reset is required.

# Example Skill Workflow

## 技能路由 (Skill Routing)
This skill contains multiple sub-modules. Depending on the user's request, refer to the appropriate sub-skill file:

- **[LOGIN.md](./LOGIN.md)**: Use this for handling user authentication, logging in, and session management.
- **[SEND.md](./SEND.md)**: Use this for formatting and sending messages or data payloads.

*(If the user request falls outside these sub-modules, use the default workflow below.)*

---

## 适用场景 (Use Cases)
This default workflow demonstrates how to coordinate between `example-cli` and `example-model`.

## 输入要求 (Input Requirements)
A text file or a simple string.

## 可调用 CLI (Available CLIs)
- `example-cli`: Used for processing the text.
- `example-model`: Used for generating insights from the processed text.

## 工作流步骤 (Workflow Steps)
1. Read the input.
2. Call `example-cli` to format or inspect the input.
3. Pass the result to `example-model` to summarize or answer questions.
4. Output the final result.

## 输出格式 (Output Format)
Markdown string.

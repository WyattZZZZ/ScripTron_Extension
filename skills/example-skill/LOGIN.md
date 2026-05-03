# Login Sub-Skill Workflow

## 适用场景 (Use Cases)
Handling user authentication and session management.

## 输入要求 (Input Requirements)
User credentials (username/password or token).

## 工作流步骤 (Workflow Steps)
1. Prompt user for credentials if not provided.
2. Call `example-cli login` command.
3. Save the returned session token securely.

## 输出格式 (Output Format)
Success or failure status with session metadata.

# ScripTron Extensions Repository

[English](./README.md) | [中文](./README_zh.md)

Welcome to the ScripTron Extensions repository! This repository provides a collection of standardized plugins to empower the ScripTron application. All extensions are categorized into three core types based on their functionality: **Models**, **CLIs**, and **Skills**.

## 📁 Directory Structure & Extension Types

### 1. Models (`models/`)
Model Providers. They are essentially command-line tools specifically designed to handle model inference requests.
- **Specification**: Must include a `model.json` where `kind` is `"model"`.
- **Arguments**: Typically includes a `prompt` field to receive the model prompt.

### 2. CLIs (`clis/`)
Tool / Software Command Line Interfaces. Used to execute specific independent tasks, such as file operations, network requests, or data processing.
- **Specification**: Must include a `cli.json` where `kind` is `"tool"`.

### 3. Skills (`skills/`)
Skill Packages. Skills orchestrate workflows. Instead of implementing low-level code directly, they use Markdown files to organize logic, describing how to coordinate and invoke multiple CLIs and Models to complete complex tasks.
- **Specification**: Must include a `skill.json` where `kind` is `"skill"`, and explicitly list its dependencies in the `requires` field (`clis` and `models`).
- **Entry Point**: Usually a `SKILL.md` file detailing use cases, workflow steps, and sub-skill routing.

---

## 🛠 How to Build and Add a New Extension?

We provide a standardized integration specification for these three types of extensions. We highly recommend developers check out the provided example projects as a starting point:
- **CLI Example**: [`clis/example-cli`](./clis/example-cli/)
- **Model Example**: [`models/example-model`](./models/example-model/)
- **Skill Example**: [`skills/example-skill`](./skills/example-skill/)

Build steps:

1. **Create Directory**: Create a new directory under the corresponding category folder (e.g., `clis/my-new-tool`).
2. **Write Manifest**: Write the corresponding `.json` description file (including name, description, version, args schema, etc.).
3. **Provide Install Script (Recommended)**: Write an `install.sh` for one-click environment setup (e.g., `npm install` or `pip install`).
4. **Provide Run Entry Point**: Write a `run.sh` as the unified execution entry point, and point to it in the `command` field of the JSON manifest.
5. **Write Documentation**: Add a `README.md`, and for Skill-type extensions, write a detailed `SKILL.md`.

*Note: For multi-module Skills, you can configure routing links at the top of the main `SKILL.md` pointing to sub-module files like `LOGIN.md` in the same directory.*

---

## 🔄 Automated Registry
This project is configured with an automated GitHub Action workflow.
Whenever new changes are merged into the main branch, the system automatically scans the `clis`, `models`, and `skills` directories, aggregates their information, and generates global index files (`clis.json`, `models.json`, `skills.json`) in the root directory. The ScripTron application reads these global manifests to load the latest extension market.

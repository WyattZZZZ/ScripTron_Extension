# ScripTron Extensions Repository

[English](./README.md) | [中文](./README_zh.md)

欢迎来到 ScripTron 扩展仓库！本仓库旨在提供统一标准的插件集合，以便为 ScripTron 应用赋能。所有的扩展按照其功能被划分为三大核心类别：**Models**、**CLIs** 和 **Skills**。

## 📁 目录结构与扩展类型

### 1. Models (`models/`)
模型提供者 (Model Providers)。它们本质上也是命令行工具，但专门用于处理模型推理相关的请求。
- **配置规范**: 需要包含一个 `model.json`，其中 `kind` 必须为 `"model"`。
- **参数示例**: 通常包含 `prompt` 字段，用于接收模型提示词。

### 2. CLIs (`clis/`)
工具与软件命令行接口 (Tool / Software CLI)。用于执行具体的独立任务，例如文件操作、网络请求或数据处理。
- **配置规范**: 需要包含一个 `cli.json`，其中 `kind` 必须为 `"tool"`。

### 3. Skills (`skills/`)
技能包 (Skill Package)。Skills 是工作流的编排者，它们不直接实现底层代码，而是通过 Markdown 文件组织逻辑，描述如何协调和调用多个 CLIs 与 Models 来完成复杂的任务。
- **配置规范**: 需要包含一个 `skill.json`，其中 `kind` 必须为 `"skill"`，并且在 `requires` 字段中明确列出其依赖的 `clis` 和 `models`。
- **主入口**: 通常是一个 `SKILL.md` 文件，包含适用场景、工作流步骤以及子技能的路由设计。

---

## 🛠 如何构建和添加新的扩展？

我们为这三种扩展提供了一套标准化的接入规范。强烈建议开发者直接查看我们提供的示例项目作为参考起步：
- **CLI 示例**: [`clis/example-cli`](./clis/example-cli/)
- **Model 示例**: [`models/example-model`](./models/example-model/)
- **Skill 示例**: [`skills/example-skill`](./skills/example-skill/)

构建步骤：

1. **创建目录**: 在对应类别的文件夹下创建一个新目录（如 `clis/my-new-tool`）。
2. **编写 Manifest**: 编写相应的 `.json` 描述文件（包含名称、描述、版本、参数结构等）。
3. **提供安装脚本 (推荐)**: 编写 `install.sh` 以实现环境的一键安装（例如 `npm install` 或 `pip install`）。
4. **提供运行入口**: 编写 `run.sh` 作为程序的统一调用入口，并在 JSON 中的 `command` 字段指向该脚本。
5. **编写文档**: 添加 `README.md`，并在 Skills 类型的扩展中编写详细的 `SKILL.md`。

*注：对于多模块的 Skill，可以在主 `SKILL.md` 顶部配置路由链接，指向同目录下的如 `LOGIN.md` 等子模块文件。*

---

## 🔄 自动化注册表 (Registry)
本项目配置了自动化的 GitHub Action 工作流。
每当您有新的修改合并到主分支时，系统会自动遍历 `clis`、`models` 和 `skills` 目录，并将其信息汇总，在根目录下生成全局的索引文件（`clis.json`、`models.json`、`skills.json`）。ScripTron 应用将通过读取这些全局清单来加载最新的扩展市场。

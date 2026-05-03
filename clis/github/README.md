# GitHub CLI

Official ScripTron wrapper for the **GitHub CLI** (`gh`).

## 📌 Prerequisites
```bash
./install.sh
```

## 🔐 Authentication (OAuth)
```bash
./run.sh --action login
```
Prompts you to select "Login with a web browser" — displays a one-time code and opens your browser for OAuth.

## 💬 Usage
```bash
./run.sh --action run --input "pr list"
./run.sh --action run --input "issue create --title 'Bug' --body 'Details'"
```

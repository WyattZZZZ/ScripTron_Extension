# Feishu (Lark) CLI

Official ScripTron wrapper for the **Feishu/Lark CLI** by Larksuite (`@larksuite/cli`).

## 📌 Prerequisites
```bash
./install.sh
```

## 🔐 Authentication (OAuth)
```bash
./run.sh --action login
```
This opens a browser URL for Feishu OAuth. Credentials are saved to your OS keychain.

## 💬 Usage
```bash
./run.sh --action run --input "message send --chat-id xxx --text 'Hello'"
```

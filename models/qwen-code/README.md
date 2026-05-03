# Qwen Code Model Provider

This is a ScripTron Model Provider wrapper for the official **Alibaba Qwen (通义千问) CLI**.

## 📌 Prerequisites
This extension does not implement the API calls directly. Instead, it wraps the official CLI. Ensure you have the official CLI installed. You can use the provided install script:

```bash
./install.sh
```

## 🔐 Authentication (OAuth)
To use this model, you must first authenticate using the graphical OAuth login provided by the official CLI. ScripTron triggers this by calling the `login` action:

```bash
./run.sh --action login
```
This will open a browser window for you to log in.

## 💬 Usage
Once authenticated, ScripTron will use the `chat` action to send prompts:

```bash
./run.sh --action chat --prompt "Write a python function to reverse a string"
```

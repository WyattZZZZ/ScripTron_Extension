# Vercel CLI

Official ScripTron wrapper for the **Vercel CLI** (`vercel`).

## 📌 Prerequisites
```bash
./install.sh
```

## 🔐 Authentication (OAuth)
```bash
./run.sh --action login
```
Opens a browser for OAuth login with your Vercel account (GitHub, GitLab, or email).

## 💬 Usage
```bash
./run.sh --action run --input "deploy"
./run.sh --action run --input "ls"
./run.sh --action run --input "env pull"
```

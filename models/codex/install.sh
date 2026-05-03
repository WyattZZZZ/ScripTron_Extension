#!/bin/bash
# Install script for Codex CLI

echo "Installing Codex CLI dependencies..."
npm install -g @openai/codex
echo "Installation complete. Run './run.sh --action login' to authenticate."

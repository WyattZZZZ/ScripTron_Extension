#!/bin/bash
# Install script for Qwen Code CLI

echo "Installing Qwen CLI dependencies..."
npm install -g @qwen-code/qwen-code@latest
echo "Installation complete. Run './run.sh --action login' to authenticate."

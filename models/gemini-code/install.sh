#!/bin/bash
# Install script for Gemini Code CLI

echo "Installing Gemini CLI dependencies..."
npm install -g @google/gemini-cli
echo "Installation complete. Run './run.sh --action login' to authenticate."

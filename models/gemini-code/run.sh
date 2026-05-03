#!/bin/bash
# Run script for Gemini Code Model

ACTION=""
PROMPT=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --action) ACTION="$2"; shift ;;
        --prompt) PROMPT="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

if [ "$ACTION" == "login" ]; then
    echo "Initiating graphical OAuth login for Gemini..."
    gemini login
elif [ "$ACTION" == "chat" ]; then
    if [ -z "$PROMPT" ]; then
        echo "Error: --prompt is required for action 'chat'"
        exit 1
    fi
    echo "Sending prompt to Gemini Code..."
    gemini "$PROMPT"
else
    echo "Error: Invalid action. Use 'login' or 'chat'."
    exit 1
fi

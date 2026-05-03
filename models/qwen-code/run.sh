#!/bin/bash
# Run script for Qwen Code Model

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
    echo "Initiating graphical OAuth login for Qwen..."
    qwen auth
elif [ "$ACTION" == "chat" ]; then
    if [ -z "$PROMPT" ]; then
        echo "Error: --prompt is required for action 'chat'"
        exit 1
    fi
    echo "Sending prompt to Qwen Code..."
    qwen "$PROMPT"
else
    echo "Error: Invalid action. Use 'login' or 'chat'."
    exit 1
fi

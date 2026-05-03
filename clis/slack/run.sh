#!/bin/bash
# run.sh for Slack CLI

ACTION=""
INPUT=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --action) ACTION="$2"; shift ;;
        --input) INPUT="$2"; shift ;;
        *) echo "Unknown parameter: $1"; exit 1 ;;
    esac
    shift
done

if [ "$ACTION" == "login" ]; then
    echo "Initiating Slack OAuth login..."
    slack login
elif [ "$ACTION" == "run" ]; then
    slack $INPUT
else
    echo "Error: Use --action login or --action run --input '<slack command>'"
    exit 1
fi

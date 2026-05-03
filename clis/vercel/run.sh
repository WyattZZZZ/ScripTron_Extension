#!/bin/bash
# run.sh for Vercel CLI

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
    echo "Initiating Vercel OAuth login..."
    vercel login
elif [ "$ACTION" == "run" ]; then
    vercel $INPUT
else
    echo "Error: Use --action login or --action run --input '<vercel command>'"
    exit 1
fi

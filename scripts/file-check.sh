#!/bin/bash

REPO_DIR="$HOME/flask-nginx"
LOG_FILE="$HOME/flask-nginx/cron.log"
MAX_SIZE_MB=50

cd "$REPO_DIR" || exit 1

echo "----- CRON RUN: $(date) -----" >> "$LOG_FILE"

# Find files larger than 50MB
LARGE_FILES=$(find . -type f -size +${MAX_SIZE_MB}M)

if [ -n "$LARGE_FILES" ]; then
    echo "Large files detected:" >> "$LOG_FILE"
    echo "$LARGE_FILES" >> "$LOG_FILE"

    # Check for files larger than 2GB
    HUGE_FILES=$(find . -type f -size +2000M)

    if [ -n "$HUGE_FILES" ]; then
        echo "ERROR: Files larger than 2GB detected. Cleanup needed." >> "$LOG_FILE"
        echo "$HUGE_FILES" >> "$LOG_FILE"
        exit 1
    fi
else
    echo "No large files found. Committing safe files." >> "$LOG_FILE"

    git add .
    git commit -m "Auto commit by CRON: $(date)" >> "$LOG_FILE" 2>&1
    git push origin main >> "$LOG_FILE" 2>&1
fi

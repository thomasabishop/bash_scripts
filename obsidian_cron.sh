#!/bin/bash

# If file changes exist in Obsidian directory, automate commit

OBSIDIAN_PATH="${HOME}/repos/computer-science"

cd "$OBSIDIAN_PATH"
git pull
CHANGES_EXIST="$(git status --porcelain | wc -l)"

if [ "$CHANGES_EXIST" -eq 0 ]; then
    exit 0
fi

git pull
git add .
git commit -q -m "Last Sync: $(date +"%Y-%m-%d %H:%M:%S")"
git push -q

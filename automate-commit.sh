#!/bin/bash
# If file changes exist in notetakeing directory, automate commit

NOTES_PATH="${HOME}/repos/computer-science"

cd "$NOTES_PATH"
git pull
CHANGES_EXIST="$(git status --porcelain | wc -l)"

if [ "$CHANGES_EXIST" -eq 0 ]; then
    exit 0
fi

git pull
git add .
git commit -q -m "Last Sync: $(date +"%Y-%m-%d %H:%M:%S")"
git push -q

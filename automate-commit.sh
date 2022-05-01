#!/bin/bash
# If file changes exist in notetakeing directory, automate commit

NOTES_PATH="${HOME}/repos/computer-science"
SPACE_2_UNDRSCR="${HOME}/bash_scripts/space-to-underscore-filename.sh"

# Remove spaces from file names
cd "$NOTES_PATH"
source ${SPACE_2_UNDRSCR}
git pull
CHANGES_EXIST="$(git status --porcelain | wc -l)"

if [ "$CHANGES_EXIST" -eq 0 ]; then
    exit 0
fi

git pull
git add .
git commit -q -m "Last Sync: $(date +"%Y-%m-%d %H:%M:%S")"
git push -q

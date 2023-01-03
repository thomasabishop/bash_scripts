#!/bin/bash
# If file changes exist in notetakeing directory, automate commit

NOTES_PATH="${HOME}/repos/computer_science"
SPACE_TO_UNDERSCORE="${HOME}/repos/bash_scripts/space_to_underscore_filename.sh"
CLEAN_IMAGE_DIRECTORY="${HOME}/repos/computer_science/_scripts/clean_image_directory.sh"

# Remove spaces from file names
cd "$NOTES_PATH"
source ${SPACE_TO_UNDERSCORE}
source ${CLEAN_IMAGE_DIRECTORY}
git pull
CHANGES_EXIST="$(git status --porcelain | wc -l)"

if [ "$CHANGES_EXIST" -eq 0 ]; then
    exit 0
fi

git pull
git add .
git commit -q -m "Autosave: $(date +"%Y-%m-%d %H:%M:%S")"
git push -q

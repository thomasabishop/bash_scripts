#!/bin/bash

# Convert spaces in file and directory names to underscore

LOG_DIR="${HOME}/bash_scripts/fake/.logs/"

main() {
    find . -depth -name '* *' | while read fname; do
        new_fname=$(echo $fname | tr " " "_")

        if [ -e $new_fname ]; then
            echo "File $new_fname already exists. Not replacing $fname"
        else
            echo "Creating new file $new_fname to replace $fname"
            mv "$fname" $new_fname
        fi
    done
}

# Run and pipe errors and feedback to logfile

&>/dev/null
main >"${LOG_DIR}fnames_log.txt" 2>&1

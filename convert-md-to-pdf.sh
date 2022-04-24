#!/bin/bash

#   Dependencies:
#       [Pandoc, TeXLive]

SPACE_2_UNDRSCR="./space-to-underscore-filename.sh"
SRC_DIR="${HOME}/repos/computer-science"
OUT_DIR="${HOME}/repos/computer-science/pdf/"
LOG_DIR="${HOME}/repos/computer-science/.logs/"

function convertMdToPdf() {
    NEW_FNAME="$(basename "${1%.*}")"
    pandoc $1 -o ${OUT_DIR}${NEW_FNAME}.pdf --pdf-engine=pdflatex --resource-path=:${SRC_DIR}/img
}

function purgeDir() {
    rm -rf $1
    mkdir $1
}

main() {
    purgeDir ${LOG_DIR}
    purgeDir ${OUT_DIR}
    # Remove spaces from file names
    source ${SPACE_2_UNDRSCR}

    # Recursively convert mds to pdfs
    for file in $SRC_DIR/*.md $SRC_DIR/**/*.md; do
        convertMdToPdf $file
    done
}

&>/dev/null
# Log
main >"${LOG_DIR}main_log.txt" 2>&1

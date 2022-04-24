#!/bin/bash

function instruct_yakuake {
    cmd="qdbus org.kde.yakuake $1"
    eval $cmd &>/dev/null
    sleep 0.5
}

instruct_yakuake "/yakuake/sessions org.kde.yakuake.splitTerminalLeftRight 0"
instruct_yakuake "/yakuake/sessions org.kde.yakuake.splitTerminalTopBottom 0"

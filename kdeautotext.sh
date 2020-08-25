#!/bin/bash


function read_klipper_text {
    qdbus org.kde.klipper /klipper org.kde.klipper.klipper.getClipboardContents
}

function get_template_from_action {
    test -e ~/.autotext.conf.json || (echo No ~/.autotext.conf.json found, exiting. 1>&2 && exit 1)
    echo $(cat ~/.autotext.conf.json | jq ".$1" | sed 's/"//g') 
}

function get_expanded_text {
    TEMPLATE=$(get_template_from_action $1)
    CLIP=$(read_klipper_text)
    echo $TEMPLATE | awk -v r="$CLIP" '{gsub(/___PLACEHOLDER___/,r)}1'
}

function set_klipper_text {
     qdbus org.kde.klipper /klipper org.kde.klipper.klipper.setClipboardContents "$@"
}

function main {    
    SHORTCUT=$(kdialog --inputbox "Enter shortcut name:")
    RESULT=$(get_expanded_text $SHORTCUT)
    RESULT=$(echo -ne "$RESULT")
    set_klipper_text "$RESULT"
    xdotool key --clearmodifiers "ctrl+v"; 
}

main

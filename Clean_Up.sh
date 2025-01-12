#!/bin/bash

echo " ____        _     _     _           _____   __  __ _                     "
echo "/ ___| _   _| |__ | |   (_)_ __ ___ |___ /  |  \/  (_)_ __ _ __ ___  _ __ "
echo "\___ \| | | | '_ \| |   | | '_ ` _ \  |_ \  | |\/| | | '__| '__/ _ \| '__|"
echo " ___) | |_| | |_) | |___| | | | | | |___) | | |  | | | |  | | | (_) | |   "
echo "|____/ \__,_|_.__/|_____|_|_| |_| |_|____/  |_|  |_|_|_|  |_|  \___/|_|   "

echo "*****************************************************************"
echo "**** Removing original_config.js from ~/MagicMirror/config/. ****"
echo "*****************************************************************"
sleep 5

if [ -f ~/MagicMirror/config/original_config.js ]; then
    rm -f ~/MagicMirror/config/original_config.js
    echo "***** The original_config.js has been removed. *****"
    sleep 5
else
    echo "File original_config.js not found in ~/MagicMirror/config/"
fi

echo "***************************************************************************************"
echo "** Removing original_compliments.js from ~/MagicMirror/modules/default/compliments/. **"
echo "***************************************************************************************"
sleep 5

if [ -f ~/MagicMirror/modules/default/compliments/original_compliments.js ]; then
    rm -f ~/MagicMirror/modules/default/compliments/original_compliments.js
    echo "The original_compliments.js has been removed."
else
    echo "File original_compliments.js not found in ~/MagicMirror/modules/default/compliments/"
fi

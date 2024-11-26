#!/bin/bash

echo -e "\e[0m"
echo                                              ____         ___       ___   __
echo   _____       _     __      _               |___ \       |   \     /   | |__|
echo  / ____|     | |   |  |    |_|                __| |      |    \   /    |  __   _______   _______   _______    _______
echo | (___  _   _| |__ |  |     _   __     __    |__  |      |     \ /     | |  | |   __  | |   __  | /   __  \  |   __  |
echo  \___ \| | | | '_ \|  |    | | /   \__/  \   |_   |      |  |\    /\   | |  | |  /  \_| |  /  \_| |  |  |  | |  /  \_|
echo  ____) | |_| | |_) |  |___ | | | /\    /\ |  __|  |      |  | \  /  |  | |  | |  |      |  |      |  |__|  | |  |
echo |_____/ \__,_|_.__/|_____| |_| |_| \_/  \_| |_____/      |__|  \/   |__| |__| |__|      |__|       \______/  |__|
echo -e "\e[0m"

# Rename compliments.js so the custom file can be added.
if [ -f ~/MagicMirror/modules/default/compliments/compliments.js ]; then
    mv -f ~/MagicMirror/modules/default/compliments/compliments.js ~/MagicMirror/modules/default/compliments/original_compliments.js
    echo "Default compliments.js has been archived."
else
    echo "File compliments.js not found in ~/MagicMirror/modules/default/compliments/"
fi

# Move compliments.js to the compliments folder.
if [ -f ~/SubLim3-MagicMirror/compliments.js ]; then
    mv -f ~/SubLim3-MagicMirror/compliments.js ~/MagicMirror/modules/default/compliments/compliments.js
    echo "SubLim3 compliments.js has been moved to the MagicMirror compliments module folder."
else
    echo "File compliments.js not found in ~/SubLim3-MagicMirror/"
fi

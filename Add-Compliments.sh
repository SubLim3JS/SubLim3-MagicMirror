#!/bin/bash

echo  ____        _     _     _           _____   __  __ _                     
echo / ___| _   _| |__ | |   (_)_ __ ___ |___ /  |  \/  (_)_ __ _ __ ___  _ __ 
echo \___ \| | | | '_ \| |   | | '_ ` _ \  |_ \  | |\/| | | '__| '__/ _ \| '__|
echo  ___) | |_| | |_) | |___| | | | | | |___) | | |  | | | |  | | | (_) | |   
echo |____/ \__,_|_.__/|_____|_|_| |_| |_|____/  |_|  |_|_|_|  |_|  \___/|_|   

# Rename compliments.js so the custom file can be added.
if [ -f ~/MagicMirror/modules/default/compliments/compliments.js ]; then
    mv -f ~/MagicMirror/modules/default/compliments/compliments.js ~/MagicMirror/modules/default/compliments/original_compliments.js
    echo "Default compliments.js has been archived."
else
    echo "File compliments.js not found in ~/MagicMirror/modules/default/compliments/"
fi

# Move custom compliments.js to the compliments folder.
if [ -f ~/SubLim3-MagicMirror/compliments.js ]; then
    mv -f ~/SubLim3-MagicMirror/compliments.js ~/MagicMirror/modules/default/compliments/compliments.js
    echo "SubLim3 compliments.js has been moved to the MagicMirror compliments module folder."
else
    echo "File compliments.js not found in ~/SubLim3-MagicMirror/"
fi

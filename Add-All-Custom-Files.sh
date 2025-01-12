#!/bin/bash

echo " ____        _     _     _           _____   __  __ _                     "
echo "/ ___| _   _| |__ | |   (_)_ __ ___ |___ /  |  \/  (_)_ __ _ __ ___  _ __ "
echo "\___ \| | | | '_ \| |   | | '_ ` _ \  |_ \  | |\/| | | '__| '__/ _ \| '__|"
echo " ___) | |_| | |_) | |___| | | | | | |___) | | |  | | | |  | | | (_) | |   "
echo "|____/ \__,_|_.__/|_____|_|_| |_| |_|____/  |_|  |_|_|_|  |_|  \___/|_|   "
sleep 5

echo "*********************************************************"
echo "*** Rename config.js so the custom file can be added. ***"
echo "*********************************************************"
sleep 5

if [ -f ~/MagicMirror/config/config.js ]; then
    mv -f ~/MagicMirror/config/config.js ~/MagicMirror/config/original_config.js
    echo "Default config.js has been archived."
else
    echo "File config.js not found in ~/MagicMirror/config/"
fi

echo "***************************************************************"
echo "*** Move the SubLim3 custom config.js to the config folder. ***"
echo "***************************************************************"
sleep 5

if [ -f ~/SubLim3-MagicMirror/config.js ]; then
    cp -f ~/SubLim3-MagicMirror/config.js ~/MagicMirror/config/config.js
    echo "SubLim3 config.js has been moved to the MagicMirror config folder."
else
    echo "File SubLim3 config.js not found in ~/SubLim3-MagicMirror/"
fi

echo "**************************************************************"
echo "*** Rename compliments.js so the custom file can be added. ***"
echo "**************************************************************"
sleep 5

if [ -f ~/MagicMirror/modules/default/compliments/compliments.js ]; then
    mv -f ~/MagicMirror/modules/default/compliments/compliments.js ~/MagicMirror/modules/default/compliments/original_compliments.js
    echo "Default compliments.js has been archived."
else
    echo "File compliments.js not found in ~/MagicMirror/modules/default/compliments/"
fi

echo "********************************************************"
echo "**** Move compliments.js to the compliments folder. ****"
echo "********************************************************"
sleep 5

if [ -f ~/SubLim3-MagicMirror/compliments.js ]; then
    cp -f ~/SubLim3-MagicMirror/compliments.js ~/MagicMirror/modules/default/compliments/compliments.js
    echo "SubLim3 compliments.js has been moved to the MagicMirror compliments module folder."
else
    echo "File compliments.js not found in ~/SubLim3-MagicMirror/"
fi

echo "****************************************************"
echo "***  - All operations completed successfully.  - ***"
echo "****************************************************"
sleep 5

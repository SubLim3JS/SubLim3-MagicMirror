#!/bin/bash

printf "

   _____       __    __    _          _____    __  ____                     
  / ___/__  __/ /_  / /   (_)___ ___ |__  /   /  |/  (_)_____________  _____
  \__ \/ / / / __ \/ /   / / __ \`__ \ /_ <   / /|_/ / / ___/ ___/ __ \/ ___/
 ___/ / /_/ / /_/ / /___/ / / / / / /__/ /  / /  / / / /  / /  / /_/ / /    
/____/\__,_/_.___/_____/_/_/ /_/ /_/____/  /_/  /_/_/_/  /_/   \____/_/     


"

sleep 3

echo "**************************************************************"
echo "*** Rename compliments.js so the custom file can be added. ***"
echo "**************************************************************"
sleep 5

if [ -f ~/MagicMirror/modules/default/compliments/compliments.js ]; then
    cp -f ~/MagicMirror/modules/default/compliments/compliments.js ~/MagicMirror/modules/default/compliments/original_compliments.js
    printf ""
    echo "Default compliments.js has been archived."
    printf ""
else
    printf ""
    echo "File compliments.js not found in ~/MagicMirror/modules/default/compliments/"
    printf ""
fi

echo "*************************************************************"
echo "*** Move custom compliments.js to the compliments folder. ***"
echo "*************************************************************"
sleep 5

if [ -f ~/SubLim3-MagicMirror/compliments.js ]; then
    cp -f ~/SubLim3-MagicMirror/compliments.js ~/MagicMirror/modules/default/compliments/compliments.js
    printf ""
    echo "SubLim3 compliments.js has been moved to the MagicMirror compliments module folder."
    printf ""
else
    printf ""
    echo "File compliments.js not found in ~/SubLim3-MagicMirror/"
    printf ""
fi

echo "****************************************************"
echo "***  - All operations completed successfully.  - ***"
echo "****************************************************"
sleep 5

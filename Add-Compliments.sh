#!/bin/bash

printf "

   _____       __    __    _          _____    __  ____                     
  / ___/__  __/ /_  / /   (_)___ ___ |__  /   /  |/  (_)_____________  _____
  \__ \/ / / / __ \/ /   / / __ \`__ \ /_ <   / /|_/ / / ___/ ___/ __ \/ ___/
 ___/ / /_/ / /_/ / /___/ / / / / / /__/ /  / /  / / / /  / /  / /_/ / /    
/____/\__,_/_.___/_____/_/_/ /_/ /_/____/  /_/  /_/_/_/  /_/   \____/_/     


"

sleep 3

echo "**************************************************************\n"
echo "*** Rename compliments.js so the custom file can be added. ***\n"
echo "**************************************************************\n\n"
sleep 5

if [ -f ~/MagicMirror/modules/default/compliments/compliments.js ]; then
    cp -f ~/MagicMirror/modules/default/compliments/compliments.js ~/MagicMirror/modules/default/compliments/original_compliments.js
    printf ""
    echo " - Default compliments.js has been archived. - \n\n\n"
    printf ""
else
    printf ""
    echo " - File compliments.js not found in ~/MagicMirror/modules/default/compliments/ - \n\n\n"
    printf ""
fi

echo "*************************************************************\n"
echo "*** Move custom compliments.js to the compliments folder. ***\n"
echo "*************************************************************\n\n"
sleep 5

if [ -f ~/SubLim3-MagicMirror/compliments.js ]; then
    cp -f ~/SubLim3-MagicMirror/compliments.js ~/MagicMirror/modules/default/compliments/compliments.js
    printf ""
    echo " - SubLim3 compliments.js has been moved to the MagicMirror compliments module folder. - \n\n\n"
    printf ""
else
    printf ""
    echo " - File compliments.js not found in ~/SubLim3-MagicMirror/ - \n\n\n"
    printf ""
fi

echo "****************************************************\n"
echo "***  - All operations completed successfully.  - ***\n"
echo "****************************************************\n\n"

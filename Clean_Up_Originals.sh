#!/bin/bash

printf "

   _____       __    __    _          _____    __  ____                     
  / ___/__  __/ /_  / /   (_)___ ___ |__  /   /  |/  (_)_____________  _____
  \__ \/ / / / __ \/ /   / / __ \`__ \ /_ <   / /|_/ / / ___/ ___/ __ \/ ___/
 ___/ / /_/ / /_/ / /___/ / / / / / /__/ /  / /  / / / /  / /  / /_/ / /    
/____/\__,_/_.___/_____/_/_/ /_/ /_/____/  /_/  /_/_/_/  /_/   \____/_/     


"

sleep 3

printf "*****************************************************************\n"
printf "**** Removing original_config.js from ~/MagicMirror/config/. ****\n"
printf "*****************************************************************\n\n"

sleep 3

if [ -f ~/MagicMirror/config/original_config.js ]; then
    cp -f ~/MagicMirror/config/original_config.js
    printf ""
    printf " - The original_config.js has been removed.  - \n\n\n"
    printf ""
else
    printf ""
    printf " - File original_config.js not found in ~/MagicMirror/config/ - \n\n\n"
    printf ""
fi

sleep 3

printf "***************************************************************************************\n"
printf "** Removing original_compliments.js from ~/MagicMirror/modules/default/compliments/. **\n"
printf "***************************************************************************************\n"

sleep 3


if [ -f ~/MagicMirror/modules/default/compliments/original_compliments.js ]; then
    cp -f ~/MagicMirror/modules/default/compliments/original_compliments.js
    printf " - The original_compliments.js has been removed. - \n\n\n"
else
    printf " - File original_compliments.js not found in ~/MagicMirror/modules/default/compliments/ - \n\n\n"
fi

printf "****************************************************"
printf "***  - All operations completed successfully.  - ***"
printf "****************************************************"
printf ""
sleep 3

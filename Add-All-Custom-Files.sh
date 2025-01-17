#!/bin/bash

# Print the ASCII art
printf "   _____       __    __    _          _____    __  ____                     \n"
printf "  / ___/__  __/ /_  / /   (_)___ ___ |__  /   /  |/  (_)_____________  _____\n"
printf "  \\__ \\/ / / / __ \\/ /   / / __ \`__ \\ /_ <   / /|_/ / / ___/ ___/ __ \\/ ___/\n"
printf " ___/ / /_/ / /_/ / /___/ / / / / / /__/ /  / /  / / / /  / /  / /_/ / /    \n"
printf "/____/\\__,_/_.___/_____/_/_/ /_/ /_/____/  /_/  /_/_/_/  /_/   \\____/_/     \n\n\n"

sleep 5

# Print the first message block
printf "*********************************************************\n"
printf "*** Rename config.js so the custom file can be added. ***\n"
printf "*********************************************************\n\n\n"

sleep 5

# Check and move config.js
if [ -f ~/MagicMirror/config/config.js ]; then
    mv -f ~/MagicMirror/config/config.js ~/MagicMirror/config/original_config.js
    printf "Default config.js has been archived.\n"
else
    printf "File config.js not found in ~/MagicMirror/config/\n"
fi

printf "***************************************************************\n"
printf "*** Move the SubLim3 custom config.js to the config folder. ***\n"
printf "***************************************************************\n"

sleep 5

# Check and copy the custom config.js
if [ -f ~/SubLim3-MagicMirror/config.js ]; then
    cp -f ~/SubLim3-MagicMirror/config.js ~/MagicMirror/config/config.js
    printf "SubLim3 config.js has been moved to the MagicMirror config folder.\n"
else
    printf "File SubLim3 config.js not found in ~/SubLim3-MagicMirror/\n"
fi

printf "**************************************************************\n"
printf "*** Rename compliments.js so the custom file can be added. ***\n"
printf "**************************************************************\n"

sleep 5

# Check and move compliments.js
if [ -f ~/MagicMirror/modules/default/compliments/compliments.js ]; then
    mv -f ~/MagicMirror/modules/default/compliments/compliments.js ~/MagicMirror/modules/default/compliments/original_compliments.js
    printf "Default compliments.js has been archived.\n"
else
    printf "File compliments.js not found in ~/MagicMirror/modules/default/compliments/\n"
fi

printf "********************************************************\n"
printf "**** Move compliments.js to the compliments folder. ****\n"
printf "********************************************************\n"

sleep 5

# Check and copy the custom compliments.js
if [ -f ~/SubLim3-MagicMirror/compliments.js ]; then
    cp -f ~/SubLim3-MagicMirror/compliments.js ~/MagicMirror/modules/default/compliments/compliments.js
    printf "SubLim3 compliments.js has been moved to the MagicMirror compliments module folder.\n"
else
    printf "File compliments.js not found in ~/SubLim3-MagicMirror/\n"
fi

printf "****************************************************\n"
printf "***  - All operations completed successfully.  - ***\n"
printf "****************************************************\n"

sleep 5

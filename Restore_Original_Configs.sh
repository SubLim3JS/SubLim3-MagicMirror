#!/bin/bash
printf "

   _____       __    __    _          _____    __  ____                     
  / ___/__  __/ /_  / /   (_)___ ___ |__  /   /  |/  (_)_____________  _____
  \__ \/ / / / __ \/ /   / / __ \`__ \ /_ <   / /|_/ / / ___/ ___/ __ \/ ___/
 ___/ / /_/ / /_/ / /___/ / / / / / /__/ /  / /  / / / /  / /  / /_/ / /    
/____/\__,_/_.___/_____/_/_/ /_/ /_/____/  /_/  /_/_/_/  /_/   \____/_/     



"

sleep 3

# Custom Compliments Prompt
while true; do
    echo "Do you want restore Compliments? (Y/n)"
    read answer
    answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

    if [[ "$answer" == "y" || "$answer" == "yes" ]]; then
        printf "\n\n"
        printf "**********************************************\n"
        printf "*** Restoring the original compliments.js. ***\n"
        printf "**********************************************\n\n"
        printf ""
        sleep 3

        if [ -f ~/MagicMirror/modules/default/compliments/original_compliments.js ]; then
            mv -f ~/MagicMirror/modules/default/compliments/original_compliments.js ~/MagicMirror/modules/default/compliments/compliments.js
            printf ""
            printf " - Default compliments.js has been restored. - \n\n"
            printf ""
        else
            printf ""
            printf " - File original_compliments.js not found in ~/MagicMirror/modules/default/compliments/ - \n\n"
            printf ""
        fi

        printf ""
        printf "************************************************\n"
        printf "***  - Compliments restored successfully.  - ***\n"
        printf "************************************************\n\n"
        printf ""
        sleep 3
        break
    elif [[ "$answer" == "n" || "$answer" == "no" ]]; then
        printf ""
        printf " - No changes have been made! - \n\n"
        printf ""
        break
    else
        printf ""
        printf "Invalid input, please enter Y or n."
        printf ""
    fi
done

# Custom Base Config Prompt
while true; do
    echo "Do you want restore the base config? (Y/n)"
    read answer
    answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
    printf "\n"

    if [[ "$answer" == "y" || "$answer" == "yes" ]]; then
        printf "\n\n"
        printf "*********************************************************\n"
        printf "*** Rename config.js so the custom file can be added. ***\n"
        printf "*********************************************************\n\n"
        printf ""
        sleep 3

        if [ -f ~/MagicMirror/config/config.js ]; then
            mv -f ~/MagicMirror/config/config.js ~/MagicMirror/config/original_config.js
            printf ""
            printf " - Default config.js has been archived. - \n\n"
            printf ""
        else
            printf ""
            printf " - File config.js not found in ~/MagicMirror/config/ - \n\n"
            printf ""
        fi

        printf ""
        printf "***************************************************************\n"
        printf "*** Move the SubLim3 custom config.js to the config folder. ***\n"
        printf "***************************************************************\n\n"
        printf ""
        sleep 3

        if [ -f ~/SubLim3-MagicMirror/config.js ]; then
            mv -f ~/SubLim3-MagicMirror/config.js ~/MagicMirror/config/config.js
            printf ""
            printf " - SubLim3 config.js has been moved to the MagicMirror config folder. - \n\n"
            printf ""
        else
            printf ""
            printf " - File SubLim3 config.js not found in ~/SubLim3-MagicMirror/ - \n\n"
            printf ""
        fi
        break
    elif [[ "$answer" == "n" || "$answer" == "no" ]]; then
        printf ""
        printf " - No changes have been made! - \n\n"
        printf ""
        break
    else
        printf ""
        printf " - Invalid input, please enter Y or n. - \n\n"
        printf ""
    fi
done

printf ""
printf "************************************\n"
printf "***  - Restorations Complete.  - ***\n"
printf "************************************\n\n"
printf ""
sleep 1

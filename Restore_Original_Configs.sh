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
        printf "\n"
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
        printf "****************************************\n"
        printf "*** - Compliments Script Complete. - ***\n"
        printf "****************************************\n\n"
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
    echo "Do you want restore the Base Config? (Y/n)"
    read answer
    answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

    if [[ "$answer" == "y" || "$answer" == "yes" ]]; then
        printf "\n"
        printf "*****************************************\n"
        printf "*** Restoring the original config.js. ***\n"
        printf "*****************************************\n\n"
        printf ""
        sleep 3

        if [ -f ~/MagicMirror/config/original_config.js ]; then
            mv -f ~/MagicMirror/config/original_config.js ~/MagicMirror/config/config.js
            printf ""
            printf " - Default config.js has been restored. - \n\n"
            printf ""
        else
            printf ""
            printf " - File original_config.js not found in ~/MagicMirror/config/original_config.js - \n\n"
            printf ""
        fi

        printf ""
        printf "****************************************\n"
        printf "*** - Compliments Script Complete. - ***\n"
        printf "****************************************\n\n"
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

printf ""
printf "************************************\n"
printf "***  - Config Script Complete. - ***\n"
printf "************************************\n\n"
printf ""
sleep 1

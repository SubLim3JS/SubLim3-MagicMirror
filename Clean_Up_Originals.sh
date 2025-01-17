
printf "

   _____       __    __    _          _____    __  ____                     
  / ___/__  __/ /_  / /   (_)___ ___ |__  /   /  |/  (_)_____________  _____
  \__ \/ / / / __ \/ /   / / __ \`__ \ /_ <   / /|_/ / / ___/ ___/ __ \/ ___/
 ___/ / /_/ / /_/ / /___/ / / / / / /__/ /  / /  / / / /  / /  / /_/ / /    
/____/\__,_/_.___/_____/_/_/ /_/ /_/____/  /_/  /_/_/_/  /_/   \____/_/     


"

sleep 3

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

echo "****************************************************"
echo "***  - All operations completed successfully.  - ***"
echo "****************************************************"
sleep 5

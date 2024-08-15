#!/bin/bash

# Remove original_config.js from ~/MagicMirror/config/.
if [ -f ~/MagicMirror/config/original_config.js ]; then
    rm -rf ~/MagicMirror/config/original_config.js
    echo "The original_config.js has been removed."
else
    echo "File original_config.js not found in ~/MagicMirror/config/"
fi

# Remove original_compliments.js from ~/MagicMirror/modules/default/compliments/.
if [ -f ~/MagicMirror/modules/default/compliments/original_compliments.js ]; then
    rm -rf ~/MagicMirror/modules/default/compliments/original_compliments.js
    echo "The compliments.js has been removed."
else
    echo "File original_compliments.js not found in ~/MagicMirror/modules/default/compliments/"
fi

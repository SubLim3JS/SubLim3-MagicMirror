#!/bin/bash

# Rename config.js so the custom file can be added.
if [ -f ~/MagicMirror/config/config.js ]; then
    mv -f ~/MagicMirror/config/config.js ~/MagicMirror/config/original_config.js
    echo "Default config.js has been archived."
else
    echo "File config.js not found in ~/MagicMirror/config/"
fi

# Move the SubLim3 custom config.js to the config folder.
if [ -f ~/SubLim3-MagicMirror/config.js ]; then
    mv -f ~/SubLim3-MagicMirror/config.js ~/MagicMirror/config/config.js
    echo "SubLim3 config.js has been moved to the MagicMirror config folder."
else
    echo "File SubLim3 config.js not found in ~/SubLim3-MagicMirror/"
fi

# Rename compliments.js so the custom file can be added.
if [ -f ~/MagicMirror/modules/default/compliments/compliments.js ]; then
    mv -f ~/MagicMirror/modules/default/compliments/compliments.js ~/MagicMirror/modules/default/compliments/original_compliments.js
    echo "Default compliments.js has been archived."
else
    echo "File compliments.js not found in ~/MagicMirror/modules/default/compliments/"
fi

# Move compliments.js to the compliments folder.
if [ -f ~/SubLim3-MagicMirror/compliments.js ]; then
    mv -f ~/SubLim3-MagicMirror/compliments.js ~/MagicMirror/modules/default/compliments/compliments.js
    echo "SubLim3 compliments.js has been moved to the MagicMirror compliments module folder."
else
    echo "File compliments.js not found in ~/SubLim3-MagicMirror/"
fi

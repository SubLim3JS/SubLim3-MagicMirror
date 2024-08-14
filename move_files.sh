#!/bin/bash

# Rename config.js so the custom file can be added.
mv -f ~/MagicMirror/config/config.js ~/MagicMirror/config/original_config.js

# Move the SubLim3 custom config.js to the config folder.
mv -f ~/SubLim3-MagicMirror/config.js ~/MagicMirror/config/config.js

# Rename config.js so the custom file can be added.
mv -f ~/MagicMirror/modules/default/compliments/compliments.js ~/MagicMirror/modules/default/compliments/original_compliments.js

# Move compliments.js to the compliments folder.
mv -f ~/SubLim3-MagicMirror/compliments.js ~/MagicMirror/modules/default/compliments/compliments.js

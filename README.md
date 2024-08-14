# MagicMirror
SubLim3 Magic Mirror Files - This will create a folder with SubLim3's custom configs. They will need to be moved to their respective folders within the 'modules' folders.

# Development Notes
This ties into the modules of a <a href="https://github.com/MichMich/MagicMirror">MagicMirror</a>

## Installation Code
````javascript
cd ~/MagicMirror/modules
````
````javascript
git clone https://github.com/SubLim3JS/MagicMirror
````

# Test
|Option | Description | Default Value |
|-------|-------------|---------------|
|triggerPin  | Trigger pin for both sensors. | `23` |
|echoLeftPin | Left sensor's echo pin. | `24` |
|leftDistance | Distance in cm that will initiate the movement detection with the left sensor. | `50` |
|rightDistance | Distance in cm that will initiate the movement detection with the right sensor. | `50` |

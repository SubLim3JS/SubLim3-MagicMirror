# MagicMirror
SubLim3 Magic Mirror Files - This will create a folder with SubLim3's custom configs. They will need to be moved to their respective folders within the 'modules' folders.

# Development Notes
This ties into the modules of a <a href="https://github.com/MichMich/MagicMirror">MagicMirror</a>

## Test Copy to Clipboard
````javascript
cd ~/MagicMirror
````

|Option | Description | Default Value |
|-------|-------------|---------------|
|triggerPin  | Trigger pin for both sensors. | `23` |
|echoLeftPin | Left sensor's echo pin. | `24` |
|echoRightPin | Right Sensor's Trigger pin. | `26` |
|leftDistance | Distance in cm that will initiate the movement detection with the left sensor. | `50` |
|rightDistance | Distance in cm that will initiate the movement detection with the right sensor. | `50` |
|maxDistance | Distance in cm. Every measurement higher than this will be ignored. | `200` |
|sampleInterval | Interval in `ms` for the sensors while no movement is detected. | `300` |

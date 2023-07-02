#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Move Window To Next Monitor
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🐣

# Documentation:
# @raycast.author u-ran
# @raycast.authorURL https://raycast.com/u-ran

# Execute AppleScript to check if the frontmost window is in full-screen mode
isFullScreen=$(osascript -e 'tell application "System Events" to get value of attribute "AXFullScreen" of window 1 of (first process whose frontmost is true)')

# Check the result and determine if the frontmost window is in full-screen mode
if [[ $isFullScreen == "true" ]]; then
  # Run the "Toggle Fullscreen" command
  osascript -e 'tell application "System Events" to keystroke "f" using {option down}' \
            -e 'delay 1'
fi

# Run the "Next Display" command
osascript -e 'tell application "System Events" to key code 124 using {option down, shift down}' \
          -e 'delay 0.5' \
          -e 'tell application "System Events" to keystroke "f" using {option down}' \
          -e 'delay 1'

# because built-in display is not considered as a display, we need to run the "Next Display" command again
isFullScreen=$(osascript -e 'tell application "System Events" to get value of attribute "AXFullScreen" of window 1 of (first process whose frontmost is true)')
if [[ $isFullScreen == "false" ]]; then
  osascript -e 'tell application "System Events" to key code 124 using {option down, shift down}' \
            -e 'delay 0.5' \
            -e 'tell application "System Events" to keystroke "f" using {option down}' \
            -e 'delay 1' \
            -e 'tell application "System Events" to keystroke return using {option down}'
fi

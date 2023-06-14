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
echo "isFullScreen: $isFullScreen"

# Check the result and determine if the frontmost window is in full-screen mode
if [[ $isFullScreen == "true" ]]; then
  # Run the "Toggle Fullscreen" command
  osascript -e 'tell application "System Events" to keystroke "f" using {option down}' \
            -e "delay 0.5"
fi

# Run the "Next Display" command
osascript -e 'tell application "System Events" to key code 124 using {option down, shift down}' \
          -e 'delay 0.2' \
          -e 'tell application "System Events" to keystroke "f" using {option down}'

#!/bin/bash

#########################################################
#----                                               ----#
#---- Utility script to take screenshot using maim  ----#
#---- The goal is to be able to interact with dunst ----#
#---- ,in order to send a notification, allowing    ----#
#---- the user to know the screenshot was taken and ----#
#---- to see a preview of the screenshot            ----#
#----                                               ----#
#########################################################

# Create screenshots directory if it doesn't exist
SCREENSHOT_DIR="$HOME/Images/Screenshots/"
mkdir -p "$SCREENSHOT_DIR"
# We temporary store the screenshots in order to show them in the notification.
TEMP_DIR="/tmp/"

# Generate unique filename with timestamp
FILETYPE="png"
# We don't add the filetype yet, because we will add a keyword between. This keyword will either be "all", "selected" or "active", depending on the type of screenshot made.
FILENAME="screenshot_$(date +'%Y-%m-%d_%H-%M-%S')_"


# Function to show notification
show_notification() {
    # The message to show in the notification. Specific to each function.
    local message="$1"
    # We expect to give the full path to the file in order to dunst to find it.
    local file="$2"
    
    # Send notification with image preview of the screenshot
    notify-send "Screenshot Taken !" "$message" -i "$file" -t 4000
}

#########################################################
#----                                               ----#
#---- Take screenshot of selected area to clipboard ----#
#----                                               ----#
#########################################################
# We use maim to take the screebshot. 
# The --select option allows us to select an area of the screen to capture.
# We pipe the output to xclip to copy it into the clipboard.
# And use the -o option to output the copied image to the standard output (see xclip manual) and then save it to a temporary file in order to show it in the notification.
# We use the ';' character to run two commands in the same time. We pipe the screenshot to xclip to copy it to the clipboard, and then we use xclip again to output the copied image to a temporary file. We need to proceed like this or else it simply doesn't work
# The -c 0.796,0.651,0.968 is simply to change the border color of the selection square. The color used if "Mauve" from "Catppuccin-Mocha" color palette
screenshot_selection_clipboard() {
    local file=${TEMP_DIR}${FILENAME}selected.${FILETYPE}

    maim --format=$FILETYPE -c 0.796,0.651,0.968 --select | xclip -selection clipboard -t image/png; xclip -selection clipboard -t image/png -o > $file 

    show_notification  "Selected area copied to clipboard" $file

    rm $file
    }

#########################################################
#----                                               ----#
#---- Take screenshot of selected area to file      ----#
#----                                               ----#
#########################################################
screenshot_selection_file() {
    local file=${SCREENSHOT_DIR}${FILENAME}selected.${FILETYPE}

    maim --format=$FILETYPE -c 0.796,0.651,0.968 --select $file

    show_notification "Selected area saved to ${SCREENSHOT_DIR}" $file
    }


#########################################################
#----                                               ----#
#---- Take screenshot of whole screen to clipboard  ----#
#----                                               ----#
#########################################################
screenshot_screen_clipboard() {
    local file=${TEMP_DIR}${FILENAME}all.${FILETYPE}

    maim --format=$FILETYPE | xclip -selection clipboard -t image/png; xclip -selection clipboard -t image/png -o > $file 

    show_notification  "Whole screen copied to clipboard" $file

    rm $file
    }

#########################################################
#----                                               ----#
#---- Take screenshot of whole screen to file       ----#
#----                                               ----#
#########################################################
screenshot_screen_file() {
    local file=${SCREENSHOT_DIR}${FILENAME}all.${FILETYPE}

    maim --format=$FILETYPE $file

    show_notification  "Whole screen saved to ${SCREENSHOT_DIR}" $file
    }

#########################################################
#----                                               ----#
#---- Take screenshot of active window to clipboard ----#
#----                                               ----#
#########################################################
screenshot_window_clipboard() {
    local file=${TEMP_DIR}${FILENAME}active.${FILETYPE}

    maim --format=$FILETYPE --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png; xclip -selection clipboard -t image/png -o > $file

    show_notification  "Active window copied to clipboard" $file

    rm $file
    }

#########################################################
#----                                               ----#
#---- Take screenshot of active window to file      ----#
#----                                               ----#
#########################################################
screenshot_window_file() {
    local file=${SCREENSHOT_DIR}${FILENAME}active.${FILETYPE}

    maim --format=$FILETYPE --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png; xclip -selection clipboard -t image/png -o > $file

    show_notification  "Active window saved to ${SCREENSHOT_DIR}" $file
    }

# Check arguments
case "$1" in
    "selection-clipboard")
        screenshot_selection_clipboard
        ;;
    "selection-file")
        screenshot_selection_file
        ;;
    "screen-clipboard")
        screenshot_screen_clipboard
        ;;
    "screen-file")
        screenshot_screen_file
        ;;
    "window-clipboard")
        screenshot_window_clipboard
        ;;
    "window-file")
        screenshot_window_file
        ;;
    *)
        echo "Usage: $0 {selection-clipboard|selection-file|screen-clipboard|screen-file|window-clipboard|window-file}"
        exit 1
        ;;
esac

exit 0

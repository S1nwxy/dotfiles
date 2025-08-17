#!/usr/bin/env bash


## Author  : Aditya Shakya (adi1090x)
## -> Initial Author of the rofi configuraton for the applet
## Github  : @adi1090x
## Applets : Screenshot

## Modified by Johann Plasse
## -> Author of the screenshot script in order to use custom config

# Import Current Theme
# source "$HOME"/.config/rofi/applets/shared/theme.bash
# theme="$type/$style"

theme="./style-1.rasi"

# Theme Elements
prompt='Screenshot'
mesg="DIR: `xdg-user-dir PICTURES`/Screenshots"

# list_col='5'
# list_row='1'
# win_width='500px'

# Options
option_1="󰆞  Select copy"
option_2="󰹑  Screen copy"
option_3="󰘔  App copy"
option_4="󰆞  Select save"
option_5="󰹑  Screen save"
option_6="󰘔  App save"

		# -theme-str "listview {columns: $list_col; lines: $list_row;}" \
# Rofi CMD
rofi_cmd() {
	rofi -theme-str 'textbox-prompt-colon {str: " ";}' \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

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

# # Check arguments
# case "$1" in
#     "selection-clipboard")
#         screenshot_selection_clipboard
#         ;;
#     "selection-file")
#         screenshot_selection_file
#         ;;
#     "screen-clipboard")
#         screenshot_screen_clipboard
#         ;;
#     "screen-file")
#         screenshot_screen_file
#         ;;
#     "window-clipboard")
#         screenshot_window_clipboard
#         ;;
#     "window-file")
#         screenshot_window_file
#         ;;
#     *)
#         echo "Usage: $0 {selection-clipboard|selection-file|screen-clipboard|screen-file|window-clipboard|window-file}"
#         exit 1
#         ;;
# esac
#
# exit 0

# # Screenshot
# time=`date +%Y-%m-%d-%H-%M-%S`
# geometry=`xrandr | grep 'current' | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current'`
# dir="`xdg-user-dir PICTURES`/Screenshots"
# file="Screenshot_${time}_${geometry}.png"
#
# if [[ ! -d "$dir" ]]; then
# 	mkdir -p "$dir"
# fi
#
# # notify and view screenshot
# notify_view() {
# 	notify_cmd_shot='dunstify -u low --replace=699'
# 	${notify_cmd_shot} "Copied to clipboard."
# 	viewnior ${dir}/"$file"
# 	if [[ -e "$dir/$file" ]]; then
# 		${notify_cmd_shot} "Screenshot Saved."
# 	else
# 		${notify_cmd_shot} "Screenshot Deleted."
# 	fi
# }
#
# # Copy screenshot to clipboard
# copy_shot () {
# 	tee "$file" | xclip -selection clipboard -t image/png
# }
#
# # countdown
# countdown () {
# 	for sec in `seq $1 -1 1`; do
# 		dunstify -t 1000 --replace=699 "Taking shot in : $sec"
# 		sleep 1
# 	done
# }
#
# # take shots
# shotnow () {
# 	cd ${dir} && sleep 0.5 && maim -u -f png | copy_shot
# 	notify_view
# }
#
# shot5 () {
# 	countdown '5'
# 	sleep 1 && cd ${dir} && maim -u -f png | copy_shot
# 	notify_view
# }
#
# shot10 () {
# 	countdown '10'
# 	sleep 1 && cd ${dir} && maim -u -f png | copy_shot
# 	notify_view
# }
#
# shotwin () {
# 	cd ${dir} && maim -u -f png -i `xdotool getactivewindow` | copy_shot
# 	notify_view
# }
#
# shotarea () {
# 	cd ${dir} && maim -u -f png -s -b 2 -c 0.35,0.55,0.85,0.25 -l | copy_shot
# 	notify_view
# }
#
# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
        screenshot_selection_clipboard
	elif [[ "$1" == '--opt2' ]]; then
        screenshot_screen_clipboard
	elif [[ "$1" == '--opt3' ]]; then
        screenshot_window_clipboard
	elif [[ "$1" == '--opt4' ]]; then
        screenshot_selection_file
	elif [[ "$1" == '--opt5' ]]; then
        screenshot_screen_file
	elif [[ "$1" == '--opt6' ]]; then
        screenshot_window_file
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
    $option_4)
		run_cmd --opt4
        ;;
    $option_5)
		run_cmd --opt5
        ;;
    $option_6)
		run_cmd --opt6
        ;;
esac

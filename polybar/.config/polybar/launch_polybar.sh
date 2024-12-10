#!/bin/bash
# if type "xrandr"; then
# #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
# #     MONITOR=$m polybar --reload main &
# #   done
#    polybar  -c "$HOME/dotfiles/polybar/.config/polybar/config.ini" --reload main  &
#    polybar  -c "$HOME/dotfiles/polybar/.config/polybar/config.ini" --reload sidebar & 
# else
#   polybar --reload main &
# fi
#

# killall -q polybar

# Wait until the processes have been shut down
# while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	if [ $m == 'eDP' ] 
	then		
		MONITOR=$m polybar -c "$HOME/dotfiles/polybar/.config/polybar/config.ini" --reload main  &
	elif [ $m == 'HDMI-A-0' ]
	then
		MONITOR=$m polybar -c "$HOME/dotfiles/polybar/.config/polybar/config.ini" --reload sidebar & 
	# else
		# MONITOR=$m polybar --reload sidebar-2-i3 -c ~/.config/polybar/config &
	fi     
      done
    else
    polybar --reload main &
    fi

#!/bin/sh

ALPHA='bb'
ALPHA2='bb'
BLUE='#89b4fa'
LAVENDER='#b4befe'
SAPPHIRE='#74c7ec'
SKY='#89dceb'
TEAL='#94e2d5'
GREEN='#a6e3a1'
YELLOW='#f9e2af'
PEACH='#fab387'
MAROON='#eba0ac'
RED='#f38ba8'
MAUVE='#cba6f7'
PINK='#f5c2e7'
PINK_LIGHT='#f7cbeb'
FLAMINGO='#f2cdcd'
ROSEWATER='#f5e0dc'
SURFACE0='#313244'
SURFACE1='#45475a'
SURFACE2='#585b70'
BASE='#1e1e2e'

swaylock                                                \
    -e -f                                               \
    -i /home/jplasse/.config/backgrounds/serenity.png   \
                                                        \
    --nofork                                            \
                                                        \
    --radius 105                                        \
                                                        \
    --inside-color=$BASE$ALPHA                          \
    --insidever-color=$LAVENDER$ALPHA                   \
    --insidewrong-color=$RED$ALPHA                      \
                                                        \
    --ring-color=$PINK$ALPHA                            \
    --ringver-color=$LAVENDER$ALPHA                     \
    --ringwrong-color=$RED$ALPHA                        \
                                                        \
    --line-color=$BASE$ALPHA                            \
                                                        \
    --keyhl-color=f5c2e7                                \
    --bshl-color=$RED$ALPHA                             \
    --separator-color=$BASE                             \
                                                        \
    --time-font="JetBrainsMono Nerd Font"               \
    --date-font="JetBrainsMono Nerd Font"               \
    --layout-font="JetBrainsMono Nerd Font"             \
    --verif-font="JetBrainsMono Nerd Font"              \
    --wrong-font="JetBrainsMono Nerd Font"              \
                                                        \
    --force-clock                                       \
    --time-str="%H:%M:%S"                               \
    --time-color=$PINK$ALPHA2                           \
    --time-size=40                                      \
    --time-pos="960:360"                                \
    --date-str="%A %m %Y"                               \
    --date-size=16                                      \
    --date-color=$PINK$ALPHA2                           \
                                                        \
    --pass-media-keys                                   \
    --pass-screen-keys                                  \
    --pass-volume-keys                                  &

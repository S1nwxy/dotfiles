#!/usr/bin/env bash

dir="."
theme='calculator'

## Run
rofi \
    -show calc \
    -modi calc \
    -no-show-match \
    -no-sort \
    -theme ${dir}/${theme}.rasi

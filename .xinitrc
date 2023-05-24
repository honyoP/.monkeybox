#!/usr/bin/env bash


xrandr --output DP-0 --mode 3440x1440 --rate 143.97

# This is a temp. setting for swapping caps to ctrl
setxkbmap -option "ctrl:swapcaps"

xrdb -merge ~/.Xresources

exec awesome

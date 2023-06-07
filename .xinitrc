#!/usr/bin/env bash


xrandr --output DP-0 --mode 3440x1440 --rate 143.97

xrdb -merge ~/.Xresources

exec awesome

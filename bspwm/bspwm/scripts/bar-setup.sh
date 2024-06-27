#! /usr/bin/env bash
#? needed for bspwm to avoid reload loop
#? https://www.reddit.com/r/bspwm/comments/pfh6de/polybar_restarting_and_terminating_cycle_and/
xrdb -merge $HOME/.cache/wal/colors.Xresources
wal -Re
~/.config/polybar/launch.sh
# ~/.config/i3/ibus-lang-color.sh 'color11'
gsettings set org.freedesktop.ibus.panel xkb-icon-rgba '#fff'

#! /bin/sh

sxhkd &
dunst &
picom &

killall -q polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --config=~/.config/polybar/alpine/config.ini alpine_top &
    MONITOR=$m polybar --config=~/.config/polybar/alpine/config.ini alpine_bottom &
done

# polybar --config=~/.config/polybar/alpine/config.ini alpine_top 2>&1 | tee -a ~/.config/polybar/alpine/top.log &
# polybar --config=~/.config/polybar/alpine/config.ini alpine_bottom 2>&1 | tee -a ~/.config/polybar/alpine/btm.log &

feh --bg-fill $HOME/Pictures/wallpapers/bg.jpg &

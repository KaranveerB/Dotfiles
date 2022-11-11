#!/bin/dash
# load zshenv. Needed for dwmblocks
#export PATH=/home/lost/local/bin/statusbar:$PATH # Set in .xsession (before dwmblocks starts)
#export PATH=/home/lost/.dwm/statusbar:$PATH # Fix android studio problems

# swap modkey
setxkbmap -option altwin:swap_alt_win &

sh .fehbg
#xwinwrap -ov -ni -fs -un -g 1920x1080+0+0 -- mpv ~/.wallpapers/snow_fall.mp4  --loop --no-audio --no-input-default-bindings -wid WID &
picom --daemon --experimental-backend --backend glx &

# start dwmblocks
#dwmblocks &

# lightdm locking
# light-locker --lock-on-suspend --lock-on-lid &
xset +dpms s 0 5 & # change back to 5 at some point or some other value
xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock &

deadd-notification-center &
# dunst

# my poor battery life
# pulseeffects --gapplication-service &> /dev/null &

# redshift
#redshift -l 49:-123 & 

# preferences 
xset r rate 450 60 &
pamixer --set-volume 0

unclutter --timeout 20 &

fcitx5 &> /dev/null &

# fix intellij/intellij derivaties
export _JAVA_AWT_WM_NONREPARENTING=1

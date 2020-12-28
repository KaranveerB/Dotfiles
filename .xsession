#!/bin/dash
# load zshenv. Needed for dwmblocks
export PATH=/home/lost/local/bin/statusbar:$PATH # Set in .xsession (before dwmblocks starts)
export PATH=/home/lost/.dwm/statusbar:$PATH # Fix android studio problems

sh .fehbg
picom --daemon --experimental-backend --backend glx &

# swap modkey
setxkbmap -option altwin:swap_alt_win &

# start dwmblocks
dwmblocks &

# lightdm locking
# light-locker --lock-on-suspend --lock-on-lid &
xss-lock -- lock &
xset dpms 600 &

deadd-notification-center &

# my poor battery life
# pulseeffects --gapplication-service &> /dev/null &


# preferences 
xset r rate 450 60 &
amixer -q set Master 0 && kill -35 $(pidof dwmblocks) &> /dev/null &


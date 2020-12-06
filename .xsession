#!/bin/dash

sh .fehbg
picom --daemon --experimental-backend --backend glx &

# swap modkey
setxkbmap -option altwin:swap_alt_win &

# start dwmblocks
export PATH=/home/lost/.dwm/statusbar:$PATH &
dwmblocks &

# lightdm locking
# light-locker --lock-on-suspend --lock-on-lid &
xss-lock -- lock &
xset dpms 600 &

deadd-notification-center &

# my poor battery life
# pulseeffects --gapplication-service &> /dev/null &


xset r rate 450 60

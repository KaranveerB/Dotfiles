#!/bin/dash
# load zshenv. Needed for dwmblocks
#export PATH=/home/lost/local/bin/statusbar:$PATH # Set in .xsession (before dwmblocks starts)
#export PATH=/home/lost/.dwm/statusbar:$PATH # Fix android studio problems

xrdb -merge ~/.Xresources

# swap modkey --- moved to keyd config
#setxkbmap -option altwin:swap_alt_win &

sh .fehbg
#xwinwrap -ov -ni -fs -un -g 1920x1080+0+0 -- mpv ~/.wallpapers/snow_fall.mp4  --loop --no-audio --no-input-default-bindings -wid WID &
picom --daemon --backend glx
#picom --daemon &

# start dwmblocks
#dwmblocks &

# lightdm locking
# light-locker --lock-on-suspend --lock-on-lid 
#xset s 300 300
xset +dpms
#dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 org.freedesktop.login1.Manager.GetSessionByPID uint32:$$ > /home/lost/README
#xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock > log 2>&1 &

xset s off
# TODO: This doesn't work well at all. Dimmer doesn't disappear when moving the mouse.
xidlehook --not-when-fullscreen --detect-sleep --not-when-audio --timer 480 '/usr/lib/xsecurelock/dimmer' 'killall dimmer' --timer 5 'xsecurelock' '' --timer 120 'systemctl suspend' '' &


deadd-notification-center &
# dunst

# my poor battery life
# pulseeffects --gapplication-service &> /dev/null &

# redshift
#redshift -l 49:-123 & 

# preferences 
xset r rate 450 60 # move to xorg config once they get their stuff together
# it doesn't't work anymore. idk why. maybe this will fix it?
sh -c "sleep 5; pamixer --set-volume 0;"

unclutter --timeout 20 &

fcitx5 &> /dev/null &

# fix intellij/intellij derivaties
export _JAVA_AWT_WM_NONREPARENTING=1

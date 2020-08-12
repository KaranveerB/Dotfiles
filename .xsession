#!/bin/dash

case "$GDMSESSION" in
	dwm)
		# Restore bg
		sh ~/.fehbg &

		# Swap modkey
		setxkbmap -option altwin:swap_alt_win
		
		# Start dwmblocks
		export PATH=/home/lost/.dwm/statusbar:$PATH
		dwmblocks &

		# Start picom
		picom --daemon --experimental-backend --backend glx

		# Start pulseeffects
		pulseeffects --gapplication-service &> /dev/null &

		;;
:'	xmonad)
		standard_config
		setxkbmap -option altwin:swap_alt_win
		;;
'
	esac

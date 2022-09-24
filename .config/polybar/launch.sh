#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Launch bar
echo "---" | tee -a /tmp/polybar1.log
polybar main >>/tmp/polybar1.log 2>&1 &

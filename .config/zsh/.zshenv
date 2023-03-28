export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/lib/jvm/default/bin:$PATH
export PATH=/usr/bin/site_perl:$PATH
export PATH=/usr/bin/vendor_perl:$PATH
export PATH=/usr/bin/core_perl:$PATH
export PATH=/var/lib/snapd/snap/bin:$PATH
export PATH=$HOME/.config/zsh/fzf/fzf/bin:$PATH
export PATH=$HOME/.dwm/statusbar:$PATH
export PATH=/opt/:$PATH
export PATH=$HOME/local/bin/statusbar:$PATH # Set in .xsession (before dwmblocks starts)
export PATH=$HOME/.dwm/statusbar:$PATH
export PATH=$HOME/fuchsia/.jiri_root/bin:$PATH

export JAVA_HOME="/usr/lib/jvm/default-runtime"
export npm_config_prefix="$HOME/.local"
export GPG_TTY=$(tty)

if [ $XDG_SESSION_TYPE = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

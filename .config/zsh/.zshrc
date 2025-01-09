[ -f "$ZDOTDIR/zshrc" ] && source "$ZDOTDIR/zshrc"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lost/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lost/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lost/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lost/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Setup fzf
# ---------

# if [[ ! "$PATH" == */home/lost/.fzf/bin* ]]; then
if [[ ! "$PATH" == *$HOME/.config/zsh/fzf/fzf/.fzf/bin* ]]; then
#   export PATH="${PATH:+${PATH}:}/home/lost/.fzf/bin"
  export PATH="${PATH:+${PATH}:}$HOME/.config/zsh/fzf/fzf/.fzf/bin"
fi

# Auto-completion
# ---------------

# [[ $- == *i* ]] && source "/home/lost/.fzf/shell/completion.zsh" 2> /dev/null
[[ $- == *i* ]] && source "$HOME/.config/zsh/fzf/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
# source "/home/lost/.fzf/shell/key-bindings.zsh"
source "$HOME/.config/zsh/fzf/fzf/shell/key-bindings.zsh"

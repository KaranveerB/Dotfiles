" Plugins (vim-plug)
call plug#begin('~/.local/share/nvim/site/plugged')

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Themes
Plug 'chriskempson/base16-vim'
Plug 'norcalli/nvim-colorizer.lua'
"Plug 'articicestudio/nord-vim'
Plug 'ghifarit53/tokyonight-vim'

" Better syntax highlighting
"Plug 'arakashic/chromatica.nvim'

" Shebang highlighting
Plug 'vitalk/vim-shebang'

" Hex color highlighting
Plug 'ap/vim-css-color'

" Fuzzy find
Plug '~/.config/zsh/fzf/fzf'

" Sudo vim (tmp sudo method)
Plug 'lambdalisue/suda.vim'

" Syntax highlighting
" 	polyglot causing problems with filetype detections
" Plug 'sheerun/vim-polyglot'
" Plug 'cespare/vim-toml'

call plug#end()

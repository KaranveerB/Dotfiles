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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Copilot
"Plug 'github/copilot.vim'

" local configs
Plug 'embear/vim-localvimrc'

" Indent detection
Plug 'tpope/vim-sleuth'

" Comments
Plug 'numToStr/Comment.nvim'

" Movement
Plug 'justinmk/vim-sneak'

" Files
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

Plug 'nvim-tree/nvim-tree.lua'

Plug 'elihunter173/dirbuf.nvim'


call plug#end()

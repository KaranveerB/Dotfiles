" Plugins (vim-plug) 
call plug#begin('~/.vim/pugged')

" Run :PlugInstall when done

" External color themes
Plug 'joshdick/onedark.vim'

" Hex color highlighting
Plug 'ap/vim-css-color'

" Fuzzy find
Plug '~/.config/zsh/fzf/fzf'


call plug#end()


" Mouse 
set mouse=a
set mousehide

" Line Numbering
set relativenumber
"set number

" Highlighting
syntax on

" Wrap
set breakindent

" Theme 
colorscheme onedark

highlight Normal guibg=NONE
highlight Normal ctermbg=NONE
highlight LineNr ctermfg=245

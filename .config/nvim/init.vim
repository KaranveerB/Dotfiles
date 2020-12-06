" Plugins (vim-plug) 
call plug#begin('~/.vim/pugged')
" Run :PlugInstall when done

" Better syntax highlighting
Plug 'arakashic/chromatica.nvim'

" Shebang highlighting
Plug 'vitalk/vim-shebang'
" External color themes
Plug 'joshdick/onedark.vim'

" Hex color highlighting
Plug 'ap/vim-css-color'

" Fuzzy find
Plug '~/.config/zsh/fzf/fzf'

" Suda vim (tmp sudo method)
Plug 'lambdalisue/suda.vim'

" Toml syntax highlighting
Plug 'cespare/vim-toml'

call plug#end()

" Mouse 
set mouse=r
set mousehide

" Lines 
set relativenumber
set number
set ruler

" Highlighting
syntax on 

AddShebangPattern! sh ^#![\ \t]*\/s\?bin\(\/env\)\?\/dash

" Wrap
set breakindent

" Theme 
" colorscheme onedark

highlight Normal guibg=NONE
highlight Normal ctermbg=NONE
highlight LineNr ctermfg=245

" Tabs
set tabstop=4
set shiftwidth=4

" nnoremap
" https://www.reddit.com/r/vim/comments/82sqoc/any_caveats_to_binding_j_and_k_to_gj_and_gk/
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" inoremap
inoremap <A-h> <C-O>h
inoremap <A-j> <C-O>gj
inoremap <A-k> <C-O>gk
inoremap <A-l> <C-O>l

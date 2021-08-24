let g:indentLine_enabled = 1
let g:indentLine_char_list = ['▏']

highlight EndOfBuffer ctermfg=black ctermbg=black

" line nums and its fg
highlight VertSplit cterm=NONE
set numberwidth=2
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

syntax on
syntax enable

set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

highlight! Normal guifg=NONE guibg=NONE

hi LineNr guibg=NONE
hi SignColumn guibg=NONE
hi VertSplit guibg=NONE

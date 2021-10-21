set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

let g:indentLine_enabled = 1
let g:indentLine_char_list = ['▏']

syntax on
syntax enable


highlight! Normal guifg=NONE guibg=NONE

hi LineNr guibg=NONE
hi SignColumn guibg=NONE
hi VertSplit guibg=NONE


highlight VertSplit cterm=NONE
set numberwidth=2
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight EndOfBuffer ctermfg=black ctermbg=black
highlight Comment guifg=#646d93

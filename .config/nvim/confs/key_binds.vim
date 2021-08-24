" change up/down movement to conditionally visual
" https://www.reddit.com/r/vim/comments/82sqoc/any_caveats_to_binding_j_and_k_to_gj_and_gk/
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" movement with mod4
inoremap <A-h> <C-O>h
inoremap <A-j> <C-O>gj
inoremap <A-k> <C-O>gk
inoremap <A-l> <C-O>l

" coc autocomplete
inoremap <expr> <Enter> pumvisible() ? coc#_select_confirm() : "<Enter>"

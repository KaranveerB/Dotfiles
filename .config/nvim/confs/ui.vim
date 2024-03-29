" UI
" format
norm! gg=G

" lines
set relativenumber
set number
set ruler
set breakindent
set wrap linebreak

" tabs
set showtabline=0  " show tabline
set guioptions-=e  " don't use GUI tabline
set tabstop=4
set shiftwidth=4

" treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  auto_install = true,
  highlight = {
    enable = true,
  },
}
EOF

" enable mouse
set mouse=a

" prevent vim from wiping system buffer
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" vim diff colors
hi DiffAdd      ctermfg=NONE          ctermbg=Green
hi DiffChange   ctermfg=NONE          ctermbg=NONE
hi DiffDelete   ctermfg=LightBlue     ctermbg=Red
hi DiffText     ctermfg=Yellow        ctermbg=Red

" backups
set backup
set backupdir=$HOME/.local/share/nvim/backup

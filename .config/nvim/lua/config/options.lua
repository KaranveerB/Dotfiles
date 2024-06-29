vim.g.mapleader = " "     

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 24 bit colors
vim.opt.termguicolors = true

-- Prevent wiping system buffer on exit
vim.api.nvim_create_autocmd("VimLeave", {
    command = "call system('xsel -ib', getreg('+'))"
})

-- backups
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("~/.local/share/nvim/backup")

-- line
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.breakindent = true
vim.opt.wrap = true
vim.opt.linebreak = true

-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- visual whitespace
vim.opt.list = true
vim.opt.listchars = {
    tab = '> ',
    lead = '·',
    trail = '·',
    nbsp = '␣'
}


vim.api.nvim_set_keymap('n', 'j', 'v:count1 == 1 ? "gj" : "j"', { expr = true, noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'v:count1 == 1 ? "gk" : "k"', { expr = true, noremap = true })

vim.api.nvim_set_keymap('i', '<C-h>', '<Left>',  {noremap = true})
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>',  {noremap = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>',    {noremap = true})
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', {noremap = true})

vim.api.nvim_set_keymap('n', 'j', 'v:count1 == 1 ? "gj" : "j"', { expr = true, noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'v:count1 == 1 ? "gk" : "k"', { expr = true, noremap = true })

vim.api.nvim_set_keymap('i', '<C-h>', '<Left>',  {noremap = true})
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>',  {noremap = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>',    {noremap = true})
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', {noremap = true})

--[[ this is done in a different way in lua/plugins/movement.lua
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h',  {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j',  {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k',  {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l',  {noremap = true})
--]]

vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>') 


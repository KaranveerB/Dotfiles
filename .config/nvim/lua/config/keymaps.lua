vim.api.nvim_set_keymap('n', 'j', 'v:count1 <= 5 ? "gj" : "j"', { expr = true, noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'v:count1 < 5 ? "gk" : "k"', { expr = true, noremap = true })

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

-- move line up/down (stolen from the primeagen)
-- explanation: https://youtu.be/MuUrCcvE-Yw?t=480
-- TODO: WRONG{
--vim.keymap.set('v', 'J', ':m >+1<CR>gv=gv')
--vim.keymap.set('v', 'K', ':m >-2<CR>gv=gv')
--

vim.keymap.set('i', '<C-BS>', '<C-W>')

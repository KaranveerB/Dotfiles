vim.keymap.set({ "n", "v" }, "j", 'v:count1 <= 5 ? "gj" : "j"', { expr = true, noremap = true })
vim.keymap.set({ "n", "v" }, "k", 'v:count1 < 5 ? "gk" : "k"', { expr = true, noremap = true })

vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true })

--[[ this is done in a different way in lua/plugins/movement.lua
vim.keymap.set('n', '<C-h>', '<C-w>h',  {noremap = true})
vim.keymap.set('n', '<C-j>', '<C-w>j',  {noremap = true})
vim.keymap.set('n', '<C-k>', '<C-w>k',  {noremap = true})
vim.keymap.set('n', '<C-l>', '<C-w>l',  {noremap = true})
--]]

-- Make C-BS work as expected
vim.keymap.set("i", "<C-BS>", "<C-W>", { noremap = true })

-- move line up/down (stolen from the primeagen)
-- explanation: https://youtu.be/MuUrCcvE-Yw?t=480
-- TODO: WRONG{
--vim.keymap.set('v', 'J', ':m >+1<CR>gv=gv')
--vim.keymap.set('v', 'K', ':m >-2<CR>gv=gv')

-- hide search highlight

vim.keymap.set('n', '<Esc>', function() vim.cmd.nohlsearch() end, { noremap = true })

-- quick fix list
---- TODO: Bind to a single key maybe, unless you like easy re-focus
---- TODO: Lua
vim.keymap.set('n', '<Leader>Q', function() vim.cmd("botright cclose") end, { noremap = true })
vim.keymap.set('n', '<Leader>q', function() vim.cmd("copen") end, { noremap = true })
---- TODO: Lua
vim.api.nvim_set_keymap('n', '<C-q>', ':cnext<CR>', { noremap = true })
---- TODO: not working?
vim.api.nvim_set_keymap('n', '<C-Shift-q>', ':cprev<CR>', { noremap = true })

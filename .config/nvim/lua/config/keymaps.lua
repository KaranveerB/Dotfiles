vim.keymap.set({'n', 'v'}, 'j', 'v:count1 <= 5 ? "gj" : "j"', { expr = true, noremap = true })
vim.keymap.set({'n', 'v'}, 'k', 'v:count1 < 5 ? "gk" : "k"', { expr = true, noremap = true })

vim.keymap.set('i', '<C-h>', '<Left>',  {noremap = true})
vim.keymap.set('i', '<C-j>', '<Down>',  {noremap = true})
vim.keymap.set('i', '<C-k>', '<Up>',    {noremap = true})
vim.keymap.set('i', '<C-l>', '<Right>', {noremap = true})

--[[ this is done in a different way in lua/plugins/movement.lua
vim.keymap.set('n', '<C-h>', '<C-w>h',  {noremap = true})
vim.keymap.set('n', '<C-j>', '<C-w>j',  {noremap = true})
vim.keymap.set('n', '<C-k>', '<C-w>k',  {noremap = true})
vim.keymap.set('n', '<C-l>', '<C-w>l',  {noremap = true})
--]]

-- Make C-BS work as expected
vim.keymap.set('i', '<C-BS>', '<C-W>', {noremap = true})

-- move line up/down (stolen from the primeagen)
-- explanation: https://youtu.be/MuUrCcvE-Yw?t=480
-- TODO: WRONG{
--vim.keymap.set('v', 'J', ':m >+1<CR>gv=gv')
--vim.keymap.set('v', 'K', ':m >-2<CR>gv=gv')
--

local function nvim_snippet_jump(direction, key)
  if vim.snippet.active({ direction = 1 }) then
    return '<cmd>lua vim.snippet.jump(' .. direction .. ')<cr>'
  else
    return key
  end
end

vim.keymap.set({'i', 's'}, '<CR>', function() return nvim_snippet_jump(1, '<CR>') end, { expr = true })
vim.keymap.set({'i', 's'}, '<S-CR>', function() return nvim_snippet_jump(-1, '<S-CR>') end, { expr = true })

local Event = require("lazy.core.handler.event")

--[[ -- syntatically works, semantically doesn't.
Event.mappings.NoBufTrig = { id = "NoBufTrig", event = "User", pattern = "NoBufTrig"}
Event.mappings["User NoBufTrig"] = Event.mappings.NoBufTrig

vim.api.nvim_exec_autocmds("User", { pattern = "NoBufTrig" })

vim.api.nvim_create_augroup('UserLazy', { clear = true })
vim.api.nvim_create_autocmd('User', {
  pattern = 'NoBufTrig',
  group = 'UserLazy',
  callback = function()
    print("NoBufTrig event fired!")
  end,
})

-- VimEnter autocmd
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    -- Your function logic here
    local shouldFireNoBufTrig = true -- or some condition
    if shouldFireNoBufTrig then
      vim.api.nvim_exec_autocmds('User', { pattern = 'NoBufTrig' })
    end
  end,
})
--]]

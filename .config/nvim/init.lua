require("config.options")
require("config.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("config.lazy-event")

lazy = require("lazy")
lazy.setup({
  spec = {
    { "LazyVim/LazyVim" },
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
    -- Recommend keeping false for now. Many plugins with semver have outdated
    -- release. At some point (maybe), `version = "*"` for latest stable.
    version = false,
  },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

vim.keymap.set("n", "<leader>lz", "<cmd>:Lazy<cr>")
vim.keymap.set("n", "<leader>lu", "<cmd>:Lazy update<cr>")
vim.keymap.set("n", "<leader>li", "<cmd>:Lazy install<cr>")

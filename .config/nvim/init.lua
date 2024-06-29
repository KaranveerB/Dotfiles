require("config.keymaps")
require("config.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
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
  install = { colorscheme = {'catppuccin'} },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  keys = {
    -- { '<leader>lz', '<cmd>:Lazy<cr>', dec = 'Open Lazy.nvim panel'} -- wrong
  },
})


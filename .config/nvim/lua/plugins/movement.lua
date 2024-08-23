return {
  {
    -- maybe use flash at some point?
    "ggandor/leap.nvim",
    enable = false,
    lazy = false, -- leap lazy loads itself
    dependencies = {
      "tpope/vim-repeat",
    },
    keys = {
      { "<CR>", "<Plug>(leap-forward)", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "<S-CR>", "<Plug>(leap-backward)", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "g<CR>", "<Plug>(leap-from-window)", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
      { "g<CR>", "<Plug>(leap-from-window)", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      local user = require("leap.user")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(false)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
      vim.keymap.del({ "n", "x", "o" }, "s")
      vim.keymap.del({ "n", "x", "o" }, "S")
      vim.keymap.del({ "n", "x", "o" }, "gs")
      --user.set_repeat_keys('<enter>', '<backspace>')
    end,
  },
  {
    "MunsMan/kitty-navigator.nvim",
    -- When moving from kitty window to nvim, the first split will be focused
    -- if the plugin isn't loaded. This isn't terrible, but I'd rather the
    -- proper split is focused, hence `VeryLazy`.
    event = "VeryLazy",
    build = function(plugin)
      local src = plugin.dir .. "/"
      local dst = "~/.config/kitty/"
      os.execute("mkdir -p " .. dst)
      os.execute("cp " .. src .. "*.py " .. dst)
    end,
    -- stylua: ignore
    keys = {
      { '<C-h>', function() require('kitty-navigator').navigateLeft() end, mode = {'n', 's'},  desc = 'Move left a vim/kitty split'},
      { '<C-j>', function() require('kitty-navigator').navigateDown() end,  mode = {'n', 's'},desc = 'Move down a vim/kitty split'},
      { '<C-k>', function() require('kitty-navigator').navigateUp() end, mode = {'n', 's'}, desc = 'Move up a vim/kitty split'},
      { '<C-l>', function() require('kitty-navigator').navigateRight() end, mode = {'n', 's'},desc = 'Move right a vim/kitty split'},
    }
,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      jump = {
        autojump = false, -- works oddly with multiple visible registers when on
      },
    },
    -- stylua: ignore
    keys = {
      { "<CR>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "<S-CR>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}

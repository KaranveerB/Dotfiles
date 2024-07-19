LazyVim = require("lazyvim.util")

return {
  {
    -- TODO: setup fzy
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>ff', function() require('telescope.builtin').find_files() end,
        desc = 'Find files (root dir)' },
      { '<leader>fg', function() require('telescope.builtin').live_grep() end,
        desc = 'Grep files (root dir)' },
      { '<leader>fG', function() require('telescope.builtin').live_grep({root = false}) end,
        desc = 'Grep files (cwd)' },
      { '<leader>fh', function() require('telescope.builtin').help_tags() end,
        desc = 'Find help' },
    },
  },
  {
    -- maybe consider nvim-telescope/telescope-file-browser.nvim
    'nvim-tree/nvim-tree.lua',
    -- event = "NoBufTrig", -- not working atm
    lazy = false, -- can be removed after NoBufTrig works properly
    opts = {
      view = {
        width = 30,
      },
      filters = {
        dotfiles = false,
      },
      hijack_cursor = true,
    },
    keys = {
      { '<C-n>', function() require('nvim-tree.api').tree.toggle() end,
        desc = 'Open nvim-tree' },
    },
    on_attach = {
      function()
        local api = require('nvim-tree.api')
        -- vim.keymap.set('n', 'l', api.node.open.preview()) -- wrong
      end
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end
  },
  {
    -- hex color highlighting
    'NvChad/nvim-colorizer.lua',
    event = 'BufRead',
    config = function()
      require 'colorizer'.setup()
    end
  },
  {
    'j-hui/fidget.nvim',
    lazy = false,
    opts = {
      progress = {
        display = {
          render_limit = 16,
        },
      },
      notification = {
        override_vim_notify = true,
      },
      integration = {
        ['nvim-tree'] = {
          enable = true,
        },
      }
    },
  },
  {
    'rcarriga/nvim-notify',
    enabled = false,
    opts = {
      stages = "static",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
    keys = {
      { '<leader>un', function() require('notify').dismiss({ silent = true, pending = false }) end,
        desc = 'Dismiss notifications' },
    },-- when noice is not enabled, install notify on VeryLazy
    init = function()
      if not LazyVim.has("noice.nvim") then
        LazyVim.on_very_lazy(function() vim.notify = require("notify") end)
      end
    end,
  },
  {
    'mbbill/undotree',
    keys = {
        {'<leader>ut', vim.cmd.UndotreeToggle }
    },
    config = function()
      vim.g.undotree_WindowLayout = 3 -- Right side
      vim.g.undotree_SplitWidth = 40
    end
  },
  {
    -- sudo read/write from nvim
    'lambdalisue/vim-suda',
    -- provides `:SudaRead` and `:SudaWrite
    event = "VeryLazy"
  },
  {
    'tyru/capture.vim',
    -- Provides `:Capture` that allows you to cpature the output of other :Ex commands into a buffer
    event = "VeryLazy",
  }
}

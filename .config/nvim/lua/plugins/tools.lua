return {
  { 
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>ff', function() require('telescope.builtin').find_files() end,
        desc = 'find files (root dir)' },
      { '<leader>fg', function() require('telescope.builtin').live_grep() end,
        desc = 'grep files (root dir)' },
      { '<leader>fG', function() require('telescope.builtin').live_grep({root = false}) end,
        desc = 'grep files (cwd)' },
      { '<leader>fh', function() require('telescope.builtin').help_tags() end,
        desc = 'find help' },
    },
  },
  {
    -- maybe consider nvim-telescope/telescope-file-browser.nvim
    'nvim-tree/nvim-tree.lua',
    -- event = "NoBufTrig", -- not working atm
    lazy = false, -- can be removed after NoBufTrig works properly
    config = {
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
        desc = 'open nvim-tree' },
    },
    on_attach = {
      function()
        local api = require('nvim-tree.api')
        -- vim.keymap.set('n', 'l', api.node.open.preview()) -- wrong
      end
    },
  },
  {
    -- hex color highlighting
    'NvChad/nvim-colorizer.lua',
    event = 'VeryLazy',
    config = function()
      require 'colorizer'.setup()
    end
  }
}

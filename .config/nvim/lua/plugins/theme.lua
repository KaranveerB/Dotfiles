return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      integrations = {
        aerial = false,
        alpha = false,
        cmp = true,
        dashboard = false,
        flash = false,
        gitsigns = false,
        headlines = false,
        illuminate = false,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = false,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = false, custom_bg = "lualine" },
        neotest = false,
        neotree = false,
        noice = false,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    config = function()
      vim.cmd('colorscheme catppuccin-mocha')
      -- Make bg color the same as kitty terminal's. Required for transparency.
      vim.cmd('highlight Normal guibg=#080B1A')
      vim.cmd('highlight NormalNC guibg=#080B1A')
    end,
  }
}

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
      vim.cmd.colorscheme("catppuccin-mocha")
      local mocha = require("catppuccin.palettes").get_palette "mocha"

      -- Make bg colour the same as kitty terminal's. Required for transparency.
      vim.api.nvim_set_hl(0, "Normal", { bg = "#080b1a" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "#080b1a" })

      -- Make inlay hints less distracting
      vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "black", fg = "#606060" })

      -- Make concealment replacements more visible
      vim.api.nvim_set_hl(0, 'Conceal', { fg = mocha.teal, bold = false })
      -- alt colour if conflicts: '#ff79c6?
    end,
  },
}

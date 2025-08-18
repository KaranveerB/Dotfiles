return {
  {
    "jay-babu/mason-null-ls.nvim",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-null-ls").setup({
        ensure_installed = {
          "stylua",
        },
        automatic_installation = false,
        handlers = {},
      })
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- Anything not supported by mason.
        },
      })
    end,
  },
}

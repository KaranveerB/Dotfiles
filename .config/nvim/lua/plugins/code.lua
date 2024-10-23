return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "haskell",
        "lua",
        "java",
        "javascript",
        "python",
        "rust",
        "sh",
      },
      sync_install = false, -- async install
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
  {
    "rightson/vim-p4-syntax",
    ft = "p4",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    config = {
      max_lines = 5,
      multiline_threshold = 2,
    },
  },
  {
    "mechatroner/rainbow_csv",
    event = "VeryLazy",
  },
}

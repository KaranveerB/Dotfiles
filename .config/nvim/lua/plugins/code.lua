return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufRead',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'haskell',
        'lua',
        'java',
        'javascript',
        'python',
        'rust',
        'sh',
      },
      sync_install = false, -- async install
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
  {
    'rightson/vim-p4-syntax',
    ft = 'p4',
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    lazy = 'VeryLazy',
  },
}

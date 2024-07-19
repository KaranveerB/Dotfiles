return {
  {
    -- heuristically set buffer options, like indents
    'tpope/vim-sleuth',
    event = 'BufReadPost',
  },
  {
    -- colourized brackets/delimiters
    'https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git',
    event = 'VeryLazy',
  },
  {
    -- indent guides
    'echasnovski/mini.indentscope',
    event = 'VeryLazy',
    opts = {
      draw = {
        delay = 0,
      },
    },
    config = function(_, opts)
        opts.draw.animation = require('mini.indentscope').gen_animation.none()
        require('mini.indentscope').setup(opts)
    end
  },
}

return {
  {
    'ggandor/leap.nvim',
    lazy = false, -- leap lazy loads itself
    dependencies = {
      'tpope/vim-repeat',
    },
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, desc = 'Leap Forward to' },
      { 'S', mode = { 'n', 'x', 'o' }, desc = 'Leap Backward to' },
      { 'gs', mode = { 'n', 'x', 'o' }, desc = 'Leap from Windows' },
    },
    config = function(_, opts)
      local leap = require('leap')
      local user = require('leap.user')
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ 'x', 'o' }, 'x')
      vim.keymap.del({ 'x', 'o' }, 'X')

      user.set_repeat_keys('<enter>', '<backspace>')
    end,
  },
  {
    'MunsMan/kitty-navigator.nvim',
    -- When moving from kitty window to nvim, the first split will be focused
    -- if the plugin isn't loaded. This isn't terrible, but I'd rather the
    -- proper split is focused, hence `VeryLazy`.
    event = 'VeryLazy',
    build = function(plugin)
      local src = plugin.dir .. '/'
      local dst = '~/.config/kitty/'
      os.execute('mkdir -p ' .. dst)
      os.execute('cp ' .. src .. '*.py ' .. dst)
    end,
    keys = {
      { '<C-h>', function() require('kitty-navigator').navigateLeft() end, desc = 'Move left a vim/kitty split'},
      { '<C-j>', function() require('kitty-navigator').navigateDown() end, desc = 'Move down a vim/kitty split'},
      { '<C-k>', function() require('kitty-navigator').navigateUp() end, desc = 'Move up a vim/kitty split'},
      { '<C-l>', function() require('kitty-navigator').navigateRight() end, desc = 'Move right a vim/kitty split'},
    }
  },
}

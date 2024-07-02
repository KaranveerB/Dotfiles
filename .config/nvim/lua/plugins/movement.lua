return {
  {
    'ggandor/leap.nvim',
    lazy = false, -- leap lazy loads itself
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, desc = 'Leap Forward to' },
      { 'S', mode = { 'n', 'x', 'o' }, desc = 'Leap Backward to' },
      { 'gs', mode = { 'n', 'x', 'o' }, desc = 'Leap from Windows' },
    },
    config = function(_, opts)
      local leap = require('leap')
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ 'x', 'o' }, 'x')
      vim.keymap.del({ 'x', 'o' }, 'X')
    end,
  },
  {
    'knubie/vim-kitty-navigator',
    lazy = false,
    keys = {
      { '<C-t>', mode = { 'n' }, '', desc = 'Nvim/Kitty navigate left' },
      { '<C-h>', mode = { 'n' }, '<cmd>:KittyNavigateLeft<CR>', desc = 'Nvim/Kitty navigate left' },
      { '<C-j>', mode = { 'n' }, '<cmd>:KittyNavigateDown<CR>', desc = 'Nvim/Kitty navigate left' },
      { '<C-k>', mode = { 'n' }, '<cmd>:KittyNavigateUp<CR>', desc = 'Nvim/Kitty navigate up' },
      { '<C-l>', mode = { 'n' }, '<cmd>:KittyNavigateRight<CR>', desc = 'Nvim/Kitty navigate right' },
    },
    config = function(plugin)
      local src = plugin.dir .. '/'
      local dst = '~/.config/kitty/kitten/vim-kitty-navigator/'
      os.execute('mkdir -p ' .. dst)
      os.execute('cp ' .. src .. '*.py ' .. dst)
    end,
    init = function()
      vim.g.kitty_navigator_no_mappings = 1
    end
  },
}

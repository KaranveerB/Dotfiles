return {
  {
    "lervag/vimtex",
    lazy = false, -- already lazy loaded
    -- README says to use init
    config = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_syntax_conceal = {
        math_super_sub = 0,
        accents = 1,
        greek = 1,
        styles = 1,
        math_fracs = 1,
        math_symbols = 1,
        spacing = 1,
        ligatures = 1,
        fancy = 1,
        sections = 1,
        math_delimiters = 1,
        math_bounds = 0,
        cites = 1,
      }
    end,
  },
}

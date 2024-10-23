-- vars
local snippets_dir = vim.fn.stdpath("config") .. "/snippets"

-- helpers
local utils = require("utils")

local function luasnip_jump(direction, key)
  if require("luasnip").jumpable(direction) then
    return "<cmd>lua require'luasnip'.jump(" .. direction .. ")<CR>"
  else
    return key
  end
end

-- load modules
local snippet_modules = utils.load_modules("snippets")
for name, snippet in pairs(snippet_modules) do
  if not snippet.add_snippets then
    LazyVim.error("add_snippets function missing in " .. name)
  end
end

-- config
return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      --"snippet-converter.nvim",
      "nvim-lspconfig",
      -- only nvim-cmp is needed, but avoid bludgeoning the lsp config load order.
      -- This may not be necessary.
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load({ paths = "./snippets/snipmate" })
      for _, mod in pairs(snippet_modules) do
        if mod.add_snippets then
          --mod.add_snippets()
        end
      end
    end,
  -- stylua: ignore
    keys = {
      { "<CR>", function() return luasnip_jump(1, "<CR>") end, expr = true, mode = { "i", "s" } },
      { "<S-CR>", function() return luasnip_jump(-1, "<S-CR>") end, mode = { "i", "s" } },
      -- some keys handled in cmp code in lsp.lua
    },
  },
  {
    -- TODO: Try based on https://github.com/smjonas/snippet-converter.nvim/issues/6 maybe?
    "smjonas/snippet-converter.nvim",
    enabled = false,
  },
}

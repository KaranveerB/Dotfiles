LazyVim = require("lazyvim.util")

local function cmp_map(cmp_func, luasnip_check, luasnip_func)
  return function()
    local cmp = require("cmp")
    if cmp.visible() then
      return cmp_func()
    elseif luasnip_check() then
      return luasnip_func()
    else
      return false
    end
  end
end

local f = require("utils").f

return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    build = ":MasonUpdate", -- doesn't actually update plugins unfortunately.
    config = function()
      local cmp = require("cmp")
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities =
          vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "lua_ls",
          "basedpyright",
          "ruff",
          "texlab",
          "rust_analyzer",
        },
        automatic_enable = {
          exclude = {
            "rust_analyzer",
          },
        },
        handlers = {
          function(server_name) -- default handler
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  format = {
                    -- using stylua
                    enable = false,
                  },
                  diagnostics = {
                    globals = { "cmp_select", "lazy", "vim" },
                  },
                },
              },
              inlay_hints = { enabled = true },
            })
          end,
          ["ruff"] = function() end,          -- joint with basedpyright
          ["basedpyright"] = function()
            -- use ruff
            require("lspconfig").ruff.setup({
              capabilities = capabilities,
            })
            require("lspconfig").basedpyright.setup({
              capabilities = capabilities,
              settings = {
                basedpyright = {
                  disableOrganizeImports = true, -- using ruff
                  analysis = {
                    typeCheckingMode = "standard",
                  },
                },
                python = {
                  analysis = {
                    ignore = { "*" }, -- using ruff
                    reportUnknownVariableType = false,
                  },
                },
              },
            })
          end,
          ["ts_ls"] = function()
            require("lspconfig").ts_ls.setup({
              -- Why is this default off!?!?!?
              settings = {
                typescript = {
                  inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                  },
                },
                javascript = {
                  inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                  },
                },
                completions = {
                  completeFunctionCalls = true,
                },
              },
            })
          end,
        },
      })

      local luasnip = require("luasnip")

      -- setup and config cmp
      cmp.setup({
        snippet = {
          expand = function(args)
            -- vim.snippet.expand(args.body) -- native neovim snippets
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-'>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<tab>"] = cmp.mapping.confirm({ select = true }), -- accept currently selected line
          ["<C-;>"] = cmp.mapping.confirm({ select = true }), -- accept currently selected line

          ["<C-p>"] = cmp_map(f(cmp.select_prev_item, cmp_select), f(luasnip.jumpable, -1), f(luasnip.jump, -1)),
          --["<C-p>"] = cmp.select_prev_item(cmp_select)),
          --["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-n>"] = cmp_map(f(cmp.select_next_item, cmp_select), f(luasnip.jumpable, 1), f(luasnip.jump, 1)),
        }),
      })

      vim.diagnostic.config({
        update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
    -- stylua: ignore
    keys = {
      { '<C-;>',      function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, desc = "Enable lsp inlay hints" },
      { '<leader>dh', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, desc = "Enable lsp inlay hints" },
      -- definition
      { '<leader>dd', function() vim.lsp.buf.definition() end,                                       { noremap = true },             desc = "Jump to definition" },
      -- implementation
      { '<leader>di', function() vim.lsp.buf.implementation() end,                                   { noremap = true },             desc = "Jump to implementation" },
      -- actions
      { '<leader>da', function() vim.lsp.buf.code_action() end,                                      { noremap = true },             desc = "Select a code action" },
      -- format
      { '<leader>dF', function() vim.lsp.buf.format() end,                                           { noremap = true },             mode = { "n", "v" },                         desc = "Format code" },
      -- select (hover)
      { '<leader>ds', function() vim.lsp.buf.hover() end,                                            { noremap = true },             desc = "Hover over symbol (x2 to jump into)" },
      -- float
      { '<leader>df', function() vim.diagnostic.open_float() end,                                    { noremap = true },             desc = "Open diagnostic float" },
      -- rename
      { '<leader>dr', function() vim.lsp.buf.rename() end,                                           { noremap = true },             desc = "Rename symbol" },
      -- diagnostic jumps
      { '[d',         function() vim.diagnostic.goto_prev() end,                                     { noremap = true },             desc = "Go to previous diagnostic" },
      { ']d',         function() vim.diagnostic.goto_next() end,                                     { noremap = true },             desc = "Go to next diagnostic", },
      -- references/usages
      { 'du',         function() vim.lsp.buf.references() end,                                       { noremap = true },             desc = "Find usages", },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    ft = "rust",
    opts = {
      server = {
        cmd = function()
          -- TODO: There isn't a strong reason to use mason's rust-analyzer.
          -- Maybe just use systems cus rust-analyzer comes with rustup anyways
          -- (on arch at least).
          local mason_registry = require("mason-registry")
          if mason_registry.is_installed("rust-analyzer") then
            return { vim.fn.exepath("rust-analyzer") }
          end
          -- Will likely get other scary errors before you see this, but whatever.
          LazyVim.error("**rust-analyzer** not found", { title = "rustaceanvim" })
        end,
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<localleader>gr", function()
            vim.cmd.RustLsp("debuggables")
          end, { desc = "Rust Debuggables", buffer = bufnr })
        end,
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              -- TODO: Capabilities
              loadOutDirsFromCheck = true,
              buildScripts = {
                enable = true,
              },
            },
            -- Add clippy lints for Rust.
            checkOnSave = true,
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    -- stylua: ignore
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",                        desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "Symbols (Trouble)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                            desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                             desc = "Quickfix List (Trouble)" },
    },
    opts = {},
  },
}

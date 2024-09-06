LazyVim = require("lazyvim.util")

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
          "ruff_lsp",
          "texlab",
          "rust_analyzer",
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
                    globals = { "lazy", "vim" },
                  },
                },
              },
              inlay_hints = { enabled = true },
            })
          end,
          ["rust_analyzer"] = function() end, -- handled by rustaceanvim
          ["ruff_lsp"] = function() end, -- joint with basedpyright
          ["basedpyright"] = function()
            -- use ruff_lsp
            require("lspconfig").ruff_lsp.setup({
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
        },
      })

      -- setup and config cmp
      cmp.setup({
        snippet = {
          expand = function(args)
            -- vim.snippet.expand(args.body) -- native neovim snippets
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
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
          ["<tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
          ["<C-;>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
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
      { '<leader>dh', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, desc = "Enable lsp inlay hints" },
      -- definition
      { '<leader>dd', function() vim.lsp.buf.definition() end, { noremap = true }, desc = "Jump to definition" },
      -- actions
      { '<leader>da', function() vim.lsp.buf.code_action() end, { noremap = true }, desc = "Select a code action" },
      -- format
      { '<leader>dF', function() vim.lsp.buf.format() end, { noremap = true }, desc = "Format code" },
      -- select (hover)
      { '<leader>ds', function() vim.lsp.buf.hover() end, { noremap = true }, desc = "Hover over symbol (x2 to jump into)" },
      -- float
      { '<leader>df', function () vim.diagnostic.open_float() end, { noremap = true }, desc = "Open diagnostic float" },
      -- rename
      { '<leader>dr', function() vim.lsp.buf.rename() end, { noremap = true }, desc = "Rename symbol" },
      -- diagnostic jumps
      { '[d', function () vim.diagnostic.goto_prev() end, { noremap = true }, desc = "Go to previous diagnostic" },
      { ']d', function () vim.diagnostic.goto_next() end, { noremap = true }, desc = "Go to next diagnostic", },
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
          local mason_registry = require("mason-registry")
          local ra_dir = mason_registry.is_installed("rust-analyzer")
            and mason_registry.get_package("rust-analyzer"):get_install_path()
          for name, type in vim.fs.dir(ra_dir) do
            if type == "file" and vim.startswith(name, "rust-analyzer") then
              return { ra_dir .. "/" .. name }
            end
          end
          -- Will likely get other scary errors before you see this, but whatever.
          LazyVim.error("**rust-analyzer** not found in " .. ra_dir .. ".", { title = "rustaceanvim" })
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
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    },
    opts = {},
  },
}

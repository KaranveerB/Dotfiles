LazyVim = require("lazyvim.util")


-- TODO: Break this out. `tools.lua` is too vague.
return {
  {
    -- TODO: setup fzy
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- stylua: ignore
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end,
        desc = "Find files (root dir)" },
      { "<leader>fF", function() require("telescope.builtin").find_files( {root = false} ) end,
        desc = "Find files (root dir)" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end,
        desc = "Grep files (root dir)" },
      { "<leader>fG", function() require("telescope.builtin").live_grep( {root = false} ) end,
        desc = "Grep files (cwd)" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end,
        desc = "Find help" },
      { "<leader>fk", function() require("telescope.builtin").keymaps() end,
        desc = "Find keymap" },
      { "<leader>fd" , function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, "Grep workspace symbols" },
    },
  },
  {
    -- maybe consider nvim-telescope/telescope-file-browser.nvim
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        width = 30,
      },
      filters = {
        dotfiles = false,
      },
      hijack_cursor = true,
    },
    --stylua: ignore
    keys = {
      { "<C-n>", function() require("nvim-tree.api").tree.toggle() end,
        desc = "Open nvim-tree" },
    },
    on_attach = {
      function()
        local api = require("nvim-tree.api")
        -- vim.keymap.set('n', 'l', api.node.open.preview()) -- wrong
      end,
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },
  {
    -- hex color highlighting
    "NvChad/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "j-hui/fidget.nvim",
    lazy = false,
    opts = {
      progress = {
        display = {
          render_limit = 16,
        },
      },
      notification = {
        override_vim_notify = true,
      },
      integration = {
        ["nvim-tree"] = {
          enable = true,
        },
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    enabled = false,
    opts = {
      stages = "static",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = false })
        end,
        desc = "Dismiss notifications",
      },
    }, -- when noice is not enabled, install notify on VeryLazy
    init = function()
      if not LazyVim.has("noice.nvim") then
        LazyVim.on_very_lazy(function()
          vim.notify = require("notify")
        end)
      end
    end,
  },
  {
    "mbbill/undotree",
    -- stylua: ignore
    keys = {
        { "<leader>ut" , vim.cmd.UndotreeToggle }
    },
    config = function()
      vim.g.undotree_WindowLayout = 3 -- Right side
      vim.g.undotree_SplitWidth = 40
    end,
  },
  {
    -- sudo read/write from nvim
    "lambdalisue/vim-suda",
    -- provides `:SudaRead` and `:SudaWrite
    event = "VeryLazy",
  },
  {
    "tyru/capture.vim",
    -- Provides `:Capture` that allows you to cpature the output of other :Ex commands into a buffer
    event = "VeryLazy",
  },
  {
    "dfendr/clipboard-image.nvim",
    enabled = false,
    -- Maybe see if ctrl+shift+v can work?
    event = "VeryLazy",
    opts = {
      tex = {
        img_dir = { "res" },
        img_handler = function(img)
          if vim.endswith(img.path, ".png") then
            local new_path = img.path:gsub(".png", "jpg")
            os.execute("magick convert " .. img.path .. " " .. new_path)
            vim.notify(new_path)
            os.remove(img.path)
          end
        end,
        -- This won't actually work because I can't return the file path :(
        -- (Probably at least. Didn't test it)
      },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      filetypes = {
        tex = {
          dir_path = "res",
          -- Most of my latex docs are in drive so save space.
          process_cmd = "magick convert - -quality 70 -",
          template = [[
\begin{figure}[H]
  \centering
  \includegraphics[width=0.8\textwidth]{$FILE_PATH}
\end{figure}
        ]],
        },
      },
    },
  },
  {
    "wsdjeg/vim-fetch",
    -- disable lazy loading so we can do things like `vim file.txt:123`
    lazy = false,
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<C-s>", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      outline_window = {
        width = 20,
        show_relative_numbers = true,
      },
      keymaps = {
        up_and_jump = "<C-p>",
        down_and_jump = "<C-n>",
      }
    },
  },
}

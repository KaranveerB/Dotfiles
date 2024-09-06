--- TODO: Make this work for me. Currently stolen from https://github.com/LazyVim/LazyVim/blob/12818a6cb499456f4903c5d8e68af43753ebc869/lua/lazyvim/plugins/extras/dap/core.lua#L4
---@param config {args?:string[]|fun():string[]?}
local function get_args(config)
  local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
  config = vim.deepcopy(config)
  ---@cast args string[]
  config.args = function()
    local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
    return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
  end
  return config
end

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "williamboman/mason.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "jay-babu/mason-nvim-dap.nvim",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup()
      require("mason-nvim-dap").setup({
        ensure_installed = {},
        handlers = {},
      })
      vim.api.nvim_set_hl(0, "DapRed", { fg = "#f38ba8" }) -- catppuccin red
      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "DapRed" })
    end,
    -- stylua: ignore
    keys = {
      -- breakpoints
      { "<leader>gb", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
      { "<leader>gB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Set conditional breakpoint" },
      -- invokes
      { "<leader>grc", function() require("dap").continue() end, desc = "Continue debug" },
      { "<leader>gra", function() require("dap").continue({ before = get_args }) end, desc = "Debug with args" }, -- TODO: Adapt for my usage
      { "<leader>grl", function() require("dap").run_last() end, desc = "Run Last" },
      -- control
      { "<leader>gh", function() require("dap").run_to_cursor() end, desc = "Run to cursor" }, -- run [h]ere
      { "<leader>gs", function() require("dap").step_into() end, desc = "Step into" },
      { "<leader>gf", function() require("dap").step_out() end, desc = "Step out" },
      { "<leader>gn", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>gp", function() require("dap").pause() end, desc = "Pause" },
      -- stack trace
      { "<leader>gj", function() require("dap").down() end, desc = "Down" },
      { "<leader>gk", function() require("dap").up() end, desc = "Up" },
      -- others
      { "<leader>gg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
      { "<leader>gs", function() require("dap").session() end, desc = "Session" },
      { "<leader>gR", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>gt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>gw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "mrcjkb/rustaceanvim", -- maybe there is a better way to do this.
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("rustaceanvim.neotest"),
        },
      })
    end,
  },
}

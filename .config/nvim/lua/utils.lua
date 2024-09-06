local M = {}

-- path is relative to nvim_config_dir/lua directory.
-- Determines module name by replacing '/' with '.' so modules must be a child
-- of the nvim_config_dir/lua directory.
--
M.load_modules = function(path)
  local loaded_modules = {}

  local nvim_lua_dir = vim.fn.stdpath('config') .. "/lua"
  for name, type in vim.fs.dir(nvim_lua_dir .. "/" .. path, { depth = 10 }) do
    if type == "file" and vim.endswith(name, ".lua") then
      local mod_prefix = path:gsub("/", ".") .. "."
      local mod_name = name:gsub("%.lua", "")
      local qualified_name = mod_prefix .. mod_name
      local success, snippet_module = pcall(require, qualified_name)
      if success and snippet_module then
        loaded_modules[qualified_name] = snippet_module
      else
        vim.notify("Failed to load " .. qualified_name)
      end
    end
  end

  return loaded_modules
end

return M

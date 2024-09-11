local M = {}

M.add_snippets = function()
end

M.transform_snippets = function(snippet, helper)
  vim.notify("worked")
  --if snippet.trigger == "begin" then
  --snippet.trigger = "\\begin"
  return snippet
  --end
end

return M

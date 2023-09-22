local M = {}

M.plugin_name = "luffy"

function M.emit_notify(title, body, level, timeout)
  level = level or vim.log.levels.INFO
  timeout = timeout or 1000
  vim.notify(body, level, { title = title, timeout = 1000 })
end

function M.safe_require(module)
  local ok, ret = pcall(require, M.plugin_name .. "." .. module)
  if not ok then
    M.emit_notify(
      "Module load",
      "An error was encountered while trying to load '" .. module .. "'"
    )
  end

  return ret
end

function M.ternary(cond, T, F)
  if cond then
    return T
  else
    return F
  end
end

function M.setup()
  local options = M.safe_require("options")
  for k, v in pairs(options) do
    vim.opt[k] = v
  end

  M.safe_require("keymaps")
  M.safe_require("auto")
  M.safe_require("plugins")
end

return M

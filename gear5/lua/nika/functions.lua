local M = {}

function M.emit_notify(title, body, level, timeout)
  level = level or vim.log.levels.INFO
  timeout = timeout or 1000
  vim.notify(body, level, { title = title, timeout = timeout })
end

function M.ternary(cond, T, F)
  if cond then
    return T
  else
    return F
  end
end

function M.toggle_option(option, old, new, name)
  vim.opt[option] = M.ternary(vim.opt[option]:get() == old, new, old)
  M.emit_notify("Toggle option", '"' .. name .. '" ' .. "has been set to " .. tostring(vim.opt[option]:get()))
end

return M

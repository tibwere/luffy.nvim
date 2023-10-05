local M = {}

function M.emit_notify(title, body, level, timeout)
  level = level or vim.log.levels.INFO
  timeout = timeout or 1000
  vim.notify(body, level, { title = title, timeout = 1000 })
end

function M.ternary(cond, T, F)
  if cond then
    return T
  else
    return F
  end
end

return M

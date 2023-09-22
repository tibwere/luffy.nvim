local M = {}

function M.emit_notify(title, body, level, timeout)
  level = level or vim.log.levels.INFO
  timeout = timeout or 1000
  vim.notify(body, level, { title = title, timeout = 1000 })
end

function M.setup()
end

return M

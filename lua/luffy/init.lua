local M = {}

function M.emit_notify(title, body, level, timeout)
  level = level or vim.log.levels.INFO
  timeout = timeout or 1000
  vim.notify(body, level, { title = title, timeout = 1000 })
end

function M.safe_require(module)
  local ok, ret = pcall(require, module)
  if not ok then
    M.emit_notify(
      "Module load",
      "An error was encountered while trying to load '"
        .. module
        .. "'\nError:\n"
        .. ret
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

function M.set_colorscheme(opts)
  if opts.colorscheme.name then
    vim.cmd.colorscheme(opts.colorscheme.name)
  end

  if opts.colorscheme.hook then
    opts.colorscheme.hook()
  end
end

function M.setup(opts)
  for k, v in pairs(M.safe_require("luffy.options")) do
    vim.opt[k] = v
  end

  M.safe_require("luffy.keymaps")
  M.safe_require("luffy.auto")
  M.safe_require("luffy.plugins")

  M.safe_require("luffy.devel")

  M.set_colorscheme(opts)
end

return M

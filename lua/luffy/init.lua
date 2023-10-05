local M = {}

local function set_colorscheme(colorscheme)
  if type(colorscheme) == "function" then
    colorscheme()
  elseif type(colorscheme) == "string" then
    vim.cmd.colorscheme(colorscheme)
  else
    error({ msg = "opts.colorscheme should be a string or a function" })
  end
end

function M.setup(opts)
  for _, m in pairs(opts.modules) do
    local ok, ret = pcall(require, "luffy." .. m)
    if not ok then
      error({ failed_module = m, log = ret })
    end
  end

  local _, err = pcall(set_colorscheme, opts.colorscheme)
  if err then
    error({ failed_module = "init", log = err.msg })
  end
end

return M

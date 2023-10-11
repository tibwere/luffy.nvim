local M = {}

local default_options = {
  colorscheme = "catppuccin",
  modules = {
    "options",
    "keymaps",
    "auto",
    "plugins",
    "devel",
  },
}

M.options = {}

local function set_colorscheme(colorscheme)
  if type(colorscheme) == "function" then
    colorscheme()
  elseif type(colorscheme) == "string" then
    vim.cmd.colorscheme(colorscheme)
  else
    error({ msg = "colorscheme should be a string or a function" })
  end
end

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", default_options, opts or {}) or {}

  for _, m in pairs(M.options.modules) do
    local ok, ret = pcall(require, "luffy." .. m)
    if not ok then
      error({ failed_module = m, log = ret })
    end
  end

  local _, err = pcall(set_colorscheme, M.options.colorscheme)
  if err then
    error({ failed_module = "init", log = err.msg })
  end
end

return M

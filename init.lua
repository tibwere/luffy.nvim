local M = {}

M.default_opts = {
  colorscheme = function()
    vim.cmd.colorscheme("catppuccin")
    local mocha = require("catppuccin.palettes").get_palette("mocha")
    vim.cmd("highlight ColorColumn guibg=" .. mocha.red)
    vim.cmd("highlight LineNr guifg=" .. mocha.yellow)
  end,
  modules = {
    "options",
    "keymaps",
    "auto",
    "plugins",
    "devel",
  },
}

if not pcall(require, "luffy.utils") then
  vim.api.nvim_echo({
    {
      "Luffy's utils module is used quite a lot in this configuration.\n",
      "ErrorMsg",
    },
    { "However it seems to be missing.\n", "ErrorMsg" },
    { "Try to execute the following command:\n", "MoreMsg" },
    { "\t$ git checkout master", "MoreMsg" },
  }, true, {})

  vim.fn.getchar()
  vim.cmd([[quit!]])
end

local _, err = pcall(function()
  require("luffy").setup(M.default_opts)
end)

if err then
  vim.api.nvim_echo({
    { "Luffy.nvim setup failed.\n", "ErrorMsg" },
    { "Module that has failed: " .. err.failed_module .. "\n", "ErrorMsg" },
    { "Error log:\n" .. err.log, "MoreMsg" },
  }, true, {})

  vim.fn.getchar()
  vim.cmd([[quit!]])
end

return M

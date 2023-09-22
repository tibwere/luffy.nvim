local opts = {
  colorscheme = {
    name = "catppuccin",
    hook = function()
      local mocha = require("catppuccin.palettes").get_palette("mocha")
      vim.cmd("highlight ColorColumn guibg=" .. mocha.red)
      vim.cmd("highlight LineNr guifg=" .. mocha.yellow)
    end,
  },
}

local t, ok
ok, t = pcall(require, "luffy")
if ok then
  t.setup(opts)
else
  vim.api.nvim_echo({
    { "Please install luffy.nvim first\n" .. t, "ErrorMsg" },
  }, true, {})
end

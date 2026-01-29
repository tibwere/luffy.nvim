local options = {
  guicursor = "",
  number = true,
  relativenumber = true,
  expandtab = false,
  shiftwidth = 8,
  tabstop = 8,
  softtabstop = 8,
  smartindent = true,
  wrap = false,
  swapfile = true,
  backup = false,
  undodir = os.getenv("HOME") .. "/.cache/undovim",
  ignorecase = true,
  undofile = true,
  hlsearch = true,
  incsearch = true,
  termguicolors = true,
  scrolloff = 8,
  updatetime = 50,
  colorcolumn = "81",
  showmode = false,
  splitright = true,
  splitbelow = true,
  signcolumn = "yes",
  timeout = true,
  timeoutlen = 300,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.list = true
local special_chars = require('luffy.utils').special_chars
vim.opt.listchars:append('tab:' .. special_chars['tab'])
vim.opt.listchars:append('trail:' .. special_chars['trail'])
--
-- emph trailing whitespaces by coloring them
vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])

-- From nvim-lua/kickstart.nvim
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

local options = {
  guicursor = "",
  number = true,
  relativenumber = true,
  expandtab = false,
  shiftwidth = 8,
  tabstop = 8,
  softtabstop = 8,
  smartcase = true,
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
  scrolloff = 10,
  updatetime = 50,
  colorcolumn = "81",
  showmode = false,
  splitright = true,
  splitbelow = true,
  signcolumn = "yes",
  timeout = true,
  timeoutlen = 300,

  -- From nvim-lua/kickstart.nvim
  -- Preview substitutions live, as you type!
  inccommand = "split",
  -- Show which line your cursor is on
  cursorline = true,
  -- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
  -- instead raise a dialog asking if you wish to save the current file(s)
  -- See `:help 'confirm'`
  confirm = true,
  list = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

local special_chars = require("luffy.utils").special_chars
vim.opt.listchars:append("tab:" .. special_chars["tab"])
vim.opt.listchars:append("trail:" .. special_chars["trail"])
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

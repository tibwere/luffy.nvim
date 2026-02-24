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

-- Add tab and trail to listchars
local special_chars = require("luffy.utils").special_chars
vim.opt.listchars:append("tab:" .. special_chars["tab"])
vim.opt.listchars:append("trail:" .. special_chars["trail"])

-- Emphatize trailing whitespaces by coloring them
vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])

-- From nvim-lua/kickstart.nvim

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- Diagnostic Config
vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Teest shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },
})

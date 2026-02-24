vim.opt.backup = false
vim.opt.colorcolumn = "81"
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = false
vim.opt.guicursor = ""
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.incsearch = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "•" }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 8
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 8
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = true
vim.opt.tabstop = 8
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wrap = false

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

vim.g.have_nerd_font = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },

  -- Can switch between these as you prefer
  virtual_text = false, -- Text shows up at the end of the line
  virtual_lines = true, -- Teest shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },
})

-- TODO: move this to nvim-colorizer config
vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])

vim.lsp.enable({ "lua_ls", "clangd" })

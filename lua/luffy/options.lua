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

local special_chars = {
  eol = "¬",
  tab = "‣ ",
  trail = "•",
  -- extends = "»",
  -- nbsp = "⦸",
  -- precedes = "«",
  -- space = "␣",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.list = true
for k, v in pairs(special_chars) do
  vim.opt.listchars:append(k .. ":" .. v)
end

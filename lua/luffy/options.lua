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

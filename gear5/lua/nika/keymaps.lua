local map = vim.keymap.set
local functions = require("nika.functions")

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Disable highlight search when switching on normal mode" })

map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move down (indent aware)" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move up (indent aware)" })

map("n", "n", "nzzzv", { desc = "Jump next (and centering)" })
map("n", "N", "Nzzzv", { desc = "Jump previous (and centering)" })

map("x", "<leader>p", [["_dP]], { desc = "Paste over existing text" })
map("x", "<leader>c", [["_d]], { desc = "Cut without store in registers" })

map("n", "<leader>rh", ":noh<CR>", { desc = "Remove highlight" })

map(
  "n",
  "<leader>rw",
  [[:let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>]],
  { desc = "Remove trailing whitespaces" }
)

map("n", "<leader>tw", function()
  functions.toggle_option("textwidth", 0, 80, "Text width")
end, { desc = "Toggle 80-column constraint" })

map("n", "<leader>tc", function()
  functions.toggle_option("ignorecase", true, false, "Ignore case")
end, { desc = "Toggle case sensitive/insensitive search" })

map("n", "<leader>tn", function()
  functions.toggle_option("relativenumber", true, false, "Relative line numbers")
end, { desc = "Toggle relative/absolute line numbers" })

map("n", "<leader>ts", function()
  if vim.opt.listchars:get()["space"] then
    vim.opt.listchars:remove("space")
  else
    vim.opt.listchars:append("space:␣")
  end
end, { desc = "Toggle visible spaces" })

-- TODO: add arrows mgmt

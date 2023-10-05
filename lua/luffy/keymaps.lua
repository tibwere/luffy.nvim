local function toggle_option(option, old, new, name)
  local utils = require("luffy.utils")
  vim.opt[option] = utils.ternary(vim.opt[option]:get() == old, new, old)
  utils.emit_notify(
    "Toggle option",
    '"' .. name .. '" ' .. "has been set to " .. tostring(vim.opt[option]:get())
  )
end

local map = vim.keymap.set

-- set <Space> as leader
vim.g.mapleader = " "

map("i", "jk", "<ESC>", { desc = "Goto normal mode (quickly)" })
map("i", "kj", "<ESC>", { desc = "Goto normal mode (quickly)" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move down (indent aware)" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move up (indent aware)" })

map("n", "n", "nzzzv", { desc = "Jump next" })
map("n", "N", "Nzzzv", { desc = "Jump previous" })

map("x", "<leader>p", [["_dP]], { desc = "Paste over existing text" })
map("x", "<leader>c", [["_d]], { desc = "Cut without store in registers" })

map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank (global clipboard)" })
map({ "n", "v" }, "<leader>d", [["+d]], { desc = "Cut (global clipboard)" })

-- Why should i want to switch to ex?
map("n", "Q", "<nop>")

map("n", "<leader>rh", ":noh<CR>", { desc = "Remove highlight" })

map(
  "n",
  "<leader>rw",
  [[:let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>]],
  { desc = "Remove trailing whitespaces" }
)

map("n", "<leader>tw", function()
  toggle_option("textwidth", 0, 80, "Text width")
end, { desc = "Toggle 80-column constraint" })

map("n", "<leader>tc", function()
  toggle_option("ignorecase", true, false, "Ignore case")
end, { desc = "Toggle case sensitive/insensitive search" })

map("n", "<leader>tn", function()
  toggle_option("relativenumber", true, false, "Relative line numbers")
end, { desc = "Toggle relative/absolute line numbers" })

-- run makeprg
map("n", "<F5>", function()
  vim.cmd([[silent make]])
  require("luffy.utils").emit_notify("Make", "'makeprg' has completed")
end, { desc = "Run make" })

-- update session
map("n", "<leader>us", function()
  vim.cmd([[mks!]])
  require("luffy.utils").emit_notify("Session manager", "Session.nvim updated")
end, { desc = "Update Session.vim" })

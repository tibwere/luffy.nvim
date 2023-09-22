local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local luffygrp = augroup("luffy", { clear = true })

autocmd({ "FileType" }, {
  group = luffygrp,
  pattern = { "text", "tex", "markdown", "plaintex" },
  callback = function()
    vim.opt_local.textwidth = 80
  end,
})

autocmd({ "FileType" }, {
  group = luffygrp,
  pattern = { "json", "yaml" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

autocmd({ "TextYankPost" }, {
  group = luffygrp,
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 500,
    })
  end,
})

autocmd("BufReadPost", {
  group = luffygrp,
  callback = function()
    local exclude = { "gitcommit" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

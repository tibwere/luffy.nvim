local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local luffygrp = augroup("luffy", { clear = true })

autocmd({ "TextYankPost" }, {
  group = luffygrp,
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 500,
    })
  end,
})

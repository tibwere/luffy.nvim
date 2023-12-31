-- all my autocommands should be included in this group
-- so they can be easily identified
vim.api.nvim_create_augroup("gomu-gomu-no", { clear = true })

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "FileType" }, {
  group = "gomu-gomu-no",
  pattern = { "text", "tex", "markdown", "plaintex" },
  callback = function()
    vim.opt_local.textwidth = 80
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.wrap = true
  end,
})

autocmd({ "FileType" }, {
  group = "gomu-gomu-no",
  pattern = { "json", "yaml" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

autocmd({ "TextYankPost" }, {
  group = "gomu-gomu-no",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 500,
    })
  end,
})

autocmd("BufReadPost", {
  group = "gomu-gomu-no",
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

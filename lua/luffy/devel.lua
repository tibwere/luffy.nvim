local icons = {
  error = "✘",
  warn = "▲",
  hint = "⚑",
  info = "»",
}

local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(_, bufnr)
  local function map(mode, lhs, rhs, opts)
    local bufopt = { buffer = bufnr }
    local options = vim.tbl_deep_extend("force", bufopt, opts or {})
    vim.keymap.set(mode, lhs, rhs, options)
  end

  map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
  map("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
  map("n", "K", vim.lsp.buf.hover, { desc = "Symbol informations" })
  map("n", "gi", vim.lsp.buf.implementation, { desc = "List implementations" })
  map(
    "n",
    "<C-k>",
    vim.lsp.buf.signature_help,
    { desc = "Signature informations" }
  )
  map(
    "n",
    "go",
    vim.lsp.buf.type_definition,
    { desc = "Goto the type definition" }
  )
  map("n", "gr", vim.lsp.buf.references, { desc = "List references" })
  map("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename all references" })
  map({ "n", "x" }, "<F3>", function()
    vim.lsp.buf.format({ async = true })
  end, { desc = "Format the buffer" })
  map("n", "<F4>", vim.lsp.buf.code_action, { desc = "Select an action" })
  map("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
  map("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto next diagnostic" })
end)

lsp_zero.set_sign_icons(icons)

local servers = {
  "lua_ls",
  "bashls",
  "clangd",
  "pyright",
}

require("mason-lspconfig").setup({
  ensure_installed = servers,
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls({
        telemetry = { enable = false },
      })
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
  },
})

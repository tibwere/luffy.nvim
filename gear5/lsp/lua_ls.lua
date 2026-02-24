return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
  on_attach = function(client, bufnr)
    local ok, navic = pcall(require("nvim-navic"))
    if ok then
      navic.attach(client, bufnr)
    end
  end,
}

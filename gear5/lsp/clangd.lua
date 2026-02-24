return {
  cmd = {
    "clangd",
    "--clang-tidy",
    "--background-index",
    "--offset-encoding=utf-8",
  },
  root_markers = { ".clangd", "compile_commands.json" },
  filetypes = { "c", "cpp" },
  on_attach = function(client, bufnr)
    local ok, navic = pcall(require("nvim-navic"))
    if ok then
      navic.attach(client, bufnr)
    end
  end,
}

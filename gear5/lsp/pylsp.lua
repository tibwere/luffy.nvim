return {
  cmd = { "pylsp" },
  root_markers = { "__pycache__/" },
  filetypes = { "python" },
  on_attach = function(client, bufnr)
    local ok, navic = pcall(require("nvim-navic"))
    if ok then
      navic.attach(client, bufnr)
    end
  end,
}

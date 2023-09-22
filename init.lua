local t, ok
ok, t = pcall(require, "luffy")

if ok then
  t.setup()
else
  vim.api.nvim_echo({
    { "Please install luffy.nvim first\n" .. t, "ErrorMsg" },
  }, true, {})
end

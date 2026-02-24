return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<F3>",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = { "n", "v" },
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
    },
  },
}

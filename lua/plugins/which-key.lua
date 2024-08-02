return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  keys = {
    { "<leader>f", group = "telescope" },
    { "<leader>r", group = "remove" },
    { "<leader>t", group = "toggle" },
    { "<leader>u", group = "update" },
    { "<leader>b", group = "buffer" },
  },
}

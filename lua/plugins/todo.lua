return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({})
      vim.keymap.set(
        "n",
        "<leader>ft",
        "<cmd>TodoTelescope<cr>",
        { desc = "Open Todo list in telescope" }
      )
    end,
  },
}

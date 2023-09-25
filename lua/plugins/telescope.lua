return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local map = vim.keymap.set
    local builtin = require("telescope.builtin")
    map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    map("n", "<leader>fb", builtin.buffers, { desc = "Open buffers" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "Search an help page" })
    map("n", "<leader>fc", builtin.colorscheme, { desc = "Set a colorscheme" })
    map("n", "<C-f>", function()
      builtin.grep_string({ search = vim.fn.input("Searching for: ") })
    end, { desc = "Search for" })
  end,
}

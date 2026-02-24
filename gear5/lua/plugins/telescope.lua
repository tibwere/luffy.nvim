return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim", -- for vim.select.ui restyle
    -- optional but recommended
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        path_display = { "smart" },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    local map = vim.keymap.set
    local builtin = require("telescope.builtin")
    map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    map({ "n", "v" }, "<leader>fw", builtin.grep_string, { desc = "Search current word" })
    map("n", "<leader>fb", builtin.buffers, { desc = "Open buffers" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "Search an help page" })
    map("n", "<leader>fc", builtin.colorscheme, { desc = "Set a colorscheme" })
    map("n", "<leader>fk", builtin.keymaps, { desc = "Find keymap" })
    map("n", "<leader>ft", builtin.builtin, { desc = "Search telescope builtin" })

    map("n", "<leader>f/", function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily search in current buffer" })

    map("n", "<leader>fG", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "[S]earch [/] in Open Files" })

    -- Shortcut for searching your Neovim configuration files
    map("n", "<leader>fn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[S]earch [N]eovim files" })

    -- TODO review LSP
    ---- Find references for the word under your cursor.
    map("n", "grr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })

    -- Jump to the implementation of the word under your cursor.
    -- Useful when your language has ways of declaring types without an actual implementation.
    map("n", "gri", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" })

    -- Jump to the definition of the word under your cursor.
    -- This is where a variable was first declared, or where a function is defined, etc.
    -- To jump back, press <C-t>.
    map("n", "grd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" })

    -- Fuzzy find all the symbols in your current document.
    -- Symbols are things like variables, functions, types, etc.
    map("n", "gO", builtin.lsp_document_symbols, { desc = "Open Document Symbols" })

    -- Fuzzy find all the symbols in your current workspace.
    -- Similar to document symbols, except searches over your entire project.
    map("n", "gW", builtin.lsp_dynamic_workspace_symbols, { desc = "Open Workspace Symbols" })

    -- Jump to the type of the word under your cursor.
    -- Useful when you're not sure what type a variable is and you want to see
    -- the definition of its *type*, not where it was *defined*.
    map("n", "grt", builtin.lsp_type_definitions, { desc = "[G]oto [T]ype Definition" })
  end,
}

return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    -- Treesitter as a main provider.
    -- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
    -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
    provider_selector = function(_, _, _)
      return { "treesitter", "indent" }
    end,
  },
  config = function(_, opts)
    local ufo = require("ufo")
    ufo.setup(opts)

    -- Custom gliphs in the fold column
    vim.o.foldcolumn = "1"
    -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    -- Custom mappings
    vim.keymap.set("n", "zR", ufo.openAllFolds)
    vim.keymap.set("n", "zM", ufo.closeAllFolds)
  end,
}

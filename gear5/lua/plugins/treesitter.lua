return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local filetypes = {
      "bash",
      "c",
      "diff",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "typst",
      "latex",
      "python",
      "git_rebase",
      "gitcommit",
      "vim",
      "vimdoc",
    }
    require("nvim-treesitter").install(filetypes)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function()
        vim.treesitter.start()
      end,
    })
    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt.foldmethod = "expr"
  end,
}

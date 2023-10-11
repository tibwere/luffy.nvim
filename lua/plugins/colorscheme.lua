return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = true,
    opts = {
      integrations = { navic = { enabled = true, custom_bg = "NONE" } },
      custom_highlights = function(colors)
        return {
          LineNr = { fg = colors.yellow },
          ColorColumn = { bg = colors.red },
        }
      end,
    },
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000, lazy = true },
}

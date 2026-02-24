return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    integrations = { navic = { enabled = true, custom_bg = "NONE" } },
    custom_highlights = function(colors)
      return {
        LineNr = { fg = colors.yellow },
        ExtraWhitespace = { fg = colors.red },
        ColorColumn = { bg = colors.red },
        WinSeparator = { bg = colors.green },
      }
    end,
  },
}


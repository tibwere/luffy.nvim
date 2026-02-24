return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = true,
  opts = {
    integrations = { navic = { enabled = true, custom_bg = "NONE" } },
    custom_highlights = function(colors)
      return {
        LineNr = { fg = colors.yellow },
        ExtraWhitespace = { fg = colors.red },
        ColorColumn = { bg = colors.red },
        WinSeparator = { bg = colors.green },
        RainbowRed = { fg = colors.red },
        RainbowYellow = { fg = colors.yellow },
        RainbowBlue = { fg = colors.blue },
        RainbowOrange = { fg = colors.peach },
        RainbowGreen = { fg = colors.green },
        RainbowViolet = { fg = colors.mauve },
        RainbowCyan = { fg = colors.sky },
      }
    end,
  },
}


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
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000, lazy = true },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        on_highlights = function(hl, c)
          hl.LineNr = { fg = c.yellow }
          hl.ExtraWhitespace = { fg = c.yellow }
          hl.ColorColumn = { bg = c.red }
          hl.WinSeparator = { bg = c.green }
          hl.RainbowRed = { fg = c.red }
          hl.RainbowYellow = { fg = c.yellow }
          hl.RainbowBlue = { fg = c.blue }
          hl.RainbowOrange = { fg = c.orange }
          hl.RainbowGreen = { fg = c.green }
          hl.RainbowViolet = { fg = c.purple }
          hl.RainbowCyan = { fg = c.cyan }
        end,
      })
    end,
  },
}

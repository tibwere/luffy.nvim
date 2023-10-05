local buttons = {
  { "f", "  Find file", "<cmd> Telescope find_files <cr>" },
  { "n", "  New file", "<cmd> ene <BAR> startinsert <cr>" },
  { "r", "  Recent files", "<cmd> Telescope oldfiles <cr>" },
  { "g", "  Find text", "<cmd> Telescope live_grep <cr>" },
  { "c", "  Config", "<cmd> edit $HOME/.config/nvim/init.lua <cr>" },
  { "l", "  Lazy", "<cmd> Lazy <cr>" },
  { "q", "  Quit", "<cmd> qa <cr>" },
}

local logo = {
  [[██╗     ██╗   ██╗███████╗███████╗██╗   ██╗]],
  [[██║     ██║   ██║██╔════╝██╔════╝╚██╗ ██╔╝]],
  [[██║     ██║   ██║█████╗  █████╗   ╚████╔╝ ]],
  [[██║     ██║   ██║██╔══╝  ██╔══╝    ╚██╔╝  ]],
  [[███████╗╚██████╔╝██║     ██║        ██║   ]],
  [[╚══════╝ ╚═════╝ ╚═╝     ╚═╝        ╚═╝   ]],
}

return {
  "goolord/alpha-nvim",
  dependencies = "famiu/bufdelete.nvim",
  event = "VimEnter",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = logo

    dashboard.section.buttons.val = {}
    for _, bdef in pairs(buttons) do
      local button = dashboard.button(unpack(bdef))
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, button)
    end

    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    return dashboard
  end,
  config = function(_, dashboard)
    require("alpha").setup(dashboard.opts)
  end,
}

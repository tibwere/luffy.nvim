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

    vim.api.nvim_create_autocmd("User", {
      pattern = "BDeletePost*",
      group = "gomu-gomu-no",
      callback = function(event)
        local fallback_name = vim.api.nvim_buf_get_name(event.buf)
        local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
        local fallback_on_empty = fallback_name == "" and fallback_ft == ""

        if fallback_on_empty then
          local ok, _ = pcall(require, "neo-tree")
          if not ok then
            require("alpha").start()
            vim.api.nvim_buf_delete(event.buf, { force = true })
          end
        end
      end,
    })
  end,
}

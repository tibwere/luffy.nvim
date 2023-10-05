return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>rn",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss all Notifications",
    },
  },
  opts = {},
  init = function()
    vim.notify = require("notify")
  end,
}

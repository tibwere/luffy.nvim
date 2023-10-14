local diagnostics_icons = function()
  local std = require("luffy.utils").icons.diagnostic
  local adj = vim.deepcopy(std)

  adj["warning"] = adj["warn"]
  adj["warn"] = nil

  return adj
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    renderer = { highlight_git = true },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = diagnostics_icons(),
    },
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    actions = { open_file = { quit_on_open = true } },
  },
}

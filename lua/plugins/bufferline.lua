return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
  event = "VeryLazy",
  opts = {
    options = {
      close_command = "Bdelete! %d",
      right_mouse_command = nil,
      middle_mouse_command = nil,
      diagnostics = "nvim_lsp",
      update_in_insert = true,
      diagnostics_indicator = function(count, level, _, _)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
      separator_style = "thick", -- | "slant" | "thin" | { 'any', 'any' },
    },
  },
}

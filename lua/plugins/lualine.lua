-- helper function that is used to choose
-- if show component on the lualine or not
local conditional_hide = function()
  return vim.fn.winwidth(0) > 120
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  opts = {
	options = {
		theme = 'auto',
		globalstatus = true,
		section_separators = { left = '', right = '' },
		component_separators = '|',
	},

  }
}

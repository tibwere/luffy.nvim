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

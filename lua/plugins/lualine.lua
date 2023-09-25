-- helper function that is used to choose
-- if show component on the lualine or not
local conditional_hide = function()
  return vim.fn.winwidth(0) > 120
end

-- custom diff component
-- (fancy icons are added)
local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " },
  cond = conditional_hide,
}

-- helper function used to format a component
-- that immediately shows the tab width and type
local tab_info = function()
  local tab_type
  if vim.api.nvim_buf_get_option(0, "expandtab") then
    tab_type = "Spaces"
  else
    tab_type = "Tab"
  end
  return tab_type .. ": " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
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

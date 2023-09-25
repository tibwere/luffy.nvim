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

-- custom progress component
-- (it displays an incremental box along with the percentage)
local progress = {
  "progress",
  fmt = function(str)
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = {
      "__",
      "▁▁",
      "▂▂",
      "▃▃",
      "▄▄",
      "▅▅",
      "▆▆",
      "▇▇",
      "██",
    }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return str .. " " .. chars[index]
  end,
}

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

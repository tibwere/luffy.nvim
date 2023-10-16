-- custom diff component
-- (fancy icons are added)
local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " },
}

-- custom diagnostic component
-- (always visible and updated)
local diagnostics = {
  "diagnostics",
  update_in_insert = true,
  always_visible = true,
  cond = function()
    return #vim.lsp.get_active_clients() > 0
  end,
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

local navic = {
  "navic",
  fmt = function()
    return require("nvim-navic").get_location()
  end,
  cond = function()
    return require("nvim-navic").is_available()
  end,
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  opts = {
    options = {
      theme = "auto",
      globalstatus = true,
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", diagnostics },
      lualine_c = { "filename", navic },
      lualine_x = { "filetype", tab_info },
      lualine_y = { diff, progress },
      lualine_z = { "location" },
    },
  },
}

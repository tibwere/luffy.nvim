local function rainbow_hl()
  local function cond_define(color, fg)
    if not vim.api.nvim_get_hl(0, { name = color }).fg then
      vim.api.nvim_set_hl(0, color, { fg = fg })
    end
  end

  -- standard colors from the github page of indent blankline
  cond_define("RainbowRed", "#E06C75")
  cond_define("RainbowYellow", "#E5C07B")
  cond_define("RainbowBlue", "#61AFEF")
  cond_define("RainbowOrange", "#D19A66")
  cond_define("RainbowGreen", "#98C379")
  cond_define("RainbowViolet", "#C678DD")
  cond_define("RainbowCyan", "#56B6C2")
end

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local hl = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, rainbow_hl)

    require("ibl").setup { indent = { highlight = hl } }
  end,
}

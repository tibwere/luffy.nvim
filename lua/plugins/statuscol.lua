return {
  "luukvbaal/statuscol.nvim",
  dependencies = { "kevinhwang91/nvim-ufo" },
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        { text = { "%s" }, click = "v:lua.ScSa" },
        { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
      },
    })
  end,
}

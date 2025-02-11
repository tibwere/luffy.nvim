return {
  "dhananjaylatkar/cscope_maps.nvim",
  dependencies = {
    "folke/which-key.nvim", -- for whichkey hints
    "nvim-telescope/telescope.nvim", -- for picker="telescope"
    "nvim-tree/nvim-web-devicons", -- for devicons in telescope or fzf
  },
  opts = {
    cscope = {
      picker = "telescope", -- "quickfix", "fzf-lua" or "quickfix"
      -- R: recursive
      -- b: build the database only (i.e., not launch the GUI)
      -- q: enable fast symbol lookup (i.e., .in.out and .po.out created)
      -- k: kernel mode (disable the default include dir /usr/include)
      db_build_cmd = { args = {"-Rbqk"} },
      skip_picker_for_single_result = true,
    },
  },
}

return {
  -- LSP
  { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
  { "neovim/nvim-lspconfig" },

  -- Mason
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    keys = { { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = { },
  },
  { "williamboman/mason-lspconfig.nvim" },

  -- Completion
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lua" },

  -- Formatting and linting
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "davidmh/cspell.nvim" },
  },

  { "folke/neodev.nvim", opts = {} },
}

# luffy.nvim

An **extended** configuration of Neovim.

## Supported plugins

### UI

  * [alpha-nvim](https://github.com/goolord/alpha-nvim): greeter
  * [bufferline.nvim](https://github.com/akinsho/bufferline.nvim): buffer line (IDE-like)
  * [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim):  indentation guides
  * [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): status line
  * [nvim-notify](https://github.com/rcarriga/nvim-notify): notification manager
  * [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua): file explorer
  * [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo): modern look for Nevoim's fold
    - [promise-async](https://github.com/kevinhwang91/promise-async): *dependency*
  * [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): fancy icons (*dependency*)
  * [statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim): configurable status column
  * [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): fuzzy finder
    - [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim): extension for a fancier `vim.ui.select`
  * [which-key.nvim](https://github.com/folke/which-key.nvim): keybinding popup helper

### Misc

  * [Comment.nvim](https://github.com/numToStr/Comment.nvim): commenting helper
  * [bufdelete.nvim](https://github.com/famiu/bufdelete.nvim): better buffer deletion management
  * [cscope\_maps.nvim](https://github.com/dhananjaylatkar/cscope_maps.nvim): `cscope` integration
  * [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): git integration
  * [mini.surround](https://github.com/echasnovski/mini.surround): Mini's surround helper
  * [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua): color highlighter
  * [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): *easy-to-use* interface for `tree-sitter`
  * [plenary.nvim](https://github.com/nvim-lua/plenary.nvim): needed by a lot of other plugin as dependency

### Colorscheme

  * [catppuccin](https://github.com/catppuccin/nvim)
  * [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)
  * [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

### Development
#### Language Server Protocol

  * [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim): helper for LSP setup
  * [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim): bridge between `mason` and `nvim-lspconfig`
  * [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): LSP configuration
  * [nvim-navic](https://github.com/SmiteshP/nvim-navic): status line that shows the current context (IDE-like)

#### Completion

  * [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): completion engine
    - [cmp-buffer](ihttps://github.com/hrsh7th/cmp-buffer): buffer source for completion
    - [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline): command line source for completion
    - [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp): bridge between LSP and completion *worlds*
    - [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua): Neovim Lua source for completion
    - [cmp-path](https://github.com/hrsh7th/cmp-nvim-lua): filesystem's path source for completion
  * [LuaSnip](https://github.com/L3MON4D3/LuaSnip): snippet collection
    - [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip): bridge between `cmp` and `LuaSnip`

#### Other

  * [mason.nvim](https://github.com/williamboman/mason.nvim): package manager for LSP/DAP servers, formatters and linters
  * [neodev.nvim](https://github.com/folke/neodev.nvim): helper for init.lua and plugin development/configuration
  * [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim): support for diagnostics, formatting and linting

### Plugin Manager
Obviously [lazy.nvim](https://github.com/folke/lazy.nvim)

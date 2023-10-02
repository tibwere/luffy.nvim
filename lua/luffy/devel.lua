local icons = {
  diagnostic = {
    error = "✘",
    warn = "▲",
    hint = "⚑",
    info = "»",
  },
  kind = {
    Text = "",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰇽",
    Variable = "󰂡",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰅲",
  },
}

local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(_, bufnr)
  local function map(mode, lhs, rhs, opts)
    local bufopt = { buffer = bufnr }
    local options = vim.tbl_deep_extend("force", bufopt, opts or {})
    vim.keymap.set(mode, lhs, rhs, options)
  end

  map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
  map("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
  map("n", "K", vim.lsp.buf.hover, { desc = "Symbol informations" })
  map("n", "gi", vim.lsp.buf.implementation, { desc = "List implementations" })
  map(
    "n",
    "<C-k>",
    vim.lsp.buf.signature_help,
    { desc = "Signature informations" }
  )
  map(
    "n",
    "go",
    vim.lsp.buf.type_definition,
    { desc = "Goto the type definition" }
  )
  map("n", "gr", vim.lsp.buf.references, { desc = "List references" })
  map("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename all references" })
  map({ "n", "x" }, "<F3>", function()
    vim.lsp.buf.format({ async = true })
  end, { desc = "Format the buffer" })
  map("n", "<F4>", vim.lsp.buf.code_action, { desc = "Select an action" })
  map("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
  map("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto next diagnostic" })

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    desc = "LSP show diagnostic on CursorHold",
    callback = function()
      local hover_opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
      }

      vim.diagnostic.open_float(nil, hover_opts)
    end,
  })
end)

lsp_zero.set_sign_icons(icons.diagnostic)

local servers = {
  "lua_ls",
  "bashls",
  "clangd",
  "pyright",
  "gopls",
}

require("mason-lspconfig").setup({
  ensure_installed = servers,
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls({
        format = { enable = false },
        telemetry = { enable = false },
      })
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
  },
})

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    {
      name = "buffer",
      -- complete from all opened buffers
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
    { name = "path" },
  }),
  mapping = {
    -- IntellJIDEA like tab completion
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          cmp.confirm()
        end
      else
        fallback()
      end
    end, { "i", "s", "c" }),

    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

    -- `Enter` key to confirm completion
    ["<CR>"] = cmp.mapping.confirm({ select = false }),

    -- Ctrl+Space to trigger completion menu
    ["<C-Space>"] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
  },
  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind =
        string.format("%s %s", icons.kind[vim_item.kind], vim_item.kind)
      -- Source
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[NVIM_LUA]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
})

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
  }),
})

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,
  },
})

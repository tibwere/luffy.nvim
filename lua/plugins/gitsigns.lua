return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame_formatter = "<abbrev_sha>: <author> (<author_time>) - <summary>",
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "Next hunk" })

      map("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "Previous hunk" })

      -- Actions
      map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk (normal)" })
      map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk (normal)" })
      map("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Stage hunk (visual)" })
      map("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Reset hunk (visual)" })
      map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
      map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
      map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
      map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, { desc = "Line blame (full)" })
      map(
        "n",
        "<leader>tb",
        gs.toggle_current_line_blame,
        { desc = "Toggle current line blame" }
      )
      map("n", "<leader>hd", gs.diffthis, { desc = "Open diff" })
      map("n", "<leader>hD", function()
        gs.diffthis("~")
      end, { desc = "Open diff with HEAD~" })
      map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted" })
    end,
  },
}

return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame_formatter = "<abbrev_sha>: <author> (<author_time>) - <summary>",
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end)

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end)

      -- Actions
      map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk (normal)" })
      map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk (normal)" })

      map("v", "<leader>hs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Stage hunk (visual)" })

      map("v", "<leader>hr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Reset hunk (visual)" })

      map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage buffer" })
      map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })
      map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
      map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview hunk (inline)" })

      map("n", "<leader>hb", function()
        gitsigns.blame_line({ full = true })
      end, { desc = "Line blame (full)" })

      map("n", "<leader>hd", gitsigns.diffthis, { desc = "Open diff" })

      map("n", "<leader>hD", function()
        gitsigns.diffthis("~")
      end, { desc = "Open diff with HEAD~" })

      map("n", "<leader>hQ", function()
        gitsigns.setqflist("all")
      end)
      map("n", "<leader>hq", gitsigns.setqflist)

      map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
      map("n", "<leader>tw", gitsigns.toggle_word_diff)

      map({ "o", "x" }, "ih", gitsigns.select_hunk)
    end,
  },
}

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
  },
  config = function()
    require("bufferline").setup({
      options = {
        -- stylua: ignore
        -- close_command = ":bdelete!",
        -- right_mouse_command = ":bdelete!",
        -- stylua: ignore
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict)
          local s = " "
          local sym = level:match("error") and " " or " "
          s = s .. sym .. count
          return s
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
      },
    })
    vim.api.nvim_set_keymap("n", "gb", "", {
      callback = function()
        vim.api.nvim_command("BufferLineCycleNext")
      end,
    })
    vim.api.nvim_set_keymap("n", "gB", "", {
      callback = function()
        vim.api.nvim_command("BufferLineCyclePrev")
      end,
    })
  end,
}

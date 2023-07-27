return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim" },
    keys = {
      { "<leader>fb", "<cmd>:Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>ff", "<cmd>:Telescope find_files hidden=true<cr>", desc = "Find Files" },
      { "<leader>fr", "<cmd>:Telescope live_grep<cr>", desc = "Grep Files" },
      { "<leader>fs", "<cmd>:Telescope current_buffer_fuzzy_find<cr>", desc = "Grep Buffer" },
      { "<leader>fk", "<cmd>:Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>u", "<cmd>:Telescope undo<cr>", desc = "Undo" },
    },
    config = function()
      local telescope = require("telescope")
      local telescopeConfig = require("telescope.config")

      -- Clone the default Telescope configuration
      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

      -- I want to search in hidden/dot files.
      table.insert(vimgrep_arguments, "--hidden")
      -- I don't want to search in the `.git` directory.
      table.insert(vimgrep_arguments, "--glob")
      table.insert(vimgrep_arguments, "!**/.git/*")
      telescope.setup({
        extensions = {
          undo = {},
        },
        defaults = {
          layout_config = {
            width = 0.8,
            prompt_position = "top",
            preview_cutoff = 120,
            horizontal = { mirror = false },
            vertical = { mirror = false },
          },
          layout_strategy = "horizontal",
          winblend = 0,
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          prompt_prefix = "   ",
          selection_caret = "ﰲ ",
          path_display = { "smart" },
          file_ignore_patterns = { ".git/", "node_modules" },
        },
      })
      require("telescope").load_extension("undo")
    end,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = false,
    keys = {
      { "<leader>fe", "<cmd>:Telescope file_browser<cr>", desc = "Browse Files" },
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
}

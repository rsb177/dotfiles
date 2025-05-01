return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("ibl").setup({
      -- use_treesitter = true,
      -- show_current_context = true,
      -- show_current_context_start = true,
      -- show_trailing_blankline_indent = false,
      -- char = "▏",
      -- context_char = "▏",
      exclude = {
        buftypes = { "help", "loclist", "nofile", "prompt", "quickfix", "terminal" },
        filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" }
      }
    })
  end,
}

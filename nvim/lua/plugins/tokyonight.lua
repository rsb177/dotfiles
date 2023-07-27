return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    keys = {
      {
        "<leader>cl",
        "<cmd>Telescope colorscheme enable_preview=true<cr>",
        desc = "Select Colorscheme with Preview",
      },
    },
    config = function()
      require("tokyonight").setup({
        style = "moon",
        styles = {
          comments = "italic",
          sidebars = "dark",
          floats = "dark",
        },
        sidebars = { "qf", "help" },
        on_colors = function(colors)
          colors.hint = colors.orange
          colors.error = "#ff0000"
          colors.comment = colors.green2
        end,
        on_highlights = function(hl, c)
          local prompt = "#2d3149"
          hl.TelescopeNormal = {
            bg = c.darker_black,
            fg = c.fg_dark,
          }
          hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          TelescopePromptPrefix = {
            fg = c.red,
            bg = c.black2,
          }
          hl.TelescopePromptNormal = {
            bg = prompt,
          }
          hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePromptTitle = {
            bg = c.red,
            fg = c.black,
          }
          hl.TelescopePreviewTitle = {
            bg = c.green,
            fg = c.black,
          }
          -- hl.TelescopeResultsTitle = {
          --     -- bg = c.bg_dark,
          --     -- fg = c.bg_dark,
          -- }
        end,
      })
      vim.cmd("colorscheme tokyonight")
    end,
  },
}

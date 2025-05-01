return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
        }
        -- panel = {
        --   keymap = {
        --     jump_prev = "<Leader>p",
        --     jump_next = "<Leader>n",
        --     open = "<C-CR>"
        --   }
        -- },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  }
}

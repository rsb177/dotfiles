return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        keymap = {
          jump_prev = "<Leader>p",
          jump_next = "<Leader>n",
          open = "<C-CR>"
        }
      },
    })
  end,
}

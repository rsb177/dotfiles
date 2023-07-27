return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()
    local api = require("Comment.api")
    local map = vim.keymap.set


    map('n', "<leader>/", api.call("toggle.linewise.current", "g@$"), { expr = true, desc = 'Comment toggle linewise' })
    map('v', "<leader>/", api.call("toggle.linewise.current", "g@$"), { expr = true, desc = 'Comment toggle linewise' })
  end,
}

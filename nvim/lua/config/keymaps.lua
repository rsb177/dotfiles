local keymap = vim.keymap.set

-- Copy/Paste with clipboard
keymap("n", "<leader>y", "\"*yy", {  desc = "[y]ank to clipboard" })
keymap("v", "<leader>y", "\"*y", {  desc = "[y]ank to clipboard" })
keymap("n", "<C-c>", "\"*yy", { desc = "[y]ank to clipboard" })
keymap("v", "<C-c>", "\"*y", { desc = "[y]ank to clipboard" })
keymap("n", "<leader>p", "\"*p", {  desc = "[p]aste from clipboard" })

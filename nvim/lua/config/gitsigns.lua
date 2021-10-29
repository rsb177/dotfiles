local gitsigns = prequire("gitsigns")
if not gitsigns then
    return
end

gitsigns.setup({
    signs = {
        add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = ">", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
    keymaps = {},
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 100,
    },
    watch_gitdir = {
      interval = 100,
    },
    sign_priority = 5,
    status_formatter = nil, -- Use default
})

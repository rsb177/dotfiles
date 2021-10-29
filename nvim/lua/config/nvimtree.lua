local nvimtree = prequire("nvim-tree")
if not nvimtree then
    return
end

vim.g.nvim_tree_ignore = { ".git", "node_modules", "target" }
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1, folder_arrows = 1 }
vim.g.nvim_tree_special_files = { ["README.md"] = 1 }
vim.g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

nvimtree.setup {
    open_on_setup = true,
    lsp_diagnostics = false,
    disable_netrw = true,
    hijack_netrw = true,
    auto_close = false,
    tab_open = true,
    update_cwd = true,
    view = {
        -- allow_resize = true,
        auto_resize = true,
        side = "left",
        width = 25,
    },
}

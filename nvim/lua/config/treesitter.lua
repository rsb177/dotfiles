local treesitter = prequire("nvim-treesitter.configs")
if not treesitter then
    return
end

treesitter.setup({
    ensure_installed = {
        "bash",
        "cmake",
        "comment",
        "css",
        "dockerfile",
        "go",
        "graphql",
        "hcl",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "toml",
        "vim",
        "yaml",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
})

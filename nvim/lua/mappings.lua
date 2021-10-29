local nest = prequire("nest")
if not nest then
    return
end

local nvim_tree = {
    { "<C-n>", "<Cmd> NvimTreeToggle<CR>" },
    { "<leader>e", "<Cmd>NvimTreeFocus<CR>" },
}

local bufferline = {
    { "<TAB>", ":BufferLineCycleNext <CR>" },
    { "<S-TAB>", ":BufferLineCyclePrev <CR>" },
}

local comment = {
    { "<leader>/", ":CommentToggle <CR>" },
}

local dashboard = {
    name = "dashboard",
    prefix = "<leader>",
    { "ss", ":SessionSave <cr>" },
    { "sl", ":SessionLoad <cr>" },
    { "bm", ":DashboardJumpMarks <cr>" },
    { "fn", ":DashboardNewFile <cr>" },
}

local telescope = {
    name = "telescope",
    prefix = "<leader>",
    { "t", "<cmd>Telescope<cr>" },
    { "ff", "<cmd>Telescope find_files <cr>" },
    { "fa", "<cmd>Telescope find_files hidden=true <cr>" },
    { "fs", "<cmd>Telescope file_browser <cr>" },
    { "fb", "<cmd>Telescope buffers<cr>" },
    { "fh", "<cmd>Telescope help_tags<cr>" },
    { "gc", "<cmd>Telescope git_commits <cr>" },
    { "gs", "<cmd>Telescope git_status <cr>" },
    { "fb", "<cmd>Telescope buffers<cr>" },
    { "fw", "<cmd>Telescope live_grep<cr>" },
    { "ch", "<cmd>Telescope command_history<cr>" },
    { "fo", "<cmd>Telescope oldfiles<cr>" },
}

nest.applyKeymaps({
    nvim_tree,
    bufferline,
    comment,
    telescope,
    dashboard,
})


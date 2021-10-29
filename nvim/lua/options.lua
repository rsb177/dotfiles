-- shortcuts
local g= vim.g
local opt = vim.opt
local o = vim.o

-- set config path
opt.fillchars = { eob = " " }

-- enable current line highlighting
opt.cursorline = true

-- set maximum amount of completion items to 10
opt.pumheight = 10

-- set minimal number of screeen lines abow and below cursor
opt.scrolloff = 1000

-- number stuff
opt.number = true
opt.relativenumber = true
opt.numberwidth = 1

-- tab stuff
opt.tabstop = 4
opt.expandtab = true
opt.shiftwidth = 4

-- disable intro
opt.shortmess:append("sI")

-- enable terminal colors
o.termguicolors = true

opt.ignorecase = true
opt.mouse = "nv"

opt.ruler = true

opt.signcolumn = "yes"

-- make splits open to down and right
opt.splitbelow = true
opt.splitright = true

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>hl"

-- set leader key
g.mapleader = " "
opt.timeoutlen = 400

-- disable built-in plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

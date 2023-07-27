-- shortcuts
local g = vim.g
local opt = vim.opt
local o = vim.o

-- enable current line highlighting
opt.cursorline = true

-- set maximum amount of completion items to 10
-- o.pumheight = 10

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

-- Save undo history
o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

o.mouse = "a"

-- Enable break indent
o.breakindent = true

o.signcolumn = "yes"

-- Set completeopt to have a better completion experience
o.completeopt = "menuone,noselect,longest"

-- make splits open to down and right
-- opt.splitbelow = true
-- opt.splitright = true

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>hl")

-- Decrease update time
o.updatetime = 250
o.timeout = true
o.timeoutlen = 300

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

-- o.clipboard = "unnamedplus"

g.clipboard = {
  name = "WslClipboard",
  copy = { ["+"] = { "clip.exe" }, ["*"] = { "clip.exe" } },
  paste = {
    ["+"] = { "powershell.exe Get-Clipboard | tr -d '\r' | sed -z '$ s/\n$//'" },
    ["*"] = { "powershell.exe Get-Clipboard | tr -d '\r' | sed -z '$ s/\n$//'" },
  },
  cache_enabled = true,
}

-- load packer
local packer = prequire("config.packer")

if not packer then
    return
end

-- specify plugins and config
packer.startup(function(use)
    -- SELF-MANAGEMENT
    use {
        'wbthomason/packer.nvim',
        event = "VimEnter",
    }

    -- better text highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufRead',
        config = function() require('config.treesitter') end,
        run = ':TSUpdate',
    }

    -- colorscheme
    use {
        'folke/tokyonight.nvim',
        config = function() require('config.tokyonight') end,

    }

    -- UTILS

    -- collection of useful lua functions
    use {
        'nvim-lua/plenary.nvim',
    }

    -- statusline
    use {
        'hoob3rt/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        },
        config = function() require('config.lualine') end,
    }

    use{
        "akinsho/nvim-bufferline.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require('config.bufferline') end,
    }

    -- powerful keybindings creation
    use {
        'LionC/nest.nvim',
    }

    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        config = function() require('config.telescope') end,
    }

    -- dashboard on VimEnter
    use {
        'glepnir/dashboard-nvim',
        config = function() require('config.dashboard') end,
    }


    -- file manager
    use {
        'kyazdani42/nvim-tree.lua',
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function() require('config.nvimtree') end,
        requires = 'kyazdani42/nvim-web-devicons',
    }

    use "terrortylor/nvim-comment"
    require('nvim_comment').setup()

    use("folke/which-key.nvim")

    -- Install nvim-cmp, and buffer source as a dependency
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            -- "hrsh7th/vim-vsnip",
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp', },
            { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp', },
        },
        config = function() require('config.cmp') end,
    }


    -- lsp config
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('config.lsp')
            vim.defer_fn(function()
                vim.cmd("silent! e%")
            end, 0)
        end,
        after = 'cmp-nvim-lsp',
    }
    use("kabouzeid/nvim-lspinstall")

    -- great ui for lsp
    use {
        'glepnir/lspsaga.nvim',
        after = 'nvim-lspconfig',
        config = function() require('config.lspsaga') end,
    }

    -- lua lsp defaults
    use {
        'folke/lua-dev.nvim',
    }

    use{
        "onsails/lspkind-nvim",
        config = function() require('config.lspkind') end,
    }

    -- Git
    -- git diff signs
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim', },
        config = function() require('config.gitsigns') end,
        cond = function() return vim.fn.isdirectory('.git') == 1 end,
    }
end
)


return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  module = true,
  event = { "BufReadPost", "BufNewFile" },
  cmd = {
    "TSInstall",
    "TSInstallInfo",
    "TSUpdate",
    "TSBufEnable",
    "TSBufDisable",
    "TSEnable",
    "TSDisable",
    "TSModuleInfo",
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
        disable = { "python" },
      },
      ensure_installed = {
        'vim',
        'markdown',
        'markdown_inline',
        'bash',
        'regex',
        'gomod',
        'javascript',
        'typescript',
        'tsx',
        'json',
        'toml',
        'html',
        'css',
        'scss',
        'lua',
        'rust',
        'python',
        'yaml'
      },
      auto_install = true,
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
          }
        }
      }
    })
  end
}

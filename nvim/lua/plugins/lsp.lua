return {
  {
    "folke/neodev.nvim",
    opts = {
      pathStrict = false,
      library = {
        enabled = true,
        plugins = { 'none-ls' }
      }
    },
  },
  { "folke/neoconf.nvim" },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {
        -- Optional
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      {
        "hrsh7th/nvim-cmp",
        dependencies = {
          "onsails/lspkind.nvim",
        },
      },                                    -- Required
      { "hrsh7th/cmp-nvim-lsp" },           -- Required
      { "L3MON4D3/LuaSnip" },               -- Required

      { "j-hui/fidget.nvim",   opts = {} }, -- Optional
      -- Additional lua configuration, makes nvim stuff amazing!
    },
    config = function()
      local lsp = require("lsp-zero").preset({
        manage_nvim_cmp = {
          set_sources = "recommended",
          set_extra_mappings = true,
        },
      })

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })

        vim.keymap.set({ "n", "x" }, "<A-S-f>", function()
          vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
        end, { buffer = bufnr, desc = "LSP: Format code" })
      end)
      require('mason-lspconfig').setup({
        ensure_installed = {
          "lua_ls",
          "eslint",
          "pyright",
          "ruff_lsp",
          "tflint",
        }
      })

      local opts = {
        servers = {
          pyright = {
            settings = {
              python = {
                analysis = {
                  typeCheckingMode = "off",
                  autoSearchPaths = true,
                  useLibraryCodeForTypes = true,
                  diagnosticMode = "workspace",
                },
              },
            },
          },
          ruff_lsp = {
            init_options = {
              settings = {
                args = { "--max-line-length=80" },
              },
            },
          },
        },
      }
      -- (Optional) Configure lua language server for neovim
      require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls(opts))

      lsp.setup()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      cmp.setup({
        preselect = "item",
        mapping = cmp.mapping.preset.insert({
          -- ["<Tab>"] = cmp_action.tab_complete(),
          -- ["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        formatting = {
          format = lspkind.cmp_format({
            -- mode = "symbol", -- show only symbol annotations
            maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          }),
        },
        sources = {
          { name = "copilot",  group_index = 1 },
          { name = "nvim_lsp", max_item_count = 20, group_index = 1 },
          { name = "path",     max_item_count = 5,  group_index = 2 },
          { name = "buffer",   keyword_length = 2,  max_item_count = 5, group_index = 2 },
          { name = "luasnip" },
        },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>dt", "<cmd>: TroubleToggle document_diagnostics<cr>", desc = "Toggle Diagnostics" },
    },
    config = function()
      require("trouble").setup({})
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.black,
          nls.builtins.formatting.isort,
          -- nls.builtins.formatting.ruff,
          nls.builtins.formatting.packer,
          nls.builtins.formatting.prettierd,
          -- nls.builtins.formatting.taplo,
          nls.builtins.formatting.terraform_fmt,
          -- nls.builtins.diagnostics.action_lint,
          nls.builtins.diagnostics.cfn_lint,
        },
      }
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})

      vim.keymap.set({ "n", "x" }, "<Leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "LSP: [c]ode [a]ction" })
      vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "LSP: [g]oto [d]efinition" })
      vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "LSP: Peek Definition" })
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = { always_trigger = true},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  }
}

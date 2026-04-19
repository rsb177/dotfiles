return {
  { "folke/neoconf.nvim", opts = {} },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "eslint",
        "lua_ls",
        "pyright",
        "tflint",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("pyright", {
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
      })

      vim.lsp.enable({ "eslint", "lua_ls", "pyright", "tflint" })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          vim.keymap.set({ "n", "x" }, "<A-S-f>", function()
            vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
          end, { buffer = ev.buf, desc = "LSP: Format code" })
        end,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      cmp.setup({
        preselect = "item",
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
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
      { "<leader>dt", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Toggle Diagnostics" },
    },
    opts = {},
  },
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(
          ".null-ls-root", ".neoconf.json", "Makefile", ".git"
        ),
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.black,
          nls.builtins.formatting.isort,
          nls.builtins.formatting.packer,
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.terraform_fmt,
          nls.builtins.diagnostics.cfn_lint,
        },
      }
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("lspsaga").setup({})
      vim.keymap.set({ "n", "x" }, "<Leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "LSP: [c]ode [a]ction" })
      vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "LSP: [g]oto [d]efinition" })
      vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "LSP: Peek Definition" })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = { always_trigger = true },
    config = function(_, opts) require("lsp_signature").setup(opts) end,
  },
}

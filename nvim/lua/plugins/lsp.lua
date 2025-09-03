return {
  -- manage external tools (LSP servers, formatters, etc.)
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },

  -- lsp + completion stack
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- completion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      -- snippets
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      -- ===== cmp =====
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            else fallback() end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then luasnip.jump(-1)
            else fallback() end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
          { name = "luasnip" },
        },
      })

      -- ===== lsp =====
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- servers to enable
      local servers = {
        "lua_ls",
        "pyright",
        "ts_ls",      -- use ts_ls (new name) instead of deprecated tsserver
        "bashls",
        "jsonls",
        "yamlls",
        "html",
        "cssls",
      }

      -- mason bridge: ensure servers installed
      require("mason-lspconfig").setup({ ensure_installed = servers })

      -- per-server setup
      for _, s in ipairs(servers) do
        local opts = { capabilities = capabilities }
        if s == "lua_ls" then
          opts.settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
            },
          }
        end
        lspconfig[s].setup(opts)
      end

      -- (optional) basic LSP keymaps
      local map, o = vim.keymap.set, { noremap = true, silent = true }
      map("n", "gd", vim.lsp.buf.definition, o)
      map("n", "gr", vim.lsp.buf.references, o)
      map("n", "K",  vim.lsp.buf.hover, o)
      map("n", "<leader>rn", vim.lsp.buf.rename, o)
      map("n", "<leader>ca", vim.lsp.buf.code_action, o)
      map("n", "[d", vim.diagnostic.goto_prev, o)
      map("n", "]d", vim.diagnostic.goto_next, o)
    end,
  },
}


return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig"
    },
    opts = {
      ensure_installed = { "lua_ls", "tsserver" }
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup {}
      lspconfig.tsserver.setup {}

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local bufOpts = { buffer = ev.buf }
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufOpts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufOpts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, bufOpts)
        end,
      })
    end
  }
}

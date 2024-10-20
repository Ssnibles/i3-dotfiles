return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
  },
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
  opts = {
    -- ... (keep your existing opts)
  },
  config = function(_, opts)
    require("mason").setup(opts)

    require("mason-lspconfig").setup {
      automatic_installation = true,
      ensure_installed = {
        "cssls",
        "eslint",
        "html",
        "jsonls",
        "pyright",
        "tailwindcss",
        "bashls",
        -- Add other LSP servers you want to install
      },
    }

    require("mason-tool-installer").setup {
      ensure_installed = {
        "prettier",
        "stylua",
        "isort",
        "black",
        "pylint",
        "eslint_d",
        -- Add other tools you want to install
      },
    }

    -- -- Configure the Codon LSP
    -- local lspconfig = require "lspconfig"
    -- lspconfig.codon_lsp.setup {
    --   -- Specify the command to start the Codon LSP server
    --   cmd = { "path/to/codon/lsp/server" },
    --   -- Configure file types for Codon
    --   filetypes = { "codon" },
    --   -- Add any additional settings specific to the Codon LSP
    --   settings = {
    --     -- Add Codon-specific settings here
    --   },
    -- }
  end,
}

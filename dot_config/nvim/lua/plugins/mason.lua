return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
    max_concurrent_installers = 10,
  },
  config = function(_, opts)
    require("mason").setup(opts)

    require("mason-lspconfig").setup {
      automatic_installation = true,
      ensure_installed = {
        "lua_ls",
        "cssls",
        "eslint",
        "html",
        "jsonls",
        "tsserver",
        "pyright",
        "tailwindcss",
        "bashls",
        "yamlls",
        "rust_analyzer",
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
        "shellcheck",
        "shfmt",
        "luacheck",
      },
      auto_update = true,
      run_on_start = true,
    }
  end,
}

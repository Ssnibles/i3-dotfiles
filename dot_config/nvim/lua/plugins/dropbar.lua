return {
  "Bekaboo/dropbar.nvim",
  event = { "BufNewFile", "BufRead" },
  priority = 1000,
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-tree/nvim-web-devicons", -- for file icons
  },
  config = function()
    require("dropbar").setup {
      -- General settings
      color = {
        bg = "#1f2335", -- Background color of the dropbar
        fg = "#c0caf5", -- Foreground color of the dropbar
      },

      -- Keymaps
      keymaps = {
        toggle = "<leader>d", -- Toggle dropbar visibility
        jump = "<CR>", -- Jump to the selected item
      },

      -- Sources configuration
      sources = {
        path = {
          enabled = true,
          relative = false, -- Show absolute path
        },
        lsp = {
          enabled = true,
          blacklist = {}, -- List of LSP servers to ignore
        },
        treesitter = {
          enabled = true,
        },
      },

      -- Appearance
      max_width = 0.6, -- Maximum width of the dropbar (60% of window width)
      truncate = {
        left = true, -- Truncate long paths from the left
        middle = false, -- Don't truncate in the middle
      },

      -- Performance
      update_interval = 100, -- Update interval in milliseconds
    }
  end,
  -- Optional: Add commands to load the plugin
  cmd = {
    "DropbarToggle",
    "DropbarShow",
    "DropbarHide",
  },
}

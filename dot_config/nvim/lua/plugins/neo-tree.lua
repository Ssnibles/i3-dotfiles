return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
  opts = {
    filesystem = {
      follow_current_file = true,
      hijack_netrw_behavior = "open_default",
    },
    window = {
      position = "right",
      mappings = {
        ["<space>"] = "none",
      },
    },
  },
}

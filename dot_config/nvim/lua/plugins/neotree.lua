return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
    { "<leader>o", "<cmd>Neotree focus<cr>", desc = "Focus NeoTree" },
  },
  opts = {
    -- General options
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = true,

    -- Filesystem options
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
      hijack_netrw_behavior = "open_default",
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
        hide_by_name = {
          ".DS_Store",
          "thumbs.db",
          "node_modules",
        },
      },
    },

    -- Window options
    window = {
      position = "right",
      width = 30,
      mappings = {
        ["<space>"] = "none",
        ["<cr>"] = "open",
        ["o"] = "open",
        ["S"] = "open_split",
        ["s"] = "open_vsplit",
        ["C"] = "close_node",
        ["z"] = "close_all_nodes",
        ["R"] = "refresh",
        ["/"] = "fuzzy_finder",
        ["f"] = "filter_on_submit",
        ["<c-x>"] = "clear_filter",
        ["a"] = "add",
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
      },
    },

    -- Git options
    git_status = {
      symbols = {
        added = "✚",
        modified = "",
        deleted = "✖",
        renamed = "󰁕",
        untracked = "",
        ignored = "",
        unstaged = "󰄱",
        staged = "",
        conflict = "",
      },
    },

    -- Event handlers
    -- event_handlers = {
    --   {
    --     event = "file_opened",
    --     handler = function()
    --       -- Auto close
    --       require("neo-tree").close_all()
    --     end,
    --   },
    -- },
  },
}

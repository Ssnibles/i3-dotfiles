return {
  "ziontee113/icon-picker.nvim",
  dependencies = {
    "stevearc/dressing.nvim", -- For better UI
    "nvim-telescope/telescope.nvim", -- For improved icon browsing
  },
  cmd = { "IconPickerNormal", "IconPickerYank", "IconPickerInsert" },
  keys = {
    { "<Leader>i", "<cmd>IconPickerNormal<cr>", desc = "Icon Picker (Normal Mode)" },
    { "<Leader>iy", "<cmd>IconPickerYank<cr>", desc = "Icon Picker (Yank)" },
    { "<C-i>", "<cmd>IconPickerInsert<cr>", desc = "Icon Picker (Insert Mode)" },
    { "<Leader>ie", "<cmd>IconPickerInsert emoji<cr>", desc = "Emoji Picker" },
    { "<Leader>in", "<cmd>IconPickerInsert nerd_font<cr>", desc = "Nerd Font Picker" },
  },
  config = function()
    require("icon-picker").setup {
      disable_legacy_commands = true,

      -- Customize the appearance of the icon picker window
      ui = {
        border = "rounded",
        width = 0.5, -- 50% of screen width
        height = 0.7, -- 70% of screen height
        row = 0.5, -- Centered vertically
        col = 0.5, -- Centered horizontally
      },

      -- Customize icons shown by default
      icons = {
        -- Add or remove icon sets as needed
        "emoji",
        "nerd_font",
        "codicons",
        "devicons",
      },

      -- Customize the prompt
      prompt = "Pick an icon: ",

      -- Customize the search method
      search_method = "fzy", -- or "fzf" if you prefer

      -- Customize the insert behavior
      insert = {
        after_cursor = true, -- Insert after cursor position
        use_empty_line = false, -- Don't use empty line for insertion
      },

      -- Customize the mappings within the icon picker
      mappings = {
        ["<C-n>"] = "move_cursor_down",
        ["<C-p>"] = "move_cursor_up",
        ["<C-b>"] = "move_cursor_page_up",
        ["<C-f>"] = "move_cursor_page_down",
        ["<C-c>"] = "close",
      },
    }

    -- Additional custom keymaps
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<Leader>if", function()
      require("icon-picker").pick_favicon {
        callback = function(icon)
          -- Do something with the selected favicon
          print("Selected favicon: " .. icon)
        end,
      }
    end, vim.tbl_extend("force", opts, { desc = "Favicon Picker" }))
  end,
}

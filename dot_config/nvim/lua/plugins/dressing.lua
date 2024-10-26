return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      enabled = true,
      default_prompt = "Input:",
      prompt_align = "left",
      insert_only = true,
      start_in_insert = true,
      anchor = "SW",
      border = "rounded",
      relative = "cursor",

      prefer_width = 40,
      width = nil,
      max_width = { 140, 0.9 },
      min_width = { 20, 0.2 },

      win_options = {
        winblend = 10,
        wrap = true,
        list = true,
        listchars = "precedes:…,extends:…",
        sidescrolloff = 0,
      },

      mappings = {
        n = {
          ["<Esc>"] = "Close",
          ["<CR>"] = "Confirm",
        },
        i = {
          ["<C-c>"] = "Close",
          ["<CR>"] = "Confirm",
          ["<Up>"] = "HistoryPrev",
          ["<Down>"] = "HistoryNext",
        },
      },

      override = function(conf)
        conf.anchor = "NW"
        return conf
      end,

      get_config = function(opts)
        if opts.kind == "center" then
          return {
            relative = "editor",
            position = {
              row = "50%",
              col = "50%",
            },
          }
        end
      end,
    },
    select = {
      enabled = true,
      backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
      trim_prompt = true,

      telescope = require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
      },

      fzf = {
        window = {
          width = 0.5,
          height = 0.5,
        },
        winopts = {
          height = 0.5,
          width = 0.5,
        },
      },

      nui = {
        position = "50%",
        relative = "editor",
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winblend = 10,
        },
        max_width = 80,
        max_height = 40,
        min_width = 40,
        min_height = 10,
      },

      builtin = {
        show_numbers = true,
        border = "rounded",
        relative = "editor",

        win_options = {
          cursorline = true,
          cursorlineopt = "both",
          winblend = 10,
        },

        width = nil,
        max_width = { 140, 0.8 },
        min_width = { 40, 0.2 },
        height = nil,
        max_height = 0.9,
        min_height = { 10, 0.2 },

        mappings = {
          ["<Esc>"] = "Close",
          ["<C-c>"] = "Close",
          ["<CR>"] = "Confirm",
          ["<C-n>"] = "Next",
          ["<C-p>"] = "Previous",
        },
      },

      format_item_override = {
        codeaction = function(action_tuple)
          local title = action_tuple.action.title:gsub("\r\n", "\\r\\n")
          local client = action_tuple.client.name
          return string.format("%s\t[%s]", title:gsub("\n", "\\n"), client)
        end,
      },

      get_config = function(opts)
        if opts.kind == "codeaction" then
          return {
            backend = "nui",
            nui = {
              position = "50%",
              relative = "cursor",
            },
          }
        end
      end,
    },
  },
}

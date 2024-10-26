return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local dashboard = require "dashboard"
    dashboard.setup {
      theme = "doom",
      config = {
        header = {
          "                                   ",
          "                                   ",
          "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
          "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
          "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
          "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
          "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
          "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
          "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
          " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
          " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
          "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
          "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
          "                                   ",
        },
        center = {
          {
            icon = " ",
            icon_hl = "Title",
            desc = "Find File",
            desc_hl = "String",
            key = "f",
            keymap = "SPC f f",
            key_hl = "Number",
            action = function()
              require("telescope.builtin").find_files { hidden = true }
            end,
          },
          {
            icon = "󰥔 ",
            desc = "Recent Files",
            key = "r",
            keymap = "SPC f r",
            action = "Telescope oldfiles",
          },
          {
            icon = " ",
            desc = "Find Word",
            key = "w",
            keymap = "SPC f w",
            action = function()
              require("telescope.builtin").live_grep { additional_args = { "--hidden" } }
            end,
          },
          {
            icon = " ",
            desc = "Bookmarks",
            key = "b",
            keymap = "SPC f b",
            action = "Telescope marks",
          },
        },
        footer = {},
      },
    }
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}

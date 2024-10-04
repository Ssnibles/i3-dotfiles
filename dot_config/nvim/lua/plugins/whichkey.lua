return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    plugins = {
      spelling = {
        enabled = true, -- enable spelling suggestions
        suggestions = 20, -- the number of suggestions to show
      },
    },
    key_labels = {
      ["<leader>"] = "SPC", -- change the label for the leader key
      ["<cr>"] = "RET", -- change the label for the enter key
      ["<tab>"] = "TAB", -- change the label for the tab key
    },
    layout = {
      height = { min = 4, max = 25 }, -- set min and max height of the popup
      width = { min = 20, max = 50 }, -- set min and max width of the popup
      spacing = 10, -- spacing between columns
      align = "left", -- align popup to left or right
    },
    ignore_missing = true, -- ignore mappings that are missing
    show_help = true, -- show help for mappings
    triggers_blacklist = {
      n = { "<leader>" }, -- disable <leader> trigger in normal mode
      v = { "<leader>" }, -- disable <leader> trigger in visual mode
    },
  },
}

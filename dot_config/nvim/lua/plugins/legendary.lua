return {
  "mrjones2014/legendary.nvim",
  priority = 10000,
  lazy = false,
  dependencies = {
    "kkharji/sqlite.lua",
    "stevearc/dressing.nvim", -- optional, for better UI
  },
  opts = {
    extensions = {
      which_key = { auto_register = true },
      lazy_nvim = { auto_register = true },
    },
    sort = {
      -- sort most frequently used items to the top
      frecency = true,
      -- sort user-defined items before built-in items
      user_items = true,
    },
    include_builtin = true,
    include_legendary_cmds = true,
    select_prompt = " Legendary ",
    col_separator_char = "│",
  },
  keys = {
    { "<leader>l", "<cmd>Legendary<cr>", desc = "Open Legendary" },
  },
}

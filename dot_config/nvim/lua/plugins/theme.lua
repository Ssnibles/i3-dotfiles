return {
  "rose-pine/neovim",
  priority = 1000,
  event = "VeryLazy",
  name = "rose-pine",
  config = function()
    vim.cmd("colorscheme rose-pine-moon")
  end,
}
--
-- return {
--   "Shatur/neovim-ayu",
--   priority = 1000,
--   event = "UiEnter",
--   name = "ayu",
--   config = function()
--     vim.cmd("colorscheme ayu")
--   end,
-- }

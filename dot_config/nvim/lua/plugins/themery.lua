return {
  "zaldih/themery.nvim",
  dependencies = {
    { "folke/tokyonight.nvim", name = "tokyonight", lazy = false, priority = 1000, opts = { style = "night" } },
    { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
    { "rebelot/kanagawa.nvim", name = "kanagawa", lazy = false, priority = 1000 },
    { "sainnhe/sonokai", name = "sonokai", lazy = false, priority = 1000 },
    { "rose-pine/neovim", name = "rose-pine", opts = { variant = "moon" }, lazy = false, priority = 1000 },
  },
  -- keys = {
  -- 	{ "<leader>th", "<cmd>Themery<cr>", desc = "Themery" }, -- Themery
  -- },
  config = function()
    require("themery").setup {
      themes = {
        { name = "TokyoNight", colorscheme = "tokyonight" },
        { name = "Catppuccin", colorscheme = "catppuccin" },
        { name = "Kanagawa", colorscheme = "kanagawa" },
        { name = "Sonokai", colorscheme = "sonokai" },
        { name = "Rose-pine", colorscheme = "rose-pine" },
      },
      livePreview = true, -- Live Preview of theme change
    }
  end,
}

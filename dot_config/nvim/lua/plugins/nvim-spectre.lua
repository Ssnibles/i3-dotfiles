return {
  "nvim-pack/nvim-spectre",
  keys = {
    { "<leader>ss", function() require("spectre").toggle() end,                                 desc = "Toggle Spectre" },
    { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end,      desc = "Search current word" },
    { "<leader>sp", function() require("spectre").open_file_search({ select_word = true }) end, desc = "Search on current file" },
  },
  config = function()
    require("spectre").setup({
      -- Your config here (optional)
    })
  end,
}

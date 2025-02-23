return {
  "smjonas/inc-rename.nvim",
  keys = {
    { "<leader>rn", ":IncRename ", desc = "Incremental Rename" },
  },
  opts = {
    cmd_name = "IncRename",
    hl_group = "Substitute",
    preview_empty_name = false,
    show_message = true,
    save_in_cmdline_history = true,
    input_buffer_type = nil,
    post_hook = nil,
  },
  config = function(_, opts)
    require("inc_rename").setup(opts)
  end,
}

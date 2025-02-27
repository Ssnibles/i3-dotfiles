return {
  "smjonas/inc-rename.nvim",
  keys = {
    { "<leader>rn", ":IncRename ", desc = "Rename LSP Identifier" },
  },
  otps = {
    cmd_name = "IncRename",
    hl_group = "Substitute",
    show_message = true,
    save_in_cmdline_history = true,
  },
}

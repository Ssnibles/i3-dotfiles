return {
  "saghen/blink.cmp",
  event = "LspAttach",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "*",
  opts = {
    keymap = {
      preset = "super-tab",
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      menu = {
        border = "single", -- none, single, double, rounded, solid
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = { border = "single" }, -- none, single, double, rounded, solid
      },
      ghost_text = {
        enabled = true,
      },
    },
    cmdline = {
      enabled = false,
    },
    signature = {
      window = { border = "single" }, -- none, single, double, rounded, solid
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "cmdline" },
    },
  },
}

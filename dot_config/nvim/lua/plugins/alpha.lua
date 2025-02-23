return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")

    -- Header
    dashboard.section.header.val = {
      "$ųçķ mý bäłł§  ( ͡° ͜ʖ ͡°)",
      "",
    }

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    -- Footer
    dashboard.section.footer.val = {
      "Happy coding!",
      "⚡ Neovim is loading..."
    }
    dashboard.section.footer.opts.hl = "Type"

    -- Layout
    dashboard.config.layout = {
      { type = "padding", val = 10 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    dashboard.config.opts.noautocmd = true

    return dashboard
  end,
  config = function(_, dashboard)
    require("alpha").setup(dashboard.config)

    -- Update footer after Lazy has started
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

        dashboard.section.footer.val = {
          string.format("⚡ Neovim loaded %d plugins in %.2fms", stats.count, ms),
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}

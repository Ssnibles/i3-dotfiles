return {
  "gelguy/wilder.nvim",
  event = "CmdlineEnter",
  dependencies = {
    "romgrk/fzy-lua-native",
  },
  config = function()
    local wilder = require "wilder"
    wilder.setup { modes = { ":", "/", "?" } }

    -- Fuzzy matching and autocorrection
    wilder.set_option("pipeline", {
      wilder.branch(
        wilder.cmdline_pipeline {
          fuzzy = 1,
          fuzzy_filter = wilder.lua_fzy_filter(),
          debounce = 10,
        },
        wilder.vim_search_pipeline()
      ),
    })

    -- Customize the renderer
    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
        highlights = {
          border = "Normal",
          accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
        },
        border = "rounded",
        left = { " ", wilder.popupmenu_devicons() },
        right = { " ", wilder.popupmenu_scrollbar() },
        highlighter = wilder.lua_fzy_highlighter(),
        max_height = "50%",
        min_height = 0,
        prompt_position = "top",
        reverse = 0,
      })
    )

    -- Enable autocorrection
    wilder.set_option("enable_autocorrect", 1)

    -- Key mappings
    vim.api.nvim_set_keymap("c", "<Tab>", [[wilder#in_context() ? wilder#next() : '<Tab>']], { noremap = true, expr = true })
    vim.api.nvim_set_keymap("c", "<S-Tab>", [[wilder#in_context() ? wilder#previous() : '<S-Tab>']], { noremap = true, expr = true })
  end,
}

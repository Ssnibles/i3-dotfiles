return {
  "Bekaboo/dropbar.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    local ok, dropbar = pcall(require, "dropbar")
    if not ok then
      vim.notify("dropbar.nvim not found", vim.log.levels.WARN)
      return
    end

    dropbar.setup {
      bar = {
        enable = true,
        update_debounce = 100,
      },
      icon = {
        enable = true,
        kinds = {
          file_icon = true,
          -- You can customize the symbols here if needed
        },
      },
      bar = {
        sources = function(buf, _)
          local sources = require "dropbar.sources"
          if vim.bo[buf].ft == "markdown" then
            return { sources.path, sources.markdown }
          elseif vim.bo[buf].buftype == "terminal" then
            return { sources.terminal }
          else
            return {
              sources.path,
              sources.treesitter,
              sources.lsp,
            }
          end
        end,
        padding = { left = 1, right = 1 },
      },
      menu = {
        preview = true,
        quick_navigation = true,
        entry = {
          padding = { left = 1, right = 1 },
        },
        scrollbar = {
          enable = true,
          background = true,
        },
        keymaps = {
          -- Add custom keymaps here if needed
        },
      },
    }

    -- Custom keymaps
    vim.keymap.set("n", "<leader>db", function()
      if dropbar.pick then
        dropbar.pick()
      else
        vim.notify("dropbar.pick not available", vim.log.levels.WARN)
      end
    end, { noremap = true, silent = true, desc = "Dropbar pick" })
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- for file icons
  },
}

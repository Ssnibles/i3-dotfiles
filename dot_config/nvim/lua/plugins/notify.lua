return {
  "rcarriga/nvim-notify",
  lazy = "VeryLazy",
  config = function()
    local notify = require "notify"

    -- Set up notify
    notify.setup {
      -- Animation style (see below for details)
      stages = "slide",

      -- Default timeout for notifications
      timeout = 3000,

      -- For stages that change opacity, this is treated as the highlight behind the window
      -- background_colour = "#00FFFFFF",

      -- Icons for the different levels
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "󱍼",
      },

      -- Minimum width for notification windows
      minimum_width = 35,

      -- Render function for notifications. See notify-render()
      render = "default",

      -- Max number of columns for messages
      max_width = 35,
      -- Max number of lines for a message
      max_height = nil,

      -- Function called when a new window is opened, use for changing win settings/config
      on_open = nil,

      -- Function called when a window is closed
      on_close = nil,

      -- Render function for notifications. See notify-render()
      render = "default",

      -- Highlight behind the window for stages that change opacity
      -- background_colour = "Normal",

      -- Top down strategy
      top_down = true,
    }

    -- Set notify as the default notify function
    vim.notify = notify

    -- Create a command to dismiss all notifications
    vim.api.nvim_create_user_command("NotifyDismiss", function()
      notify.dismiss { silent = true, pending = true }
    end, {})

    -- Optional: Set up key mappings
    vim.keymap.set("n", "<leader>nd", ":NotifyDismiss<CR>", { silent = true, desc = "Dismiss all notifications" })
    vim.keymap.set("n", "<leader>nh", function()
      notify.history()
    end, { silent = true, desc = "Show notification history" })

    -- Optional: Custom highlight groups
    vim.cmd [[
      highlight NotifyERRORBorder guifg=#8A1F1F
      highlight NotifyWARNBorder guifg=#79491D
      highlight NotifyINFOBorder guifg=#4F6752
      highlight NotifyDEBUGBorder guifg=#8B8B8B
      highlight NotifyTRACEBorder guifg=#4F3552
      highlight NotifyERRORIcon guifg=#F70067
      highlight NotifyWARNIcon guifg=#F79000
      highlight NotifyINFOIcon guifg=#A9FF68
      highlight NotifyDEBUGIcon guifg=#8B8B8B
      highlight NotifyTRACEIcon guifg=#D484FF
      highlight NotifyERRORTitle guifg=#F70067
      highlight NotifyWARNTitle guifg=#F79000
      highlight NotifyINFOTitle guifg=#A9FF68
      highlight NotifyDEBUGTitle guifg=#8B8B8B
      highlight NotifyTRACETitle guifg=#D484FF
      highlight link NotifyERRORBody Normal
      highlight link NotifyWARNBody Normal
      highlight link NotifyINFOBody Normal
      highlight link NotifyDEBUGBody Normal
      highlight link NotifyTRACEBody Normal
    ]]

    -- Optional: Example usage
    notify("Welcome Traveler", "info", {
      -- title = "Notification Title",
      timeout = 3000,
      render = "compact",
    })
  end,
}

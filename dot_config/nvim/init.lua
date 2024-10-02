--    __    _     __        __           __             _
--   / /__ (_)___/ /__ ___ / /____ _____/ /_  ___ _  __(_)_ _
--  /  '_// / __/  '_/(_-</ __/ _ `/ __/ __/ / _ \ |/ / /  ' \
-- /_/\_\/_/\__/_/\_\/___/\__/\_,_/_/  \__(_)_//_/___/_/_/_/_/

vim.loader.enable()

require "binds"
require "settings"
require "autocommands"
--  To check the current status of your plugins, run
--    :Lazy
--  To update plugins you can run
--    :Lazy update

-- All lazy plugins can be found in the lua/plugins folder

-- Bootstrap lazy plugin manager
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy
require("lazy").setup {
  spec = {
    -- Import plugins from folder
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- Colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- Automatically check for plugin updates
  checker = { enabled = true },
}

ui = {
  -- If you are using a Nerd Font: set icons to an empty table which will use the
  -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
  icons = vim.g.have_nerd_font and {} or {
    cmd = "⌘",
    config = "🛠",
    event = "📅",
    ft = "📂",
    init = "⚙",
    keys = "🗝",
    plugin = "🔌",
    runtime = "💻",
    require = "🌙",
    source = "📄",
    start = "🚀",
    task = "📌",
    lazy = "💤 ",
  },
}

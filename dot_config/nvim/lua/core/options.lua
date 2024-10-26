--            __  __  _
--   ___ ___ / /_/ /_(_)__  ___ ____
--  (_-</ -_) __/ __/ / _ \/ _ `(_-<
-- /___/\__/\__/\__/_/_//_/\_, /___/
--                        /___/

-- Neovim and Neovide Configuration

-- Global settings
local global = vim.g
local option = vim.opt

-- Neovide-specific settings
if global.neovide then
  -- Font settings
  global.neovide_font_size = 14
  global.neovide_font = "JetBrainsMono Nerd Font"

  -- Appearance
  global.neovide_transparency = 1.0
  global.neovide_padding_top = 10
  global.neovide_padding_bottom = 0
  global.neovide_padding_left = 10
  global.neovide_padding_right = 10
  global.neovide_floating_shadow = false
  global.neovide_scale_factor = 0.85

  -- Animations
  global.neovide_scroll_animation_length = 0.3
  global.neovide_cursor_animation_length = 0.13
  global.neovide_cursor_trail_length = 0.8
  global.neovide_cursor_antialiasing = true
  global.neovide_cursor_vfx_mode = "railgun"
  global.neovide_cursor_vfx_opacity = 200.0
  global.neovide_cursor_vfx_particle_lifetime = 1.2
  global.neovide_cursor_vfx_particle_density = 7.0
  global.neovide_cursor_vfx_particle_speed = 10.0
  global.neovide_cursor_animate_in_insert_mode = true
  global.neovide_cursor_animate_command_line = true
  global.neovide_position_animation_length = 0

  -- Smooth input
  global.neovide_input_use_logo = true -- enable use of the logo (cmd) key
  global.neovide_input_macos_alt_is_meta = true

  -- Performance
  global.neovide_no_idle = true
  global.neovide_rendering = "opengl"

  -- Window settings
  global.neovide_fullscreen = false
  global.neovide_remember_window_size = false
  global.neovide_profiler = false -- disable profiler for better performance
end

-- General Neovim settings
global.have_nerd_font = true

-- Editor behavior
option.number = true
option.relativenumber = true
option.clipboard = "unnamedplus"
option.syntax = "on"
option.autoindent = true
option.smartindent = true
option.expandtab = true
option.shiftwidth = 2
option.tabstop = 2
option.softtabstop = 2

-- Appearance
option.signcolumn = "yes"
option.cursorline = true
option.termguicolors = true
-- option.colorcolumn = "80"
option.list = true
option.listchars = { tab = "» ", trail = "·" }

-- Search
option.ignorecase = true
option.smartcase = true
option.hlsearch = true
option.incsearch = true

-- Performance
option.lazyredraw = true
option.updatetime = 300

-- File handling
option.autoread = true
option.backup = false
option.writebackup = false
option.swapfile = false

-- Miscellaneous
option.mouse = "a"
option.hidden = true
option.history = 1000
option.scrolloff = 8
option.sidescrolloff = 8
option.wildmenu = true
option.wildmode = "longest:full,full"
option.completeopt = "menuone,noselect"

-- Split behavior
option.splitright = true
option.splitbelow = true

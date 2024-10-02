--            __  __  _
--   ___ ___ / /_/ /_(_)__  ___ ____
--  (_-</ -_) __/ __/ / _ \/ _ `(_-<
-- /___/\__/\__/\__/_/_//_/\_, /___/
--                        /___/

-- Vim options can be declared with:
-- o.<OPTION>

-- See `:help o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

local global = vim.g
local option = vim.opt

global.have_nerd_font = true

option.number = true -- Show line numbers
option.relativenumber = true -- Show relative line numbers
option.clipboard = "unnamedplus" -- uses the clipboard register for all operations except yank.
option.syntax = "on" -- When this option is set, the syntax with this name is loaded.
option.autoindent = true -- Copy indent from current line when starting a new line.
option.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
option.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
option.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent.
option.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for.
option.encoding = "UTF-8" -- Sets the character encoding used inside Vim.
option.ruler = true -- Show the line and column number of the cursor position, separated by a comma.
option.mouse = "a" -- Enable the use of the mouse. "a" you can use on all modes
option.title = true -- When on, the title of the window will be set to the value of 'titlestring'
option.hidden = true -- When on a buffer becomes hidden when it is |abandon|ed
option.ttimeoutlen = 0 -- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
option.wildmenu = true -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
option.showcmd = true -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
option.showmatch = true -- When a bracket is inserted, briefly jump to the matching one.
option.inccommand = "split" -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
option.splitright = true
option.splitbelow = true -- When on, splitting a window will put the new window below the current one
option.termguicolors = true

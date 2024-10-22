--             __                                         __
--  ___ ___ __/ /____  _______  __ _  __ _  ___ ____  ___/ /__
-- / _ `/ // / __/ _ \/ __/ _ \/  ' \/  ' \/ _ `/ _ \/ _  (_-<
-- \_,_/\_,_/\__/\___/\__/\___/_/_/_/_/_/_/\_,_/_//_/\_,_/___/

--  see `:help lua-guide-autocommands`

-- Define the "currentline" sign
vim.fn.sign_define("currentline", { text = "▶", texthl = "LineNr" })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 300 }
  end,
})

-- Highlight current line
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  desc = "Highlight current line",
  group = vim.api.nvim_create_augroup("highlight-current-line", { clear = true }),
  callback = function()
    local current_line = vim.fn.line "."
    vim.fn.sign_unplace "currentlinegroup"
    if vim.fn.sign_getdefined("currentline")[1] then
      vim.fn.sign_place(0, "currentlinegroup", "currentline", vim.fn.bufname(), { lnum = current_line })
    end
  end,
})

-- Auto-resize splits when Vim is resized
vim.api.nvim_create_autocmd("VimResized", {
  desc = "Auto-resize splits when Vim is resized",
  group = vim.api.nvim_create_augroup("resize-splits", { clear = true }),
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Remove trailing whitespace on save",
  group = vim.api.nvim_create_augroup("remove-trailing-whitespace", { clear = true }),
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos "."
    vim.cmd [[%s/\s\+$//e]]
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Auto-reload files when changed externally
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  desc = "Auto-reload files when changed externally",
  group = vim.api.nvim_create_augroup("auto-reload-file", { clear = true }),
  pattern = "*",
  callback = function()
    if not vim.bo.readonly and vim.fn.bufname() ~= "" and vim.fn.filereadable(vim.fn.expand "%") then
      vim.cmd "checktime"
    end
  end,
})

-- Set wrap and spell for text filetypes
vim.api.nvim_create_autocmd("FileType", {
  desc = "Set wrap and spell for text filetypes",
  group = vim.api.nvim_create_augroup("text-wrap-spell", { clear = true }),
  pattern = { "markdown", "txt", "tex" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Auto-format on save for specific filetypes
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Auto-format on save for specific filetypes",
  group = vim.api.nvim_create_augroup("auto-format", { clear = true }),
  pattern = { "*.lua", "*.py", "*.js", "*.ts", "*.jsx", "*.tsx" },
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})

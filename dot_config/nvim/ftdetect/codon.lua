vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.codon",
  callback = function()
    vim.bo.filetype = "codon"
  end,
})

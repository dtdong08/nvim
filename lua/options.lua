require "nvchad.options"

vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/personal-snippets"

vim.api.nvim_create_autocmd({'BufReadPost'}, {
  desc = 'return cursor to where it was last time closing the file',
  pattern = '*',
  command = 'silent! normal! g`"zv',
})

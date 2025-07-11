require "nvchad.options"

vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/personal-snippets"

vim.api.nvim_create_autocmd({'BufReadPost'}, {
  desc = 'return cursor to where it was last time closing the file',
  pattern = '*',
  command = 'silent! normal! g`"zv',
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		if not vim.api.nvim_buf_get_option(bufnr, "modifiable") then
			return
		end

		local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 10, false)
		local updated = false
		local timestamp = os.date("%H:%M:%S %d/%m/%Y")

		for i, line in ipairs(lines) do
			if line:lower():match("^//%s*last modified%s*:") then
				lines[i] = "// Last modified : " .. timestamp
				updated = true
				break
			end
		end

		if updated then
			vim.api.nvim_buf_set_lines(bufnr, 0, 10, false, lines)
		end
  end,
})

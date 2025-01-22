require "nvchad.mappings"

local map = vim.keymap.set

map('n', '<A-c>', function ()
	local existingTerm = false

	local runCmds = {
		cpp = "source ~/.zshrc && gpp " .. vim.fn.expand("%:p"),
		python = "python3 " .. vim.fn.expand("%:p"),
		js = "node " .. vim.fn.expand("%:p")
	}

	if not existingTerm then
		require("nvchad.term").new {
			pos = "sp",
			size = 0.5,
			id = 188,
			cmd = function ()
				return runCmds[vim.bo.ft]
			end
		}
		existingTerm = true
	else
		vim.api.nvim_chan_send(188, "exit")
		existingTerm = false
	end
end, { desc = "compile and run current file" })


require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "quick enter command mode" }) -- i am lazy to click Shift

-- map('n', '<leader>cc', '<cmd>term g++-12 -pedantic-errors -ggdb -std=c++2b -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -o %:p:r.exe %:p && %:p:r.exe<CR>', { desc = "compile and run current c++ file" })

-- map('n', '<A-c>', function ()
-- 	require("nvchad.term").toggle {
-- 		pos = "sp",
-- 		size = 0.4,
-- 		id = "code_runner_lmao",
-- 		cmd = function ()
-- 			local file = vim.fn.expand("%:p")
-- 			local file_exe = vim.fn.expand("%:p:r") .. ".exe"
-- 			local runCmds = {
-- 				cpp = "clear && g++-12 -pedantic-errors -ggdb -std=c++2b -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -o " .. file_exe .. " " .. file .. "&& " .. file_exe,
-- 				python = "python3 " .. file
-- 			}
-- 			return runCmds[vim.bo.ft]
-- 		end
-- 	}
-- end, { desc = "compile and run current file" })

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
			id = "code_runner",
			cmd = function ()
				return runCmds[vim.bo.ft]
			end
		}
		existingTerm = true
	else 
		vim.api.nvim_chan_send("code_runner", "exit")
		existingTerm = false
	end
end, { desc = "compile and run current file" })


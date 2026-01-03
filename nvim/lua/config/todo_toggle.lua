local M = {}

function M.setup()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "markdown",
		callback = function()
			-- Toggle TODO checkbox
			vim.keymap.set("n", "<leader>tt", function()
				local line = vim.api.nvim_get_current_line()

				if line:match("^%s*%- %[ %]") then
					line = line:gsub("^%s*%- %[ %]", "- [x]")
				elseif line:match("^%s*%- %[x%]") then
					line = line:gsub("^%s*%- %[x%]", "- [ ]")
				else
					line = "- [ ] " .. line
				end

				vim.api.nvim_set_current_line(line)
			end, { buffer = true, desc = "Toggle Markdown TODO checkbox" })

			-- Insert Markdown link template
			vim.keymap.set("n", "<leader>kk", function()
				-- Insert []() and move cursor inside ()
				vim.api.nvim_put({ "[]()" }, "c", true, true)
				-- Move cursor inside parentheses
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("hhi", true, false, true), "n", true)
			end, { buffer = true, desc = "Insert Markdown link template" })

			-- Insert bold text template
			vim.keymap.set("n", "<leader>bb", function()
				-- Insert **** and move cursor between middle **
				vim.api.nvim_put({ "****" }, "c", true, true)
				-- Move cursor left twice to be between the stars
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("hi", true, false, true), "n", true)
			end, { buffer = true, desc = "Insert Markdown bold template" })
		end,
	})
end

return M

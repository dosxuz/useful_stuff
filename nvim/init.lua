-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
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

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "c", "cpp", "python", "markdown", "lua" },
	callback = function()
		vim.treesitter.start()
	end,
	once = true,
})

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 2,
	},
	underline = true,
	signs = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
	},
})

require("vim-options")
require("lazy").setup("plugins")
require("config.todo_toggle").setup()

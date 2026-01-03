return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 2000,
    config = function()
        vim.cmd.colorscheme("catppuccin")
    end,
}

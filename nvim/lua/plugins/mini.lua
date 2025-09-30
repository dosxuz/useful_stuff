return {
    "nvim-mini/mini.nvim",
    branch = "main", -- Use stable branch
    -- Or, for the latest development version:
    -- branch = "main",
    config = function()
        require("mini.move").setup()
        -- You can also add setup calls for other mini modules here
    end,
}

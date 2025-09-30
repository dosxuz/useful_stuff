return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "master",
    configs = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            auto_install = true,
            ensure_installed = { "lua", "javascript", "python", "c", "cpp", "go", "markdown" },
            sync_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}

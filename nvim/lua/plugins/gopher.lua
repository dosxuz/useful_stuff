return {
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        -- branch = "develop",
        config = function(_, opts)
            require("gopher").setup(opts)
            -- Set up key mappings (Corrected)
            vim.keymap.set("n", "<leader>gs", function()
                vim.cmd("GoTagAdd json")
            end, { desc = "Gopher: Add json tags" }) -- For adding struct tags
            vim.keymap.set("n", "<leader>gy", function()
                vim.cmd("GoTagAdd yaml")
            end, { desc = "Gopher: Add yaml tags" }) -- For adding yaml tags
            vim.keymap.set("n", "<leader>gi", function()
                vim.cmd("GoImpl")
            end, { desc = "Gopher: Implement Interface" }) -- For implementing interfaces
            vim.keymap.set("n", "<leader>gt", function()
                vim.cmd("GoTestAdd")
            end, { desc = "Gopher: Generate Test" }) -- For generating unit tests for a function
            vim.keymap.set("n", "<leader>ga", function()
                vim.cmd("GoTestsAll")
            end, { desc = "Gopher: Generate All Tests" }) -- For generating all tests
            vim.keymap.set("n", "<leader>gf", function()
                vim.cmd("GoIfErr")
            end, { desc = "Gopher: Generate If Err" }) -- For generating if err checks
            vim.keymap.set("n", "<leader>gc", function()
                vim.cmd("GoCmt")
            end, { desc = "Gopher: Generate Comment" }) -- For generating comments
        end,
        build = function()
            vim.cmd([[silent! GoInstallDeps]])
        end,
    },
}

return {
    -- PERF:
    -- HACK:
    -- TODO:
    -- NOTE:
    -- FIX:
    -- WARNING:
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("todo-comments").setup({
            signs = false,
            merge_keywords = true,
            pattern = [[\b(KEYWORDS)(?:\(([^)]*)\))?:]],
            keywords = {
                FIX = {
                    icon = " ",
                    color = "#e78284",
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "TOFIX" },
                },
                TODO = {
                    icon = " ",
                    color = "#8caaee",
                },
                HACK = {
                    icon = " ",
                    color = "#e5c890",
                },
                WARN = {
                    icon = " ",
                    color = "#e5c890",
                    alt = { "WARNING", "XXX" },
                },
                PERF = {
                    icon = " ",
                    color = "#babbf1",
                    alt = { "OPTIM", "OPTIMIZE", "PERFORMANCE" },
                },
                NOTE = {
                    icon = "󰍩 ",
                    color = "#a6d189",
                    alt = { "INFO" },
                },
                TEST = {
                    icon = "󰙨 ",
                    color = "#f4b8e4",
                    alt = { "TESTING", "PASSED", "FAILED" },
                },
            },
            gui_style = {
                fg = "NONE",
                bg = "BOLD",
            },
            highlight = {
                keyword = "wide",
                pattern = {
                    [[.*<(KEYWORDS)\s*:]],
                    [[.*<(KEYWORDS)\s*!?\(\):]],
                    [[.*<(KEYWORDS)\s* ?\(.*\):]],
                    [[.*<(KEYWORDSky)\s*:]],
                },
            },
        })
		vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "[F]ind [R]ecent" })
    end,
}

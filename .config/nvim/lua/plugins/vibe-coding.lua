return {
    {
        "zbirenbaum/copilot.lua", -- not actually the offical copilot plugin by ms
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    {
        {
            "CopilotC-Nvim/CopilotChat.nvim",
            dependencies = {
                { "nvim-lua/plenary.nvim", branch = "master" },
            },
            opts = {
                -- See Configuration section for options
            },
            keys = {
                { "<leader>ai", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot [A][I]" },
                { "<leader>am", ":CopilotChatModels<CR>", mode = "n", desc = "Pick Copilot [A]i [M]odel to use" },
                { "<leader>ae", ":CopilotChatExplain<CR>", mode = "v", desc = "Ask Copilot [A]i to [E]xplain code" },
                { "<leader>af", ":CopilotChatReview<CR>", mode = "v", desc = "Ask Copilot [A]i to [R]eview the code" },
                { "<leader>ao", ":CopilotChatOptimise<CR>", mode = "v", desc = "Ask Copilot [A]i to [O]timise code" },
                { "<leader>af", ":CopilotChatFix<CR>", mode = "v", desc = "Ask Copilot [A]i to [F]ix any errors" },
            },
        },
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end,
    },
}

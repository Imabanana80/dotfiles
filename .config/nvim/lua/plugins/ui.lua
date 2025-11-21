return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy", -- Or `LspAttach`
        priority = 1000, -- needs to be loaded in first
        config = function()
            require("tiny-inline-diagnostic").setup()
            vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>fk",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "[F]ind [K]eymaps",
            },
        },
    },
    {
        {
            "uga-rosa/ccc.nvim",
            config = function()
                require("ccc").setup({
                    highlighter = {
                        auto_enable = true,
                        lsp = true,
                    },
                })
            end,
        },
    },
    {
        "sphamba/smear-cursor.nvim",
        opts = {},
    },
    {
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup({})
        end,
    },
    {
        "Fildo7525/pretty_hover",
        event = "LspAttach",
        opts = {},
    },
}

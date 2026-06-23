return {
    {
        "petertriho/nvim-scrollbar",
        opts = {}
    },
    {
        "brenoprata10/nvim-highlight-colors",
        opts = {}
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {{ "<leader>fk", function() require("which-key").show({ global = false }) end, desc = "[F]ind [K]eymaps"}},
    },
}

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            integrations = {
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = true,
                },
            },
        })
        vim.cmd.colorscheme("catppuccin-macchiato")
    end,
}

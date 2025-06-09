return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            },
        })
        require("nvim-ts-autotag").setup({
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = false,
            },
            per_filetype = {
                ["html"] = {
                    enable_close = false,
                },
            },
        })
    end,
}

return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "onsails/lspkind.nvim",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                    --{ name = "copilot" }, disabled copilot bc holy fuck im going crazy with these garbage completions
                }),
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = {
                            menu = 50, -- leading text (labelDetails)
                            abbr = 50, -- actual suggestion item
                        },
                        ellipsis_char = "...",
                        show_labelDetails = true,

                        before = function(entry, vim_item)
                            return vim_item
                        end,
                    }),
                },
            })
        end,
    },
}

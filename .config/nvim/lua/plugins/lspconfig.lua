return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    --lsp
                    "lua_ls",
                    "rust_analyzer",
                    "html",
                    "astro",
                    "cssls",
                    "tailwindcss",
                    "ts_ls",
                    "dockerls",
                    "gopls",
                    "jsonls",
                    "basedpyright",
                    "svelte",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "stevearc/conform.nvim",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            local opts = { capabilities = capabilities }
            lspconfig.lua_ls.setup(opts)
            lspconfig.rust_analyzer.setup(opts)
            lspconfig.html.setup(opts)
            lspconfig.astro.setup(opts)
            lspconfig.cssls.setup(opts)
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
                settings = {
                    tailwindCSS = {
                        experimental = {
                            classRegex = {
                                { 'add="([^"]*)"', "[^\\s]+" },
                                { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                                { "classnames\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                            },
                        },
                    },
                },
            })
            lspconfig.ts_ls.setup(opts)
            lspconfig.dockerls.setup(opts)
            lspconfig.gopls.setup(opts)
            lspconfig.jsonls.setup(opts)
            lspconfig.basedpyright.setup(opts)
            lspconfig.svelte.setup(opts)

            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    rust = { "rustfmt", lsp_format = "fallback" },
                    astro = { "prettierd", "prettier", stop_after_first = true },
                    html = { "prettierd", "prettier", stop_after_first = true },
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                    typescript = { "prettierd", "prettier", stop_after_first = true },
                    json = { "jq" },
                    go = { "gofmtpt" },
                },
                format_on_save = {
                    timeout_ms = 3000,
                },
            })

            vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { desc = "[H]over" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition" })
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]o to [D]eclaration" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
            vim.keymap.set("n", "<leader>cf", require("conform").format, { desc = "[C]ode [F]ormat" })
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then
                        return
                    end
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = args.buf,
                            callback = function()
                                require("conform").format({ bufnr = args.buf, id = client.id })
                            end,
                        })
                    end
                end,
            })
        end,
    },
}

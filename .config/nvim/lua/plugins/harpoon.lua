return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "[A]dd mark" })
        vim.keymap.set("n", "<leader>m", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon [M]arks" })

        vim.keymap.set("n", "<leader>1", function()
            harpoon:list():select(1)
        end, { desc = "Mark [1]" })
        vim.keymap.set("n", "<leader>2", function()
            harpoon:list():select(2)
        end, { desc = "Mark [2]" })
        vim.keymap.set("n", "<leader>3", function()
            harpoon:list():select(3)
        end, { desc = "Mark [3]" })
        vim.keymap.set("n", "<leader>4", function()
            harpoon:list():select(4)
        end, { desc = "Mark [4]" })

        vim.keymap.set("n", "<leader>hp", function()
            harpoon:list():prev()
        end, { desc = "[H]arpoon [P]revious" })
        vim.keymap.set("n", "<leader>hn", function()
            harpoon:list():next()
        end, { desc = "[H]arpoon [N]ext" })
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers")
                .new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                })
                :find()
        end

        vim.keymap.set("n", "<leader>fm", function()
            toggle_telescope(harpoon:list())
        end, { desc = "[F]ind [M]arks" })
    end,
}

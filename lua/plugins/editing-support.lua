return { 
    {
        -- https://github.com/nvim-treesitter/nvim-treesitter-context
        "nvim-treesitter/nvim-treesitter-context",
        config = function ()
            local treesitter = require ("treesitter-context")

            treesitter.setup{
                enable = true,
                max_lines = 1,
            }

            vim.keymap.set("n", "[c", function()
                treesitter.go_to_context(vim.v.count1)
            end, { silent = true })

        end
    }
}

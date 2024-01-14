return {
    {
        -- https://github.com/numToStr/Comment.nvim
        'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            -- https://github.com/numToStr/Comment.nvim?tab=readme-ov-file#configuration-optional
            require('Comment').setup()
        end
    },
    {
        -- https://github.com/folke/todo-comments.nvim
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function ()
            local todo = require('todo-comments')

            todo.setup()

            vim.keymap.set('n', '<leader>td', '<cmd>TodoTrouble<cr>')
        end
    }
}

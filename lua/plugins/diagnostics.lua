return {
    -- https://github.com/folke/trouble.nvim
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local trouble = require("trouble")

        trouble.setup()

        vim.keymap.set("n", "<leader>tt", function()
            trouble.open("workspace_diagnostics");
        end)

        vim.keymap.set("n", "gr", function()
            trouble.toggle("lsp_references");
        end)

        -- Diagnostic Jumps
        vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
        vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

        -- vim.keymap.set('n', "<C-n>", function()
        --     trouble.open("workspace_diagnostics");
        --     trouble.next({ skip_groups = true, jump = true });
        -- end)
        --
        -- vim.keymap.set('n', "<C-p>", function()
        --     trouble.open("workspace_diagnostics");
        --     trouble.previous({ skip_groups = true, jump = true });
        -- end)
    end
}

return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        local luasnip = require('luasnip')

        vim.keymap.set({ "i" }, "<C-k>", function() luasnip.expand() end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<tab>", function() luasnip.jump(1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<S-tab>", function() luasnip.jump(-1) end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-e>", function()
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            end
        end, { silent = true })
    end
}

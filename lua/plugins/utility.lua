return {
    {
        -- https://github.com/xiyaowong/link-visitor.nvim
        "xiyaowong/link-visitor.nvim",
        config = function ()
            local lv = require("link-visitor")

            lv.setup({
                silent = true,
                skip_confirmation = true,
                border = "solid"
            })

            vim.keymap.set("n", "ge", function ()
                lv.link_nearest()
            end
            )
        end
    }
}

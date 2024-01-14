return {
    {
        -- https://github.com/nvim-treesitter/nvim-treesitter
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "astro",
                    "comment",
                    "css",
                    "dockerfile",
                    "gitcommit",
                    "gitignore",
                    "javascript",
                    "jsdoc",
                    "json",
                    "lua",
                    "luadoc",
                    "luap",
                    "markdown",
                    "query",
                    "regex",
                    "sql",
                    "ssh_config",
                    "toml",
                    "tsx",
                    "typescript",
                    "yaml",
                    "vim",
                    "vimdoc",
                    "html"
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        -- https://github.com/NvChad/nvim-colorizer.lua
        'NvChad/nvim-colorizer.lua',
        config = function()
            require("colorizer").setup({
                filetypes = { "*" },
                user_default_options = {
                    RGB = true,          -- #RGB hex codes
                    RRGGBB = true,       -- #RRGGBB hex codes
                    names = true,        -- "Name" codes like Blue or blue
                    RRGGBBAA = false,    -- #RRGGBBAA hex codes
                    AARRGGBB = false,    -- 0xAARRGGBB hex codes
                    rgb_fn = false,      -- CSS rgb() and rgba() functions
                    hsl_fn = false,      -- CSS hsl() and hsla() functions
                    css = false,         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                    css_fn = false,      -- Enable all CSS *functions*: rgb_fn, hsl_fn
                    -- Available modes for `mode`: foreground, background,  virtualtext
                    mode = "background", -- Set the display mode.
                    -- Available methods are false / true / "normal" / "lsp" / "both"
                    -- True is same as normal
                    tailwind = true,                                 -- Enable tailwind colors
                    -- parsers can contain values used in |user_default_options|
                    sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
                    virtualtext = "■",
                    -- update color values even if buffer is not focused
                    -- example use: cmp_menu, cmp_docs
                    always_update = true
                },
                -- all the sub-options of filetypes apply to buftypes
                buftypes = {},
            })
        end
    },
    {
        -- https://github.com/laytan/tailwind-sorter.nvim
        'laytan/tailwind-sorter.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
        build = 'cd formatter && npm i && npm run build',
        config = function()
            require('tailwind-sorter').setup({
                on_save_enabled = true
            })
        end,
    },
}

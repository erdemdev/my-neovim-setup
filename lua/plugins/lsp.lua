return {
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    dependencies = {
        -- https://github.com/folke/neodev.nvim
        "folke/neodev.nvim",
        -- https://github.com/williamboman/mason.nvim
        "williamboman/mason.nvim",
        -- https://github.com/williamboman/mason-lspconfig.nvim
        "williamboman/mason-lspconfig.nvim",
        -- https://github.com/hrsh7th/nvim-cmp
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        -- https://github.com/SergioRibera/cmp-dotenv
        "SergioRibera/cmp-dotenv",
        -- https://github.com/L3MON4D3/LuaSnip
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        -- https://github.com/j-hui/fidget.nvim
        "j-hui/fidget.nvim",
        --https://github.com/onsails/lspkind.nvim
        "onsails/lspkind.nvim",
    },
    config = function()
        -- Setup Lua LSP Configuration
        require("neodev").setup({})
        -- Setup LSP Notifications
        require("fidget").setup({})

        -- Setup LSP Installer
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "tailwindcss",
            },
        }

        local lspkind = require('lspkind')
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lspconfig = require("lspconfig")

        -- Setup Autocomplete
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                -- FIXME: C-Space keybinding error.
                ["<A-Space>"] = cmp.mapping.complete(),
                ['<C-l>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
                { name = 'dotenv' },
            }),
            formatting = {
                expandable_indicator = true,
                fields = { 'abbr' },
                format = lspkind.cmp_format({
                    mode = 'symbol',
                    maxwidth = 50,
                    ellipsis_char = '...',
                    show_labelDetails = true,
                })
            }
        })

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })

        -- Setup LSPs
        lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace"
                    }
                }
            }
        }

        lspconfig.tsserver.setup({
            capabilities = capabilities,
        })

        lspconfig.tailwindcss.setup({
            capabilities = capabilities,
        })

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gw', vim.lsp.buf.workspace_symbol, opts)
                vim.keymap.set('n', 'gj', vim.diagnostic.open_float, opts)
                vim.keymap.set({ 'n', 'v' }, '<leader>c', vim.lsp.buf.code_action, opts)
                -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
                vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader><leader>', function()
                    vim.lsp.buf.format { async = true }
                end, opts)

                -- TODO: What are these functions for in LSP?
                -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                -- vim.keymap.set('n', '<space>wl', function()
                --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                -- end, opts)
                -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            end,
        })
    end
}

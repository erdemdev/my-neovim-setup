return {
    -- https://github.com/nvim-tree/nvim-tree.lua
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- To see all available mappings:
            -- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L2156

            -- Tree Toggling Commands
            vim.keymap.set('n', "<leader>o", "<cmd>NvimTreeFocus<CR>")
            -- vim.keymap.set('n', "<leader>h", "<cmd>NvimTreeFocus<CR>")

            -- Tree Buffer Commands
            -- Opening files from the tree
            vim.keymap.set('n', 'O', api.node.open.edit, opts("Open"))
            vim.keymap.set('n', 'L', api.node.open.edit, opts('Open'))
            vim.keymap.set('n', '<leader>o', api.node.open.edit, opts('Open'))
            vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))

            -- Tree File Control Commands
            vim.keymap.set('n', 'o', api.node.open.preview, opts('Open Preview'))
            vim.keymap.set('n', 'a', api.fs.create, opts('Create File Or Directory'))
            vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
            vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
            vim.keymap.set('n', 'e', api.fs.rename_basename, opts('Rename: Basename'))
            vim.keymap.set('n', 'F', api.live_filter.clear, opts('Live Filter: Clear'))
            vim.keymap.set('n', 'f', api.live_filter.start, opts('Live Filter: Start'))
            vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
            vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
            vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
            vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
            vim.keymap.set('n', '<tab>', api.marks.toggle, opts('Toggle Bookmark'))
            vim.keymap.set('n', 'mv', api.marks.bulk.move, opts('Move Bookmarked'))
            vim.keymap.set('n', 'md', api.marks.bulk.delete, opts('Delete Bookmarked'))
            vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
            vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
            vim.keymap.set('n', '<esc>', "<C-w>o", opts('Close Preview'))
        end

        -- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L601
        require("nvim-tree").setup {
            on_attach = my_on_attach,
            view = {
                centralize_selection = true,
                number = true,
                relativenumber = true
            },
            renderer = {
                highlight_opened_files = "icon"
            },
            update_focused_file = {
                enable = true
            },
            modified = {
                enable = true
            },
            actions = {
                open_file = {
                    quit_on_open = true
                }
            },
            filters = {
                git_ignored = false
            }
        }
    end,
}

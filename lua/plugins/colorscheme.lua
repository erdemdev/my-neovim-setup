return {
    -- https://github.com/rose-pine/neovim
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    config = function ()
        require('rose-pine').setup({
            styles = {
                transparency = true,
            },
        })

        vim.cmd('colorscheme rose-pine')
    end
}

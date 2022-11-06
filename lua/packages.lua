require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'sainnhe/gruvbox-material'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
end)

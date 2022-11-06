require('config')
vim.cmd([[
    if has('termguicolors')
        set termguicolors
    endif
]])


local keymap = vim.api.nvim_set_keymap

-- Saving file in normal and insert modes

keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a',{})

-- Moving through splits with hjkl

local opts = { noremap = true }
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

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

vim.cmd([[
    set background=dark
    let g:gruvbox_material_background = 'hard'
    let g:gruvbox_material_better_performance = 1
    colorscheme gruvbox-material
]])


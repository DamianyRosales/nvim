vim.cmd([[
    
    syntax on

    set exrc
    set guicursor=
    set relativenumber
    set nohlsearch
    set hidden
    set noerrorbells
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set smartindent
    set number
    set nowrap
    set noswapfile
    set nobackup
    set undodir=~/.config/nvim/undodir
    set undofile
    set incsearch
    set scrolloff=8
    set completeopt=menuone,noinsert,noselect
    set colorcolumn=80
    set signcolumn=yes
    
    set formatoptions-=cro
    
    set encoding=UTF-8

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


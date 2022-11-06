require('config')
require('keybindings')
require('packages')

require('treesitter')

vim.cmd([[
    if has('termguicolors')
        set termguicolors
    endif
]])

vim.cmd([[
    set background=dark
    let g:gruvbox_material_background = 'hard'
    let g:gruvbox_material_better_performance = 1
    colorscheme gruvbox-material
]])


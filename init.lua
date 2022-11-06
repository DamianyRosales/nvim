require('config')
require('keybindings')
require('packages')

require('treesitter')

vim.cmd([[
    if has('termguicolors')
        set termguicolors
    endif
]])

-- theme
require('themes/everforest')
--require('themes/gruvbox_material')
--require('themes/onedarkpro')


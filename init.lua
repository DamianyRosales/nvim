require('config')
require('keybindings')
require('packages')

require('treesitter')

-- theme
require('themes/everforest')

vim.cmd([[
    if has('termguicolors')
        set termguicolors
    endif
]])



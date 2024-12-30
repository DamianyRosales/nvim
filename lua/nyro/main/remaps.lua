vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })

local keymap = vim.api.nvim_set_keymap

-- Saving file in normal and insert modes

keymap('n', '<C-s>', ':w<CR>', {})
keymap('i', '<C-s>', '<Esc>:w<CR>a',{})

--terminate nvim
keymap('n', '<C-q>', ':q!<CR>', {})
--close current tab
keymap('n', '<C-x>', ':bd<CR>', {})

-- disable arrow keys
--      normal mode
keymap('n', '<Left>', "", {})
keymap('n', '<Up>', "", {})
keymap('n', '<Right>', "", {})
keymap('n', '<Down>', "", {})
keymap('i', '<Left>', "", {})
keymap('i', '<Up>', "", {})
keymap('i', '<Right>', "", {})
keymap('i', '<Down>', "", {})

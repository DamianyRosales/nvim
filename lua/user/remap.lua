local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local opts = { noremap = true }
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)


local function nkeymap(key,map)
    keymap('n', key, map, opts)
end

-- Saving file in normal and insert modes

keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a',{})

-- Closing
nkeymap('<C-q>', ':q!<cr>')

-- Close current tab
nkeymap('<C-x>', ':bd<cr>')

-- Navigate tabs
nkeymap('<C-e>', ':bnext<cr>')

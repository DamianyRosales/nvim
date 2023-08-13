local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- nvim-treesitter for syntax highlighting
    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use ('nvim-treesitter/playground')

    use "nvim-lua/plenary.nvim"

    -- Theme config
    use "rebelot/kanagawa.nvim"
    --use 'sainnhe/everforest'
    -- status line 

    use {
      'nvim-lualine/lualine.nvim',
    }

    -- becoming a kangaroo
    use 'ggandor/leap.nvim'

    -- file manager

    use {
        'stevearc/oil.nvim',
        config = function() require('oil').setup() end
    }

    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    -- web dev icons

    use 'nvim-tree/nvim-web-devicons'

    -- FileTree plugins
    use 'nvim-tree/nvim-tree.lua'

    -- Vim current word highlighting
    use 'dominikduda/vim_current_word'

    -- hexadecimal colors displayer
    use 'ap/vim-css-color'
    -- surround
    use 'tpope/vim-surround'

    -- lsp
    use 'neovim/nvim-lspconfig'

    --nice lsp key words for cmp

    use 'onsails/lspkind.nvim'

    -- autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- autopair
    use {
	    "windwp/nvim-autopairs",
    }

    -- telescope

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- bufferline

    use {'akinsho/bufferline.nvim', tag = "v3.*",}

    -- git blamer

    use 'lewis6991/gitsigns.nvim'

    -- comment motions
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)


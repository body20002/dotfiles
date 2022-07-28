return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- use {
    --     'goolord/alpha-nvim',
    --     config = function()
    --         require'alpha'.setup(require'alpha.themes.dashboard'.opts)
    --     end
    -- }

    -- use 'Shatur/neovim-session-manager'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    use 'norcalli/nvim-colorizer.lua'

    -- use 'tpope/vim-commentary' -- Really Good Plugin

    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    use {
        'folke/todo-comments.nvim',
        config = function() require("todo-comments").setup() end
    }

    use 'bkad/CamelCaseMotion'

    use 'nvim-lualine/lualine.nvim'

    use 'eddyekofo94/gruvbox-flat.nvim'

    use 'akinsho/nvim-bufferline.lua'

    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}

    use 'mhartington/formatter.nvim'

    use "steelsojka/pears.nvim"

    use 'tpope/vim-fugitive'

    use 'neovim/nvim-lspconfig'

    use 'williamboman/nvim-lsp-installer'

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    use 'windwp/nvim-ts-autotag'

    use 'p00f/nvim-ts-rainbow'

    -- use 'saltstack/salt-vim'

    -- use 'ThePrimeagen/vim-be-good'

    -- use 'windwp/nvim-autopairs'

    -- use 'projekt0n/github-nvim-theme'

    use {
        'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/nvim-cmp',
        'saadparwaiz1/cmp_luasnip', 'L3MON4D3/LuaSnip', 'f3fora/cmp-spell',
        'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'ray-x/cmp-treesitter',
        'onsails/lspkind-nvim'
    }

    use "rafamadriz/friendly-snippets"

    use {
        'tzachar/cmp-tabnine',
        run = './install.sh',
        requires = 'hrsh7th/nvim-cmp'
    }

    use {"glepnir/lspsaga.nvim", branch = "main"}

    use "lukas-reineke/indent-blankline.nvim"

    use {"ellisonleao/glow.nvim"}

    use 'mbbill/undotree'

    -- Discord Rich Presence
    use 'andweeb/presence.nvim'
end)

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') ..
                             '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

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
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim'}
            -- ripgrep needs to be installed on the system 'pacman -S ripgrep'
        }
    }

    use 'ThePrimeagen/harpoon'

    use 'norcalli/nvim-colorizer.lua'

    -- use 'tpope/vim-commentary' -- Really Good Plugin

    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    -- use {
    --     'folke/todo-comments.nvim',
    --     config = function() require("todo-comments").setup() end
    -- }

    use 'bkad/CamelCaseMotion'

    use 'nvim-lualine/lualine.nvim'

    use 'eddyekofo94/gruvbox-flat.nvim'

    use 'akinsho/nvim-bufferline.lua'

    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}

    use 'mhartington/formatter.nvim'

    use "steelsojka/pears.nvim"

    use 'tpope/vim-fugitive'

    use 'neovim/nvim-lspconfig'

    -- use 'williamboman/nvim-lsp-installer' -- replaced by mason

    use {
        'williamboman/mason.nvim',
        requires = {'williamboman/mason-lspconfig.nvim'}
    }

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    use 'windwp/nvim-ts-autotag'

    use 'p00f/nvim-ts-rainbow'

    -- use 'saltstack/salt-vim'

    -- use 'ThePrimeagen/vim-be-good'

    -- use 'windwp/nvim-autopairs'

    -- use 'projekt0n/github-nvim-theme'

    -- use {
    --     'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/nvim-cmp',
    --     'saadparwaiz1/cmp_luasnip', 'f3fora/cmp-spell',
    --     'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'ray-x/cmp-treesitter',
    --     'onsails/lspkind-nvim'
    -- }
    --
    -- use {
    --     'tzachar/cmp-tabnine',
    --     run = './install.sh',
    --     requires = 'hrsh7th/nvim-cmp'
    -- }

    use {
        {'ms-jpq/coq_nvim', branch = "coq", run = ":COQdeps"},
        {'ms-jpq/coq.artifacts', branch = "artifacts"},
        {'ms-jpq/coq.thirdparty', branch = "3p"}
    }

    use 'L3MON4D3/LuaSnip'

    use "rafamadriz/friendly-snippets"

    use {"glepnir/lspsaga.nvim", branch = "main"}

    use "lukas-reineke/indent-blankline.nvim"

    use {"ellisonleao/glow.nvim"}

    use 'mbbill/undotree'

    -- Discord Rich Presence
    use 'andweeb/presence.nvim'

    -- Dap on the bugs
    use {
        'mfussenegger/nvim-dap',
        requires = {
            {'rcarriga/nvim-dap-ui'}, {'mfussenegger/nvim-dap-python'},
            {'theHamsta/nvim-dap-virtual-text'},
            {'nvim-telescope/telescope-dap.nvim'}
        }
    }

    -- Chat GPT
    use {
        'jackMort/ChatGPT.nvim',
        config = function() require('chatgpt').setup() end,
        requires = {'MunifTanjim/nui.nvim'}
    }

    if packer_bootstrap then require('packer').sync() end
end)

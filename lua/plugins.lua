vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- augroup end
-- ]]

require('packer').init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end
    },
    git = {
        clone_timeout = 300 -- 5 mins
    },
    profile = { enable = true }
}

return require('packer').startup(function(use)
    use 'lewis6991/impatient.nvim'
    require('impatient')
    -- color scheme and related stuff
    use { 'tjdevries/gruvbuddy.nvim', requires = { 'tjdevries/colorbuddy.vim' } }
    --use {'christianchiarulli/nvcode-color-schemes.vim'}
    --use {'jsit/toast.vim'}
    use { 'RRethy/nvim-base16' }
    --use {'sainnhe/sonokai'}
    --use {'luisiacc/gruvbox-baby'}
    --use {'arzg/vim-colors-xcode'}
    use 'folke/tokyonight.nvim'
    use 'navarasu/onedark.nvim'
    -- statusline, indentline, barbar
    --use 'NTBBloodbath/galaxyline.nvim'
    use 'nvim-lualine/lualine.nvim'
    use { 'romgrk/barbar.nvim' }
    use 'lukas-reineke/indent-blankline.nvim'

    use { 'stevearc/dressing.nvim' } --no setup required

    -- lsp stuff
    use 'neovim/nvim-lspconfig'
    use 'folke/lua-dev.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'rmagatti/goto-preview'
    -- use 'j-hui/fidget.nvim'
    use 'onsails/lspkind-nvim'
    use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'

    -- cmp stuff
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-calc', 'hrsh7th/cmp-path', 'hrsh7th/cmp-emoji',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip', 'hrsh7th/cmp-nvim-lua', 'hrsh7th/cmp-nvim-lsp-document-symbol'
        }
    }

    -- nerdtree stuff
    use 'preservim/nerdtree'
    use 'jistr/vim-nerdtree-tabs'
    use 'Xuyuanp/nerdtree-git-plugin'

    -- git stuff
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'
    use { 'sindrets/diffview.nvim', opt = true, cmd = { "DiffviewOpen", "DiffviewClose" } }

    -- terminal toggle
    use { "akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
        require("toggleterm").setup()
    end }
    -- treesitter and its plugins
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/nvim-treesitter-context'

    -- telescope and its extensions
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim', 'nvim-telescope/telescope-fzy-native.nvim',
            'nvim-telescope/telescope-media-files.nvim'
        }
    }
    use "ahmedkhalf/project.nvim"

    -- miscellaoeous vim utils
    use 'milkypostman/vim-togglelist'
    use { 'liuchengxu/vista.vim', opt = true, cmd = { "Vista" } }
    use 'simrat39/symbols-outline.nvim'
    use 'preservim/nerdcommenter'
    use 'edluffy/specs.nvim'
    use 'folke/todo-comments.nvim'
    use 'mbbill/undotree'
    use { 'tpope/vim-dispatch', opt = true, cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }
    use 'szw/vim-maximizer' -- maximize current buffer, default F3
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'
    use { "dstein64/vim-startuptime", cmd = "StartupTime" }
    -- Lua
    use { "folke/which-key.nvim" }
    use { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' } }

    -- Rust
    use { 'simrat39/rust-tools.nvim' }

    -- testing
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            'nvim-neotest/neotest-go',
        }
    }

    use 'ThePrimeagen/vim-be-good'
end)

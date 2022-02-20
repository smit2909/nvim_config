vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'lewis6991/impatient.nvim'
    require('impatient')
    -- color scheme and related stuff
    use { 'ellisonleao/gruvbox.nvim', requires = { 'rktjmp/lush.nvim' } }
    use { 'tjdevries/gruvbuddy.nvim', requires = { 'tjdevries/colorbuddy.vim' } }
    use 'NTBBloodbath/doom-one.nvim'
    use 'tanvirtin/monokai.nvim'
    use 'Th3Whit3Wolf/spacebuddy'
    use 'whatsthatsmell/codesmell_dark.vim'
    use 'martinsione/darkplus.nvim'
    use 'drewtempelmeyer/palenight.vim'
    use 'marko-cerovac/material.nvim'

    -- statusline, indentline, barbar
    use 'NTBBloodbath/galaxyline.nvim'
    use { 'romgrk/barbar.nvim', event = 'VimEnter' }
    use 'lukas-reineke/indent-blankline.nvim'

    -- lsp stuff
    use 'neovim/nvim-lspconfig'
    use 'folke/lua-dev.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'rmagatti/goto-preview'
    use 'j-hui/fidget.nvim'
    use 'onsails/lspkind-nvim'
    use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
    use 'simrat39/symbols-outline.nvim'

    -- cmp stuff
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-calc', 'hrsh7th/cmp-path', 'hrsh7th/cmp-emoji', 'hrsh7th/cmp-vsnip',
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
    use 'akinsho/nvim-toggleterm.lua'

    -- treesitter and its plugins
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- telescope and its extensions
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim', 'nvim-telescope/telescope-fzy-native.nvim' },
    }

    -- miscellaoeous vim utils
    use 'milkypostman/vim-togglelist'
    use 'liuchengxu/vista.vim'
    use 'preservim/nerdcommenter'
    use 'edluffy/specs.nvim'
    use 'folke/todo-comments.nvim'
    use 'vimwiki/vimwiki'
    use 'mbbill/undotree'
    use { 'tpope/vim-dispatch', opt = true, cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }
    use 'szw/vim-maximizer' -- maximize current buffer, default F3
    use 'glepnir/dashboard-nvim'
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'
    use { "dstein64/vim-startuptime", cmd = "StartupTime" }
end)

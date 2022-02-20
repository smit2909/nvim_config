" =====================================================================================================================
" Augroups and some functions
" =====================================================================================================================

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" html, css and javascript will have tab as 4 spaces
augroup filetype_html
    autocmd!
    :autocmd FileType html setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
augroup end

augroup filetype_css
    autocmd!
    :autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
augroup end

augroup filetype_javascript
    autocmd!
    :autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
augroup end

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

augroup terminal_buffer
    autocmd!
    autocmd TermOpen * setlocal bufhidden=hide
augroup END

augroup code_fmt
  autocmd!
  autocmd BufWritePre *.go lua goimports(100)
  "autocmd BufWritePost *.js,*.html,*.go,*.json,*.proto FormatWrite
  autocmd BufWritePre  *.go,*.py,*.proto,*.lua lua vim.lsp.buf.formatting_sync(nil, 3000)
augroup END

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 80})
augroup END

" =====================================================================================================================
" Install plugins
" =====================================================================================================================

" anything between call plug#begin() and call plug#end() will be installed
call plug#begin('~/.config/nvim/plugged')
" For faster loading
Plug 'lewis6991/impatient.nvim'
"call plug#end()
"lua require('impatient')

"call plug#begin('~/.config/nvim/plugged')
" color schemes
Plug 'tjdevries/colorbuddy.vim'
"Plug 'npxbr/gruvbox.nvim'
Plug 'rktjmp/lush.nvim' " gruvbox dependency
Plug 'ellisonleao/gruvbox.nvim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'NTBBloodbath/doom-one.nvim'
Plug 'tanvirtin/monokai.nvim'
Plug 'Th3Whit3Wolf/spacebuddy'
"Plug '/home/smit/.config/nvim/plugged/onedarker'
"Plug 'ful1e5/onedark.nvim'
Plug 'whatsthatsmell/codesmell_dark.vim'
Plug 'martinsione/darkplus.nvim'
"Plug 'kyazdani42/nvim-palenight.lua'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'marko-cerovac/material.nvim'

" Using Vim-Plug
Plug 'rmagatti/goto-preview'

" note taking in vim
Plug 'vimwiki/vimwiki'

" dispatch
Plug 'tpope/vim-dispatch'

" TJ's statusline
Plug 'NTBBloodbath/galaxyline.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/lua-dev.nvim'
Plug 'preservim/nerdcommenter' " keymaps for code commenting

" lsp plugins
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'j-hui/fidget.nvim'


Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

"Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'anott03/nvim-lspinstall'
Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'liuchengxu/vista.vim'
"Plug 'simrat39/symbols-outline.nvim'

" nerdtree and its extensions
Plug 'preservim/nerdtree' " file explorer
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin' " show git file status in nerdtree
Plug 'ryanoasis/vim-devicons'

" fugitive
" git plugin
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim'

" terminal toggle
Plug 'akinsho/nvim-toggleterm.lua'

" treesitter and its plugins
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"Plug 'folke/twilight.nvim'
"Plug 'romgrk/nvim-treesitter-context'

" telescope and its extensions
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'natecraddock/telescope-zf-native.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'milkypostman/vim-togglelist'
Plug 'nvim-lua/plenary.nvim'

" miscellaoeous vim utils
Plug 'vim-utils/vim-man'  " man pages for vim
Plug 'edluffy/specs.nvim'
Plug 'folke/todo-comments.nvim'

Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'szw/vim-maximizer' " maximize current buffer, default F3
Plug 'glepnir/dashboard-nvim'

call plug#end()


" =====================================================================================================================
" Some default settings
" =====================================================================================================================
" Disable auto indent while pasting
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

" disabling the arrow keys
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  exec 'inoremap' key '<Nop>'
  "  exec 'cnoremap' key '<Nop>'
endfor

" =====================================================================================================================
" lua require
" =====================================================================================================================
lua require("smit.colors")
lua require("smit.lsp")
lua require("smit.null_ls")
lua require("smit.lspkind")
lua require("smit.cmp")
lua require("smit.lsp_signature")
lua require("smit.goto_preview")
lua require("smit.telescope")
lua require("smit.git")
lua require("smit.fidget")
lua require("smit.todo")
lua require("smit.toggleterm")
lua require("smit.treesitter")
lua require("smit.evilline")

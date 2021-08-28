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
  "autocmd BufWritePre *.py lua vim.lsp.buf.formatting()
  "autocmd BufWritePre *.py undojoin | Neoformat
  "autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePost *.js,*.html,*.py,*.go FormatWrite
augroup END

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 120})
augroup END

" =====================================================================================================================
" Install plugins
" =====================================================================================================================

" anything between call plug#begin() and call plug#end() will be installed
call plug#begin('~/.config/nvim/plugged')

" color schemes
Plug 'tjdevries/colorbuddy.vim'
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
Plug 'jim-at-jibba/ariake-vim-colors'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'NTBBloodbath/doom-one.nvim'
Plug 'chriskempson/base16-vim'
Plug 'whatsthatsmell/codesmell_dark.vim'
Plug 'davidcelis/vim-ariake-dark'
Plug 'romainl/apprentice'
Plug 'sts10/vim-pink-moon'
Plug 'Shatur/neovim-ayu'
"Plug 'romgrk/doom-one.vim'
" note taking in vim
Plug 'vimwiki/vimwiki'
Plug '/home/smit/.config/nvim/plugged/spacegray'

" dispatch
Plug 'tpope/vim-dispatch'

" TJ's statusline
"Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'romgrk/barbar.nvim'
Plug 'Yggdroot/indentLine'
Plug 'tjdevries/express_line.nvim'

" code formatter and commenter
Plug 'mhartington/formatter.nvim'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'preservim/nerdcommenter' " keymaps for code commenting

" lsp plugins
Plug 'ray-x/lsp_signature.nvim'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'anott03/nvim-lspinstall'
"Plug 'ThePrimeagen/refactoring.nvim'
Plug 'folke/lsp-colors.nvim'

" coc
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
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
Plug 'kyazdani42/nvim-web-devicons'
Plug 'milkypostman/vim-togglelist'
Plug 'nvim-lua/plenary.nvim'

" miscellaoeous vim utils
Plug 'vim-utils/vim-man'  " man pages for vim
Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'edluffy/specs.nvim'

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

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
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
" Fonts for neovide
" =====================================================================================================================
let g:neovide_cursor_vfx_mode = "railgun"
set guifont=Jetbrains\ Mono:h13
"set guifont=mononoki\ Nerd\ Font\ Mono:h14
"set guifont=FiraCode\ NerdFont\ Mono:h12
"set guifont=Source\ Code\ Pro\ Medium:h13

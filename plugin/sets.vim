"set guicursor=
set noerrorbells
"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
"set foldnestmax=3
"set foldlevel=20
set clipboard=unnamedplus
filetype plugin indent on

set nu
set relativenumber

set nohlsearch
set incsearch

set hidden

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap

set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

set termguicolors
set noshowmode
"set showtabline=2
set updatetime=50
set shortmess+=c

set cmdheight=1
"set colorcolumn=120
set signcolumn=yes
"set scrolloff=10

"set list
"set listchars=tab:>~
"set list lcs=tab:»·
"set listchars=trail:⋅,eol:↲,tab:»·
"set listchars=eol:↲,

set mouse=a
let g:is_mouse_enabled = 1
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

filetype on
filetype plugin indent on
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

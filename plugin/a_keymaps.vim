inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
let mapleader = " "
inoremap jj <esc>

" =====================================================================================================================
" Buffer and window movements
" =====================================================================================================================
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>

" buffer movement using barbar
nmap <leader>[ :BufferPrevious<CR>
nmap <leader>] :BufferNext<CR>
nmap <leader>x :BufferClose<CR>

" =====================================================================================================================
" Word movements
" =====================================================================================================================
imap <S-Left> <Esc>bi
nmap <S-Left> b
imap <S-Right> <Esc><Right>wi
nmap <S-Right> w

" =====================================================================================================================
" Copy cut paste shorcuts
" =====================================================================================================================
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> <ESC>"+p
imap <C-v> <ESC>"+pa

" =====================================================================================================================
" GREATEST REMAPS IN THE WORLD!
" =====================================================================================================================

" honarary mentions
vnoremap X "_d
vnoremap <leader>p "_dP
com! W w

" Behave yourself vim
nnoremap Y y$

" Kepping cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap G Gzz

" below are in navigation.vim
"nnoremap <C-k> :cnext<CR>zz
"nnoremap <C-j> :cprev<CR>zz

" jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Moving text around
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" below keymaps conflict with window movements
"nnoremap <leader>k :m .-2<CR>==
"nnoremap <leader>j :m .+1<CR>==

" stay in visual mode after indent --> greatest remap again
vnoremap > >gv
vnoremap < <gv

" =====================================================================================================================
" custom function remaps and Git keymaps
" =====================================================================================================================
nmap <leader>u :UndotreeToggle<CR>
nnoremap <leader>rc :e ~/.config/nvim/init.vim<CR>
"nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader><CR> :so %<CR>
nnoremap <leader>vwm :call ColorMyPencils()<CR>

" terminal remaps
tnoremap jj <C-\><C-n>

nnoremap <leader>vwm :call ColorMyPencils()<CR>

" precommit hooks for rewards project
nnoremap <silent> <leader>zz :Dispatch! reorder-python-imports %<CR>
nnoremap - zc<CR>
nnoremap = zo<CR>

" v/./d --> delete blank lines

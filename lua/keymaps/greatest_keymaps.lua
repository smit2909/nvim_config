-- map leader key to space
vim.g.mapleader = " "
vim.cmd [[ inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()]]

-- ============================================================================
-- Buffer movements
-- ============================================================================
-- inoremap jj <esc>
vim.api.nvim_set_keymap("i", "jj", "<esc>", {noremap = true})
-- nnoremap <leader>k :wincmd k<CR>
vim.api.nvim_set_keymap("n", "<leader>k", ":wincmd k<CR>", {noremap = true})
-- nnoremap <leader>j :wincmd j<CR>
vim.api.nvim_set_keymap("n", "<leader>j", ":wincmd j<CR>", {noremap = true})
-- nnoremap <leader>h :wincmd h<CR>
vim.api.nvim_set_keymap("n", "<leader>h", ":wincmd h<CR>", {noremap = true})
-- nnoremap <leader>l :wincmd l<CR>
vim.api.nvim_set_keymap("n", "<leader>l", ":wincmd l<CR>", {noremap = true})
-- nmap <leader>[ :BufferPrevious<CR>
vim.api.nvim_set_keymap("n", "<leader>[", ":BufferPrevious<CR>", {noremap = true})
-- nmap <leader>] :BufferNext<CR>
vim.api.nvim_set_keymap("n", "<leader>]", ":BufferNext<CR>", {noremap = true})
-- nmap <leader>x :BufferClose<CR>
vim.api.nvim_set_keymap("n", "<leader>x", ":BufferClose<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<f4>", ":BufferClose<CR>", {noremap = true})

-- ============================================================================
-- Word movements
-- ============================================================================
-- imap <S-Left> <Esc>bi
vim.api.nvim_set_keymap("i", "<S-Left>", "<Esc>bi", {noremap = true})
-- nmap <S-Left> b
vim.api.nvim_set_keymap("n", "<S-Left>", "b", {noremap = true})
-- imap <S-Right> <Esc><Right>wi
vim.api.nvim_set_keymap("i", "<S-Right>", "<Esc><Right>wi", {noremap = true})
-- nmap <S-Right> w
vim.api.nvim_set_keymap("n", "<S-Right>", "w", {noremap = true})

-- ============================================================================
-- Copy Cut Paste
-- ============================================================================
-- vmap <C-c> "+y
vim.api.nvim_set_keymap("v", "<C-c>", "\"+y", {noremap = true})
-- vmap <C-x> "+c
vim.api.nvim_set_keymap("v", "<C-x>", "\"+c", {noremap = true})
-- vmap <C-v> <ESC>"+p
vim.api.nvim_set_keymap("v", "<C-v>", "<ESC>\"+p", {noremap = true})
-- imap <C-v> <ESC>"+pa
vim.api.nvim_set_keymap("i", "<C-v>", "<ESC>\"+pa", {noremap = true})

-- ============================================================================
-- Greatest Keymaps
-- ============================================================================

-- honorary mentions
-- vnoremap X "_d
vim.api.nvim_set_keymap("v", "X", "\"_d", {noremap = true})
-- vnoremap <leader>p "_dP
vim.api.nvim_set_keymap("v", "<leader>p", "\"_dP", {noremap = true})
vim.cmd [[com! W w]]

-- nnoremap Y y$
vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true})

-- keeping cursor centered
-- nnoremap n nzzzv
vim.api.nvim_set_keymap("n", "n", "nzzzv", {noremap = true})
-- nnoremap N Nzzzv
vim.api.nvim_set_keymap("n", "N", "Nzzzv", {noremap = true})
-- nnoremap J mzJ`z
vim.api.nvim_set_keymap("n", "J", "mzJ`z", {noremap = true})
-- nnoremap G Gzz
vim.api.nvim_set_keymap("n", "G", "Gzz", {noremap = true})

-- jumplist mutations
vim.cmd [[
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
]]

-- undo breakpoints
-- inoremap , ,<c-g>u
vim.api.nvim_set_keymap("i", ",", ",<c-g>u", {noremap = true})
-- inoremap . .<c-g>u
vim.api.nvim_set_keymap("i", ".", ".<c-g>u", {noremap = true})
-- inoremap ! !<c-g>u
vim.api.nvim_set_keymap("i", "!", "!<c-g>u", {noremap = true})
-- inoremap ? ?<c-g>u
vim.api.nvim_set_keymap("i", "?", "?<c-g>u", {noremap = true})

-- jump points and navigation
vim.api.nvim_set_keymap("n", "<PageDown>", "<c-d>zz", {noremap = true})
vim.api.nvim_set_keymap("n", "<PageUp>", "<c-u>zz", {noremap = true})
-- moving between jumpoints > ctrl+o and ctrl+1
-- change a paragragh,,like ciw/diw use cip/dip

-- moving text around
-- vnoremap J :m '>+1<CR>gv=gv
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", {noremap = true})
-- vnoremap K :m '<-2<CR>gv=gv
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", {noremap = true})

-- stay in visual mode after indent
-- vnoremap > >gv
vim.api.nvim_set_keymap("v", ">", ">gv", {noremap = true})
-- vnoremap < <gv
vim.api.nvim_set_keymap("v", "<", "<gv", {noremap = true})

-- map <f5> :set relativenumber!<cr>
vim.api.nvim_set_keymap("", "<f5>", ":set relativenumber!<CR>", {noremap = true})

vim.cmd [[vnoremap <leader>rs :g/^\s*$/d<CR>]]

-- nmap <leader>u :UndotreeToggle<CR>
vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreeToggle<CR>", {noremap = true})
-- nnoremap <leader>rc :e ~/.config/nvim/init.lua<CR>
vim.api.nvim_set_keymap("n", "<leader>rc", ":e ~/.config/nvim/lua/plugins.lua<CR>", {noremap = true})
-- nnoremap <Leader><CR> :so %<CR>
vim.api.nvim_set_keymap("n", "<Leader><CR>", ":so %<CR>", {noremap = true})
-- nnoremap <leader>vwm :call ColorMyPencils()<CR>
vim.api.nvim_set_keymap("n", "<leader>vwm", ":call ColorMyPencils()<CR>", {noremap = true})
-- tnoremap jj <C-\><C-n>
vim.api.nvim_set_keymap("t", "jj", "<C-\\><C-n>", {noremap = true})

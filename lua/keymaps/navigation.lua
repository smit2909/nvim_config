vim.cmd [[let g:toggle_list_no_mappings='']]
-- nnoremap <C-Down> :lnext<CR>zz
vim.api.nvim_set_keymap("n", "<C-Down>", ":lnext<CR>zz", { noremap = true, })
-- nnoremap <C-Up> :lprevious<CR>zz
vim.api.nvim_set_keymap("n", "<C-Up>", ":lprevious<CR>zz", { noremap = true, })
-- nnoremap <C-j> :cnext<CR>zz
vim.api.nvim_set_keymap("n", "<C-j>", ":cnext<CR>zz", { noremap = true, })
-- nnoremap <C-k> :cprev<CR>zz
vim.api.nvim_set_keymap("n", "<C-k>", ":cprev<CR>zz", { noremap = true, })
-- nnoremap <C-q> :call ToggleQuickfixList()<CR>
vim.api.nvim_set_keymap("n", "<C-q>", ":call ToggleQuickfixList()<CR>", { noremap = true, })

-- nmap <leader>1 :BufferGoto 1<CR>
vim.api.nvim_set_keymap("n", "<leader>1", ":BufferGoto 1<CR>", { noremap = true, })
-- nmap <leader>2 :BufferGoto 2<CR>
vim.api.nvim_set_keymap("n", "<leader>2", ":BufferGoto 2<CR>", { noremap = true, })
-- nmap <leader>3 :BufferGoto 3<CR>
vim.api.nvim_set_keymap("n", "<leader>3", ":BufferGoto 3<CR>", { noremap = true, })
-- nmap <leader>4 :BufferGoto 4<CR>
vim.api.nvim_set_keymap("n", "<leader>4", ":BufferGoto 4<CR>", { noremap = true, })
-- nmap <leader>5 :BufferGoto 5<CR>
vim.api.nvim_set_keymap("n", "<leader>5", ":BufferGoto 5<CR>", { noremap = true, })
-- nmap <leader>6 :BufferGoto 6<CR>
vim.api.nvim_set_keymap("n", "<leader>6", ":BufferGoto 6<CR>", { noremap = true, })
-- nmap <leader>7 :BufferGoto 7<CR>
vim.api.nvim_set_keymap("n", "<leader>7", ":BufferGoto 7<CR>", { noremap = true, })
-- nmap <leader>8 :BufferGoto 8<CR>
vim.api.nvim_set_keymap("n", "<leader>8", ":BufferGoto 8<CR>", { noremap = true, })
-- nmap <leader>9 :BufferGoto 9<CR>
vim.api.nvim_set_keymap("n", "<leader>9", ":BufferGoto 9<CR>", { noremap = true, })
-- nmap <leader>0 :BufferLast<CR>
vim.api.nvim_set_keymap("n", "<leader>0", ":BufferLast<CR>", { noremap = true, })

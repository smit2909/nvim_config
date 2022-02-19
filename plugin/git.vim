set diffopt+=vertical
nmap <leader>ga :lua require'gitsigns'.setqflist()<CR>
"nmap <Leader>ga :diffget //3<CR>
"nmap <Leader>gl :diffget //2<CR>
nmap <Leader>gs :G<CR>
nmap <Leader>gv :Gvdiffsplit<CR>
nmap <Leader>gb :Gitsigns toggle_current_line_blame<CR>
nnoremap <Leader>gc :lua require 'telescope.builtin'.git_branches{}<CR>
nnoremap <leader>gt :lua require('telescope.builtin').git_stash()<CR>
nnoremap <Leader>go :lua require('smit.git').toggle_diff_view()<CR>

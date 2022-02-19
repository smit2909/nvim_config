nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
nnoremap <C-r> :lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<CR>
nnoremap <A-b> :lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_ivy({}))<CR>
nnoremap <A-s> :lua require('telescope.builtin').lsp_dynamic_workspace_symbols(require('telescope.themes').get_ivy({}))<CR>
nnoremap <leader>s :lua require('telescope.builtin').diagnostics({bufnr = 0}, require('telescope.themes').get_ivy({}))<CR>
nnoremap <leader>ws :lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy({}))<CR>
"nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

" show changed_on_branch
nnoremap <leader>pb :lua require('smit.telescope').changed_on_branch()<CR>
nnoremap <leader>pn :lua require('smit.telescope').hunk_picker({})<CR>

nnoremap <F2> :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('smit.telescope').search_dotfiles()<CR>
nnoremap <leader>va :lua require('smit.telescope').anime_selector()<CR>

" moved from coc.vim to here
"nnoremap <silent>gd :Telescope coc definitions<CR>
"nnoremap <silent>gr :Telescope coc references<CR>
nnoremap <leader>po :lua require('smit.telescope').search_in_curr_file_dir()<CR>
nnoremap <leader>ro :lua require('smit.telescope').my_picker({})<CR>


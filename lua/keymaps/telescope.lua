-- nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
-- nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
-- nnoremap <C-r> :lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<CR>
-- nnoremap <A-b> :lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_ivy({}))<CR>
-- nnoremap <A-s> :lua require('telescope.builtin').lsp_dynamic_workspace_symbols(require('telescope.themes').get_ivy({}))<CR>
-- nnoremap <leader>s :lua require('telescope.builtin').diagnostics({bufnr = 0}, require('telescope.themes').get_ivy({}))<CR>
-- nnoremap <leader>ws :lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy({}))<CR>
-- nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
-- nnoremap <leader>pb :lua require('setup.telescope').changed_on_branch()<CR>
-- nnoremap <leader>pn :lua require('setup.telescope').hunk_picker({})<CR>
-- nnoremap <F2> :lua require('telescope.builtin').help_tags()<CR>
-- nnoremap <leader>vrc :lua require('setup.telescope').search_dotfiles()<CR>
-- nnoremap <leader>va :lua require('setup.telescope').anime_selector()<CR>
-- nnoremap <leader>po :lua require('setup.telescope').search_in_curr_file_dir()<CR>
-- nnoremap <leader>ro :lua require('setup.telescope').my_picker({})<CR>
-- telescope keymaps
vim.api.nvim_set_keymap("n", "<leader>ps", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>pq", ":lua require('telescope.builtin').quickfix()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-p>", ":lua require('telescope.builtin').find_files()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-r>", ":lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<A-b>", ":lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_ivy({}))<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<A-s>",
                        ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols(require('telescope.themes').get_ivy({ignore_symbols={'variable', 'method'}}))<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>s", ":lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy({bufnr=0}))<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>ws", ":lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy({}))<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>pw", ":lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F2>", ":lua require('telescope.builtin').help_tags()<CR>", {noremap = true, silent = true})

-- custom pickers
vim.api.nvim_set_keymap("n", "<leader>vrc", ":lua require('setup.telescope').search_dotfiles()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>va", ":lua require('setup.telescope').anime_selector()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>po", ":lua require('setup.telescope').search_in_curr_file_dir()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>ro", ":lua require('setup.telescope').my_picker({})<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>pb", ":lua require('setup.telescope').changed_on_branch()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>pn", ":lua require('setup.telescope').hunk_picker({})<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>vwm", ":lua require('setup.telescope').colorscheme_picker({})<CR>", {noremap = true, silent = true})

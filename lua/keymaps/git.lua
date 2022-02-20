vim.cmd [[set diffopt+=vertical]]

-- nmap <leader>ga :lua require'gitsigns'.setqflist()<CR>
vim.api.nvim_set_keymap("n", "<leader>ga", ":lua require'gitsigns'.setqflist()<CR>", { noremap = true, })
-- nmap <Leader>gs :G<CR>
vim.api.nvim_set_keymap("n", "<Leader>gs", ":G<CR>", { noremap = true, })
-- nmap <Leader>gv :Gvdiffsplit<CR>
vim.api.nvim_set_keymap("n", "<Leader>gv", ":Gvdiffsplit<CR>", { noremap = true, })
-- nmap <Leader>gb :Gitsigns toggle_current_line_blame<CR>
vim.api.nvim_set_keymap("n", "<Leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { noremap = true, })
-- nnoremap <Leader>gc :lua require 'telescope.builtin'.git_branches{}<CR>
vim.api.nvim_set_keymap("n", "<Leader>gc", ":lua require 'telescope.builtin'.git_branches{}<CR>", { noremap = true, })
-- nnoremap <leader>gt :lua require('telescope.builtin').git_stash()<CR>
vim.api.nvim_set_keymap("n", "<leader>gt", ":lua require('telescope.builtin').git_stash()<CR>", { noremap = true, })
-- nnoremap <Leader>go :lua require('setup.git').toggle_diff_view()<CR>
vim.api.nvim_set_keymap("n", "<Leader>go", ":lua require('setup.git').toggle_diff_view()<CR>", { noremap = true, })

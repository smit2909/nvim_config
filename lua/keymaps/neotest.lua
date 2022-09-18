-- test file
vim.api.nvim_set_keymap("n", "<leader>tt", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
    { noremap = true, silent = true })

-- test folder
vim.api.nvim_set_keymap("n", "<leader>tf", ":lua require('setup.neotest').test_current_dir()<CR>",
    { noremap = true, silent = true })

-- test project
vim.api.nvim_set_keymap("n", "<leader>tp", ":lua require('neotest').run.run(vim.fn.getcwd())<CR>",
    { noremap = true, silent = true })


-- view summary of tests
vim.api.nvim_set_keymap("n", "<leader>ts", ":lua require('setup.neotest').toggle_test_summary()<CR>",
    { noremap = true, silent = true })

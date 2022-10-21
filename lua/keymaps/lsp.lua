-- nnoremap vsh <cmd>lua vim.lsp.buf.signature_help()<CR>
vim.api.nvim_set_keymap("n", "vsh", ":lua vim.lsp.buf.signature_help()<CR>", { noremap = true })
-- nnoremap <silent> gr    <cmd>lua require'telescope.builtin'.lsp_references()<CR>
vim.api.nvim_set_keymap("n", "gr", ":lua require'telescope.builtin'.lsp_references( {layout_config = { preview_width = 0.65 }, shorten_path = true})<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gi", ":lua require'telescope.builtin'.lsp_implementations( {layout_config = { preview_width = 0.65 }, shorten_path = true})<CR>",
    { noremap = true, silent = true })
-- nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
vim.api.nvim_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- nnoremap <silent>vrn    <cmd>lua vim.lsp.buf.rename()<CR>
vim.api.nvim_set_keymap("n", "vrn", ":lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("n", "<f2>", ":lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
-- nnoremap <leader>cd   <cmd>lua vim.diagnostic.open_float({})<CR>
vim.api.nvim_set_keymap("n", "<Leader>cd", ":lua vim.diagnostic.open_float({})<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F9>", ":lua vim.diagnostic.goto_next({})<CR>", { noremap = true, silent = true })

-- shift+f9 = f21 --> refer below issue
-- https://github.com/neovim/neovim/issues/7384#issuecomment-504993368
-- use showkey -a command, and press shift+f9, and check the output aginst the list on above link (output is [20;2~)
vim.api.nvim_set_keymap("n", "<f21>", ":lua vim.diagnostic.goto_prev({})<CR>", { noremap = true, silent = true })

-- nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
vim.api.nvim_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
-- nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
vim.api.nvim_set_keymap("n", "gD", ":lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
-- "nnoremap <leader>f      <cmd>lua vim.lsp.buf.formatting()<CR>
vim.api.nvim_set_keymap("n", "<Leader>f", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
-- nnoremap gp <cmd>lua require('goto-preview').goto_preview_definition()<CR>
vim.api.nvim_set_keymap("n", "gp", ":lua require('goto-preview').goto_preview_definition()<CR>",
    { noremap = true, silent = true })


vim.api.nvim_set_keymap("n", "<F6>", ":lua require('setup.lsp').toggle_diagnostics()<CR>",
    { noremap = true, silent = true })

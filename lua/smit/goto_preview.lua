local function PreviewWindowKeymap(curr_buff, curr_win)
    -- set esc to close the preview window
    vim.api.nvim_buf_set_keymap(curr_buff, 'n', '<Esc>', ':q<CR>', {noremap = true})
end
require('goto-preview').setup {post_open_hook = PreviewWindowKeymap}

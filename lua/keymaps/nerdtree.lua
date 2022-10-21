vim.cmd [[
let NERDTreeShowHidden=1  " shows hidden files
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 0  " setting it to 1 hides ..(up a dir) button in nerdtree
let g:nerdtree_open = 0
let g:nerdtree_tabs_open_on_gui_startup = 0  " this stops nerdtree from opening in gui version

let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ 'Modified'  :'',
            \ 'Staged'    :'S',
            \ 'Untracked' :'U',
            \ 'Renamed'   :'➜',
            \ 'Unmerged'  :'',
            \ 'Deleted'   :'',
            \ 'Dirty'     :'',
            \ 'Ignored'   :'◌',
            \ 'Clean'     :'✔︎',
            \ 'Unknown'   :'?',
            \ }
 ]]
--  following options are the default
--  each of these are documented in `:help nvim-tree.OPTION_NAME`

 --vim.api.nvim_set_keymap("n", "<leader>pv", ":NERDTreeFind<CR>zz", { noremap = true, silent = true })
 --vim.api.nvim_set_keymap("", "<leader>n", ":NERDTreeToggle<CR>", { noremap = true, silent = true })

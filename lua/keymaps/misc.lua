-- ===========================================================================
-- Vista.nvim
-- ===========================================================================
vim.cmd [[
"let g:tagbar_foldlevel=4
"map <leader>t :TagbarToggle<CR>

let g:vista_sidebar_width = 40
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_close_on_jump = 1
" map <F8> :Vista!!<CR>
map <F8> :SymbolsOutline<CR>
]]

-- ===========================================================================
-- todo.nvim
-- ===========================================================================
vim.cmd [[
nnoremap <leader>td :TodoTelescope<CR>
]]

-- ===========================================================================
-- wiki.nvim
-- ===========================================================================
vim.cmd [[
function Check()
    let l:line=getline('.')
    let l:curs=winsaveview()
    if l:line=~?'\s*-\s*\[\s*\].*'
        s/\[\s*\]/[.]/
    elseif l:line=~?'\s*-\s*\[\.\].*'
        s/\[.\]/[x]/
    elseif l:line=~?'\s*-\s*\[x\].*'
        s/\[x\]/[ ]/
    endif
    call winrestview(l:curs)
endfunction


let wiki = {}
let wiki.nested_syntaxes = {'python': 'python', 'sh': 'sh'}
let g:vimwiki_list = [wiki]
"autocmd FileType markdown nnoremap <silent> - :call Check()<CR>

]]

-- ===========================================================================
-- Redundant keymaps
-- ===========================================================================
vim.cmd [[
map 1i <esc>i
map 2i <esc>i
map 3i <esc>i
map 4i <esc>i
map 5i <esc>i
map 6i <esc>i
map 7i <esc>i
map 8i <esc>i
map 9i <esc>i

map 1I <esc>I
map 2I <esc>I
map 3I <esc>I
map 4I <esc>I
map 5I <esc>I
map 6I <esc>I
map 7I <esc>I
map 8I <esc>I
map 9I <esc>I

map 1o <esc>o
map 2o <esc>o
map 3o <esc>o
map 4o <esc>o
map 5o <esc>o
map 6o <esc>o
map 7o <esc>o
map 8o <esc>o
map 9o <esc>o

map 1O <esc>O
map 2O <esc>O
map 3O <esc>O
map 4O <esc>O
map 5O <esc>O
map 6O <esc>O
map 7O <esc>O
map 8O <esc>O
map 9O <esc>O

map <A-1> <esc>
map <A-2> <esc>
map <A-3> <esc>
map <A-4> <esc>
map <A-5> <esc>
map <A-6> <esc>
map <A-7> <esc>
map <A-8> <esc>
map <A-9> <esc>
map <A-0> <esc>
]]

-- ===========================================================================
-- Term
-- ===========================================================================
-- nnoremap <C-t> :ToggleTermToggleAll<CR>
vim.api.nvim_set_keymap("n", "<C-t>", ":ToggleTerm<CR>", { noremap = true, silent = true })

-- ===========================================================================
-- which key
-- ===========================================================================
require("which-key").setup {}
require("nvim-surround").setup{}
require("nvim-autopairs").setup{}

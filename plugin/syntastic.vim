"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_python_checkers = ['flake8', 'pylint']
"let g:syntastic_python_flake8_args="--ignore=E501"
"let g:syntastic_python_pylint_args="-d C0301,C0103,C0111,W0105,W0621"

"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_typescript_checkers = ['eslint']

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" shortcuts: syntastic
" these are now mapped in telescope
"map <leader>s :SyntasticCheck<CR>
"map <leader>d :SyntasticReset<CR>


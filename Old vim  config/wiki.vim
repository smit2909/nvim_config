"function Check()
"    let l:line=getline('.')
"    let l:curs=winsaveview()
"    if l:line=~?'\s*-\s*\[\s*\].*'
"        s/\[\s*\]/[.]/
"    elseif l:line=~?'\s*-\s*\[\.\].*'
"        s/\[.\]/[x]/
"    elseif l:line=~?'\s*-\s*\[x\].*'
"        s/\[x\]/[ ]/
"    endif
"    call winrestview(l:curs)
"endfunction
"
"
"let wiki = {}
"let wiki.nested_syntaxes = {'python': 'python', 'sh': 'sh'}
"let g:vimwiki_list = [wiki]
""autocmd FileType markdown nnoremap <silent> - :call Check()<CR>
"
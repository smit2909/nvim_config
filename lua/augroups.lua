vim.cmd [[
" =====================================================================================================================
" Augroups and some functions
" =====================================================================================================================

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" html, css and javascript will have tab as 4 spaces
augroup filetype_html
    autocmd!
    :autocmd FileType html setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
augroup end

augroup filetype_css
    autocmd!
    :autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
augroup end

augroup filetype_javascript
    autocmd!
    :autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
augroup end

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

augroup terminal_buffer
    autocmd!
    autocmd TermOpen * setlocal bufhidden=hide
augroup END

augroup code_fmt
  autocmd!
  autocmd BufWritePre *.go lua goimports(100)
  "autocmd BufWritePost *.js,*.html,*.go,*.json,*.proto FormatWrite
  autocmd BufWritePre  *.go,*.py,*.proto,*.lua lua vim.lsp.buf.formatting_sync(nil, 3000)
augroup END

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 80})
augroup END


let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

" disabling the arrow keys
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  exec 'inoremap' key '<Nop>'
  "  exec 'cnoremap' key '<Nop>'
endfor
]]

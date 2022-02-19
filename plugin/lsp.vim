set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

"" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap vsh <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gr    <cmd>lua require'telescope.builtin'.lsp_references()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>vrn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>cd   <cmd>lua vim.diagnostic.open_float({})<CR>
"nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
"nnoremap <leader>f      <cmd>lua vim.lsp.buf.formatting()<CR>

nmap <leader>tt  <Plug>(toggle-lsp-diag)
nnoremap gp <cmd>lua require('goto-preview').goto_preview_definition()<CR>

" OLD NVIM COMPE CONFIG
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'disable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

hi DiagnosticUnderlineError guisp=red gui=undercurl
hi DiagnosticUnderlineWarn guisp=orange gui=undercurl
hi DiagnosticUnderlineInfo guisp=yellow gui=undercurl
hi DiagnosticUnderlineHint guisp=green gui=undercurl

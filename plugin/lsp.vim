lua <<EOF
local empty_handler = function (_, _, _, client_id, _)
    print(vim.inspect(client_id))
    return {}
end

vim.lsp.handlers['textDocument/documentSymbol'] = empty_handler

require'lspconfig'.efm.setup{
    filetypes = { "python" },
    settings = {
            rootMarkers = {".git/"},
        }
}

require'lspconfig'.pyright.setup{}
-- require'lspconfig'.pylsp.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.bashls.setup{}
require 'lspsaga'

require "lsp_signature".setup{
    hint_enable = true, -- virtual hint enable
    hint_prefix = "🐼 ",  -- Panda for parameter
    hint_scheme = "String",
    use_lspsaga = false,  -- set to true if you want to use lspsaga popup
    hi_parameter = "Search", -- how your parameter will be highlight
    use_lspsaga=true,
    }
require('smit.lspkind').init({
 with_text = true,
 symbol_map = {
   Text = '',
   Method = 'ƒ',
   Function = '',
   Constructor = '',
   Variable = '',
   Class = '',
   Interface = 'ﰮ',
   Module = '',
   Property = '',
   Unit = '',
   Value = '',
   Enum = '了',
   Keyword = '',
   Snippet = '﬌',
   Color = '',
   File = '',
   Folder = '',
   EnumMember = '',
   Constant = '',
   Struct = ''
 },
})


EOF

"require'lspconfig'.jedi_language_server.setup{ on_attach=require'completion'.on_attach }
"require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }


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
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
" nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
"nnoremap <leader>f      <cmd>lua vim.lsp.buf.formatting()<CR>

" lsp saga mappings
nnoremap <silent>vrn :Lspsaga rename<CR>
nnoremap <silent> K :Lspsaga hover_doc<CR>
nnoremap <leader>vn <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
"nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
"nnoremap <silent>vrn <cmd>lua require('lspsaga.rename').rename()<CR>

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.emoji = v:true
let g:compe.source.treesitter = v:true
let g:compe.source.spell = v:true

inoremap <silent><expr> <CR>      compe#confirm('<CR>')
